<?php

include '../lib/admin.defines.php';
include '../lib/admin.module.access.php';
include '../lib/Form/Class.FormHandler.inc.php';
include './form_data/FG_var_sip_package_rate.inc';
include '../lib/admin.smarty.php';

if (!has_rights(ACX_PACKAGEOFFER)) {
    Header("HTTP/1.0 401 Unauthorized");
    Header("Location: PP_error.php?c=accessdenied");
    die();
}

$HD_Form->setDBHandler(DbConnect());
$HD_Form->init();

if ($id != "" || !is_null($id)) {
    $HD_Form->FG_EDITION_CLAUSE = str_replace("%id", "$id", $HD_Form->FG_EDITION_CLAUSE);
}

if (!isset($form_action)) $form_action = "list";
if (!isset($action))      $action      = $form_action;

$list = $HD_Form->perform_action($form_action);

$smarty->display('main.tpl');

// Show package context banner when filtering by package
if ($pkg_id_filter > 0) {
    $pkg_res = DbConnect()->Execute(
        "SELECT name, package_type, cap_minutes FROM cc_sip_package WHERE id = $pkg_id_filter LIMIT 1"
    );
    if ($pkg_res && !$pkg_res->EOF) {
        $pkg_row  = $pkg_res->fields;
        $pkg_type = ucfirst($pkg_row['package_type']);
        echo '<div style="background:#016774;color:#fff;padding:8px 16px;margin:8px 0;border-radius:4px;">';
        echo '<strong>' . htmlspecialchars($pkg_row['name']) . '</strong>';
        echo ' &mdash; ' . $pkg_type;
        if ($pkg_row['package_type'] === 'capped') {
            echo ' &mdash; ' . (int)$pkg_row['cap_minutes'] . ' min cap';
        }
        echo ' &nbsp; <a href="A2B_entity_sip_package.php?form_action=list" style="color:#ffd;font-size:0.9em;">&larr; Back to Packages</a>';
        echo '</div>';
    }
}

$HD_Form->create_toppage($form_action);
$HD_Form->create_form($form_action, $list, $id = null);
$smarty->display('footer.tpl');
