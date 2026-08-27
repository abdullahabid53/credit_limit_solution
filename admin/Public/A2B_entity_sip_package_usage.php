<?php

include '../lib/admin.defines.php';
include '../lib/admin.module.access.php';
include '../lib/Form/Class.FormHandler.inc.php';
include './form_data/FG_var_sip_package_usage.inc';
include '../lib/admin.smarty.php';

if (!has_rights(ACX_CALL_REPORT)) {
    Header("HTTP/1.0 401 Unauthorized");
    Header("Location: PP_error.php?c=accessdenied");
    die();
}

$HD_Form->setDBHandler(DbConnect());
$HD_Form->init();

if (!isset($form_action)) $form_action = "list";
if (!isset($action))      $action      = $form_action;

$list = $HD_Form->perform_action($form_action);

$smarty->display('main.tpl');

// Usage summary banner: total used minutes per category for the current filter
if ($assignment_filter > 0) {
    $DBH = DbConnect();
    $res = $DBH->Execute(
        "SELECT number_category, SUM(used_seconds) AS total_sec
         FROM cc_sip_package_usage
         WHERE assignment_id = $assignment_filter
         GROUP BY number_category
         ORDER BY number_category"
    );
    if ($res && !$res->EOF) {
        echo '<div style="background:#f0f4f8;border:1px solid #ccc;padding:8px 16px;margin:8px 0;border-radius:4px;">';
        echo '<strong>' . gettext("Usage Summary — Assignment #$assignment_filter") . '</strong><br>';
        echo '<table style="margin-top:6px;border-collapse:collapse;" cellpadding="4">';
        echo '<tr><th style="text-align:left;">Category</th><th style="text-align:right;">Total Minutes</th></tr>';
        while (!$res->EOF) {
            $row  = $res->fields;
            $mins = round($row['total_sec'] / 60, 2);
            echo '<tr><td>' . htmlspecialchars($row['number_category']) . '</td>';
            echo '<td style="text-align:right;">' . $mins . '</td></tr>';
            $res->MoveNext();
        }
        echo '</table></div>';
    }
}

$HD_Form->create_toppage($form_action);
$HD_Form->create_form($form_action, $list, $id = null);
$smarty->display('footer.tpl');
