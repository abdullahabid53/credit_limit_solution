<?php
include '../lib/admin.defines.php';
include '../lib/admin.module.access.php';
include '../lib/admin.smarty.php';

if (!has_rights(ACX_CUSTOMER)) {
    Header("HTTP/1.0 401 Unauthorized");
    Header("Location: PP_error.php?c=accessdenied");
    die();
}

$contract_id = isset($_GET['contract_id']) ? (int)$_GET['contract_id'] : 0;
if ($contract_id <= 0) die('Invalid contract ID.');

$DBHandle = DbConnect();

$rs      = $DBHandle->Execute("SELECT id, username, firstname, lastname FROM cc_card WHERE id = $contract_id LIMIT 1");
$account = ($rs && !$rs->EOF) ? $rs->fields : null;
if (!$account) die('Contract not found.');

function fmt_time($seconds) {
    $seconds = max(0, (int)$seconds);
    $mins = (int)floor($seconds / 60);
    $secs = $seconds % 60;
    if ($mins === 0) return "{$secs} Secs";
    if ($secs === 0) return "{$mins} Mins";
    return "{$mins} Mins &amp; {$secs} Secs";
}

function sip_billing_month_view($reset_day) {
    $reset_day = max(1, min(28, (int)$reset_day));
    $today_day = (int)date('j');
    if ($today_day >= $reset_day)
        return date('Y-m-') . str_pad($reset_day, 2, '0', STR_PAD_LEFT);
    $prev = mktime(0, 0, 0, (int)date('n') - 1, $reset_day, (int)date('Y'));
    return date('Y-m-', $prev) . str_pad($reset_day, 2, '0', STR_PAD_LEFT);
}

$today = date('Y-m-d');
$sql   = "SELECT a.id AS assignment_id, a.effective_date, a.end_date,
                 p.id AS package_id, p.name AS package_name,
                 p.package_type, p.cap_minutes, p.reset_day
          FROM cc_sip_package_assignment a
          JOIN cc_sip_package p ON p.id = a.package_id AND p.status = 1
          WHERE a.contract_id = $contract_id
            AND a.status = 1
            AND a.effective_date <= '$today'
            AND (a.end_date IS NULL OR a.end_date >= '$today')
          ORDER BY a.effective_date DESC";
$rs          = $DBHandle->Execute($sql);
$assignments = [];
while ($rs && !$rs->EOF) { $assignments[] = $rs->fields; $rs->MoveNext(); }

foreach ($assignments as &$a) {
    $a['billing_month']      = sip_billing_month_view($a['reset_day']);
    $bm                      = $DBHandle->qstr($a['billing_month']);
    $aid                     = (int)$a['assignment_id'];
    $urs                     = $DBHandle->Execute(
        "SELECT number_category, used_seconds FROM cc_sip_package_usage
         WHERE assignment_id = $aid AND billing_month = $bm ORDER BY number_category");
    $a['usage'] = [];
    while ($urs && !$urs->EOF) { $a['usage'][] = $urs->fields; $urs->MoveNext(); }
    $cap_secs_for_sum         = ($a['package_type'] === 'capped') ? (int)$a['cap_minutes'] * 60 : PHP_INT_MAX;
    $a['total_used_seconds']  = array_sum(array_column($a['usage'], 'used_seconds'));
    // Cap displayed total at package cap (safety for any legacy over-counted rows)
    if ($a['package_type'] === 'capped') {
        $a['total_used_seconds'] = min($a['total_used_seconds'], $cap_secs_for_sum);
    }
}
unset($a);

$smarty->display('main.tpl');
?>
<style>
:root {
    --spu-primary:   #014952;
    --spu-accent:    #4ceadb;
    --spu-link:      #016774;
    --spu-bg:        #f5fafa;
    --spu-card-bg:   #ffffff;
    --spu-border:    #c8dede;
    --spu-text:      #23272c;
    --spu-muted:     #566060;
    --spu-ok-start:  #016774;
    --spu-ok-end:    #4ceadb;
    --spu-warn:      #d97706;
    --spu-danger:    #dc2626;
}
.spu{max-width:920px;margin:0 auto;padding:24px 20px 60px;font-family:Arial,sans-serif;background:var(--spu-bg);color:var(--spu-text)}
.spu-back{display:inline-block;margin-bottom:18px;font-size:13px;color:var(--spu-link);text-decoration:none;font-weight:600}
.spu-back:hover{text-decoration:underline}
.spu-page-title{font-size:21px;font-weight:700;color:var(--spu-primary);margin:0 0 3px}
.spu-page-sub{font-size:13px;color:var(--spu-muted);margin:0 0 22px}
.spu-card{background:var(--spu-card-bg);border:1px solid var(--spu-border);border-radius:7px;margin-bottom:22px;overflow:hidden;box-shadow:0 1px 4px rgba(1,73,82,.08)}
.spu-head{display:flex;align-items:center;justify-content:space-between;padding:13px 20px;background:var(--spu-primary);flex-wrap:wrap;gap:8px}
.spu-title{font-size:15px;font-weight:700;color:#fff}
.spu-badge{display:inline-block;padding:3px 11px;border-radius:12px;font-size:11px;font-weight:700;letter-spacing:.05em;text-transform:uppercase;background:var(--spu-accent);color:var(--spu-primary)}
.spu-meta{display:flex;gap:20px;padding:9px 20px;font-size:12px;color:var(--spu-muted);background:#e6f0f0;border-bottom:1px solid var(--spu-border);flex-wrap:wrap}
.spu-meta strong{color:var(--spu-primary)}
.spu-body{padding:16px 20px}
.spu-empty{color:#8a9a9a;font-size:13px;font-style:italic}
.spu-row{margin-bottom:14px}
.spu-row-label{display:flex;justify-content:space-between;align-items:baseline;margin-bottom:5px}
.spu-cat{font-size:13px;font-weight:600;color:var(--spu-primary)}
.spu-nums{font-size:12px;color:var(--spu-muted)}
.spu-nums strong{color:var(--spu-primary)}
.spu-track{height:10px;border-radius:5px;background:#ddecea;overflow:hidden}
.spu-fill{height:100%;border-radius:5px;transition:width .3s}
.spu-fill-ok    {background:linear-gradient(90deg,var(--spu-ok-start),var(--spu-ok-end))}
.spu-fill-warn  {background:#f59e0b}
.spu-fill-danger{background:#ef4444}
.spu-fill-full  {background:#dc2626}
.spu-pct-label{font-size:11px;color:var(--spu-muted);text-align:right;margin-top:2px}
.spu-totals{display:grid;grid-template-columns:repeat(auto-fit,minmax(110px,1fr));gap:12px;margin-top:16px;padding-top:14px;border-top:2px dashed var(--spu-border)}
.spu-stat{background:#f0f8f8;border:1px solid var(--spu-border);border-top:3px solid var(--spu-primary);border-radius:6px;padding:10px 14px;text-align:center}
.spu-stat label{display:block;font-size:10px;font-weight:700;letter-spacing:.08em;text-transform:uppercase;color:var(--spu-muted);margin-bottom:4px}
.spu-stat span{font-size:17px;font-weight:700;color:var(--spu-primary)}
.spu-stat-warn  span{color:var(--spu-warn)}
.spu-stat-danger span{color:var(--spu-danger)}
.spu-stat-ok    span{color:var(--spu-link)}
.spu-infinite{font-size:22px}
.spu-none{text-align:center;padding:48px 20px;color:#8a9a9a;font-size:14px}
</style>

<div class="spu">
  <a class="spu-back" href="javascript:history.back()">&#8592; Back</a>
  <p class="spu-page-title">SIP Package Usage</p>
  <p class="spu-page-sub">Account: <strong><?php echo htmlspecialchars($account['username']); ?></strong>
    <?php $name = trim($account['firstname'].' '.$account['lastname']); if ($name): ?>&mdash; <?php echo htmlspecialchars($name); ?><?php endif; ?>
    &mdash; Current billing cycle</p>

<?php if (empty($assignments)): ?>
  <div class="spu-none">No active SIP package assignments for this contract.</div>
<?php else: foreach ($assignments as $a):
  $capped   = ($a['package_type'] === 'capped');
  $cap_secs = $capped ? (int)$a['cap_minutes'] * 60 : 0;
  $used     = (int)$a['total_used_seconds'];
  $rem      = $capped ? max(0, $cap_secs - $used) : null;
  $pct      = ($capped && $cap_secs > 0) ? min(100, round($used / $cap_secs * 100, 1)) : 0;
  $bar_cls  = ($pct >= 100) ? 'spu-fill-full'
            : (($pct >= 85) ? 'spu-fill-danger'
            : (($pct >= 60) ? 'spu-fill-warn' : 'spu-fill-ok'));
  $stat_cls = ($pct >= 85) ? 'spu-stat-danger'
            : (($pct >= 60) ? 'spu-stat-warn' : 'spu-stat-ok');
?>
  <div class="spu-card">
    <div class="spu-head">
      <span class="spu-title"><?php echo htmlspecialchars($a['package_name']); ?></span>
      <span class="spu-badge"><?php echo ucfirst($a['package_type']); ?></span>
    </div>
    <div class="spu-meta">
      <span>Cycle: <strong><?php echo date('M j, Y', strtotime($a['billing_month'])); ?></strong></span>
      <span>Resets day <strong><?php echo (int)$a['reset_day']; ?></strong> monthly</span>
      <span>Effective: <strong><?php echo $a['effective_date']; ?></strong></span>
      <?php if (!empty($a['end_date'])): ?><span>Expires: <strong><?php echo $a['end_date']; ?></strong></span><?php endif; ?>
    </div>
    <div class="spu-body">
      <?php if (empty($a['usage'])): ?>
        <p class="spu-empty">No calls recorded this billing cycle yet.</p>
      <?php else: foreach ($a['usage'] as $u):
        $us  = $capped ? min((int)$u['used_seconds'], $cap_secs) : (int)$u['used_seconds'];
        $up  = ($capped && $cap_secs > 0) ? min(100, round($us / $cap_secs * 100, 1)) : 0;
        $ub  = ($up >= 100) ? 'spu-fill-full'
             : (($up >= 85) ? 'spu-fill-danger'
             : (($up >= 60) ? 'spu-fill-warn' : 'spu-fill-ok'));
      ?>
      <div class="spu-row">
        <div class="spu-row-label">
          <span class="spu-cat"><?php echo htmlspecialchars($u['number_category']); ?></span>
          <?php if ($capped): ?>
            <span class="spu-nums">Used <strong><?php echo fmt_time($us); ?></strong> &nbsp;/&nbsp; Cap <?php echo fmt_time($cap_secs); ?> &nbsp;&mdash;&nbsp; <?php echo $up; ?>%</span>
          <?php else: ?>
            <span class="spu-nums">Used <strong><?php echo fmt_time((int)$u['used_seconds']); ?></strong> &nbsp;(uncapped)</span>
          <?php endif; ?>
        </div>
        <?php if ($capped): ?>
        <div class="spu-track"><div class="spu-fill <?php echo $ub; ?>" style="width:<?php echo $up; ?>%"></div></div>
        <?php if ($up >= 100): ?><div class="spu-pct-label" style="color:#dc2626;font-weight:700">100% used</div><?php endif; ?>
        <?php endif; ?>
      </div>
      <?php endforeach; endif; ?>

      <div class="spu-totals">
        <?php if ($capped): ?>
          <div class="spu-stat <?php echo $stat_cls; ?>"><label>Total Used</label><span><?php echo fmt_time($used); ?></span></div>
          <div class="spu-stat <?php echo $stat_cls; ?>"><label>Remaining</label><span><?php echo fmt_time($rem); ?></span></div>
          <div class="spu-stat"><label>Total Cap</label><span><?php echo fmt_time($cap_secs); ?></span></div>
          <div class="spu-stat <?php echo $stat_cls; ?>"><label>Used</label><span><?php echo $pct; ?>%</span></div>
        <?php else: ?>
          <div class="spu-stat spu-stat-ok"><label>Total Used</label><span><?php echo fmt_time($used); ?></span></div>
          <div class="spu-stat"><label>Cap</label><span class="spu-infinite">&#8734;</span></div>
        <?php endif; ?>
      </div>

      <p style="font-size:11px;color:var(--spu-muted);margin:12px 0 0;text-align:right">
        Resets on day <?php echo (int)$a['reset_day']; ?> each month &bull;
        Current cycle started <?php echo $a['billing_month']; ?>
      </p>
    </div>
  </div>
<?php endforeach; endif; ?>
</div>

<?php $smarty->display('footer.tpl'); ?>
