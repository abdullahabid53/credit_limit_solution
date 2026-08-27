<?php

getpost_ifset(array(
    'id', 'package_id', 'assignment_level', 'account_id', 'contract_id',
    'effective_date', 'end_date', 'next_package_id', 'next_effective', 'status',
    'filter_contract_id', 'filter_account_id'
));

$contract_filter = isset($filter_contract_id) ? (int) $filter_contract_id : 0;
$account_filter  = isset($filter_account_id)  ? (int) $filter_account_id  : 0;

$HD_Form = new FormHandler("cc_sip_package_assignment", gettext("SIP Package Assignment"));

$HD_Form->FG_DEBUG               = 0;
$HD_Form->FG_TABLE_DEFAULT_ORDER = "effective_date";
$HD_Form->FG_TABLE_DEFAULT_SENS  = "DESC";

if ($contract_filter > 0) {
    $HD_Form->FG_TABLE_CLAUSE = "contract_id = $contract_filter";
} elseif ($account_filter > 0) {
    $HD_Form->FG_TABLE_CLAUSE = "account_id = $account_filter";
}

/* LIST VIEW */
$HD_Form->AddViewElement(gettext("ID"),               "id",               "5%",  "center", "sort");
$HD_Form->AddViewElement(gettext("PACKAGE ID"),        "package_id",       "8%",  "center", "sort");
$HD_Form->AddViewElement(gettext("LEVEL"),             "assignment_level", "10%", "center", "sort");
$HD_Form->AddViewElement(gettext("CONTRACT ID"),       "contract_id",      "9%",  "center", "sort");
$HD_Form->AddViewElement(gettext("ACCOUNT ID"),        "account_id",       "9%",  "center", "sort");
$HD_Form->AddViewElement(gettext("EFFECTIVE DATE"),    "effective_date",   "12%", "center", "sort");
$HD_Form->AddViewElement(gettext("END DATE"),          "end_date",         "12%", "center", "sort");
$HD_Form->AddViewElement(gettext("NEXT PKG ID"),       "next_package_id",  "9%",  "center", "sort");
$HD_Form->AddViewElement(gettext("STATUS"),            "status",           "7%",  "center", "sort");
$HD_Form->FieldViewElement("id, package_id, assignment_level, contract_id, account_id, effective_date, end_date, next_package_id, status");

$HD_Form->CV_NO_FIELDS                      = gettext("NO ASSIGNMENTS FOUND");
$HD_Form->CV_DISPLAY_LINE_TITLE_ABOVE_TABLE = false;
$HD_Form->CV_DISPLAY_FILTER_ABOVE_TABLE     = false;

$HD_Form->FG_LIST_ADDING_BUTTON1      = true;
$HD_Form->FG_LIST_ADDING_BUTTON_LINK1 = "A2B_entity_sip_package_assignment.php?form_action=ask-add&effective_date=".date('Y-m-d');
$HD_Form->FG_LIST_ADDING_BUTTON_ALT1  = $HD_Form->FG_LIST_ADDING_BUTTON_MSG1 = gettext("Add Assignment");

$HD_Form->FG_ADDITION = true;
$HD_Form->FG_EDITION  = true;
$HD_Form->FG_DELETION = true;

/* SELECT LISTS */
$level_list = array(
    "contract" => array("Contract", "contract"),
    "account"  => array("Account",  "account"),
);
$status_list = array(
    "1" => array("Active",   "1"),
    "0" => array("Inactive", "0"),
);

/* PACKAGE DROPDOWN — active packages only */
$DBHandle_pkg  = DbConnect();
$res_pkg       = $DBHandle_pkg->Execute("SELECT id, name, package_type FROM cc_sip_package WHERE status = 1 ORDER BY name");
$package_list  = array();
$first_pkg_id  = '';
if ($res_pkg) {
    while (!$res_pkg->EOF) {
        $row        = $res_pkg->fields;
        $type_label = ($row['package_type'] === 'capped') ? 'Capped' : 'Uncapped';
        if ($first_pkg_id === '') $first_pkg_id = (string)$row['id'];
        $package_list[(string)$row['id']] = array($row['name'] . ' [' . $type_label . ']', (string)$row['id']);
        $res_pkg->MoveNext();
    }
}

/*
 * Validation codes:
 *   ""   = no validation (is_numeric("") is false — skips validation block entirely)
 *         Use for SELECT fields and optional text fields.
 *   "5"  = YYYY-MM-DD date format
 *   "11" = at least 2 characters (required text)
 *
 * "NO" in check_emptyvalue (index 13) = skip regex when field is empty (optional field).
 */
$HD_Form->AddEditElement(
    gettext("PACKAGE"), "package_id", $first_pkg_id, "SELECT", "",
    "check_select", "", "list", "", "", "", $package_list, "%1", "", ""
);
$HD_Form->AddEditElement(
    gettext("ASSIGNMENT LEVEL"), "assignment_level", "contract", "SELECT", "",
    "", "", "list", "", "", "", $level_list, "%1", "", ""
);
$HD_Form->AddEditElement(
    gettext("CONTRACT ID"), "contract_id", '$value', "INPUT", "size=12 maxlength=12",
    "4", gettext("cc_card.id — required when assignment level is Contract"), "", "", "", "", "", "", "NO", ""
);
$HD_Form->AddEditElement(
    gettext("ACCOUNT ID"), "account_id", '$value', "INPUT", "size=12 maxlength=12",
    "4", gettext("cc_card_customer.id — required when assignment level is Account"), "", "", "", "", "", "", "NO", ""
);
$HD_Form->AddEditElement(
    gettext("EFFECTIVE DATE"), "effective_date", date('Y-m-d'), "INPUT", "type=date style=\"width:160px\"",
    "", gettext("Start date"), "", "", "", "", "", "", "", ""
);
$HD_Form->AddEditElement(
    gettext("END DATE"), "end_date", '$value', "INPUT", "type=date style=\"width:160px\"",
    "", gettext("Expiry date — leave blank for no expiry"), "", "", "", "", "", "", "NO", ""
);
$HD_Form->AddEditElement(
    gettext("NEXT PACKAGE ID"), "next_package_id", '$value', "INPUT", "size=12 maxlength=12",
    "4", gettext("ID of the package to switch to on next billing reset"), "", "", "", "", "", "", "NO", ""
);
$HD_Form->AddEditElement(
    gettext("NEXT EFFECTIVE DATE"), "next_effective", '$value', "INPUT", "type=date style=\"width:160px\"",
    "", gettext("Date the next package becomes active"), "", "", "", "", "", "", "NO", ""
);
$HD_Form->AddEditElement(
    gettext("STATUS"), "status", "1", "SELECT", "",
    "", "", "list", "", "", "", $status_list, "%1", "", ""
);

$HD_Form->FieldEditElement("package_id, assignment_level, contract_id, account_id, effective_date, end_date, next_package_id, next_effective, status");

$HD_Form->FG_INTRO_TEXT_ADD          = gettext("Assign a SIP package to a contract or account.");
$HD_Form->FG_INTRO_TEXT_EDITION      = gettext("Modify the package assignment.");
$HD_Form->FG_INTRO_TEXT_ASK_DELETION = gettext("Remove this package assignment?");
$HD_Form->FG_INTRO_TEXT_ADITION      = '';
$HD_Form->FG_TEXT_ADITION_CONFIRMATION = gettext("Assignment saved.");

$HD_Form->FG_GO_LINK_AFTER_ACTION_ADD    = "A2B_entity_sip_package_assignment.php?form_action=list&id=";
$HD_Form->FG_GO_LINK_AFTER_ACTION_EDIT   = "A2B_entity_sip_package_assignment.php?form_action=list&id=";
$HD_Form->FG_GO_LINK_AFTER_ACTION_DELETE = "A2B_entity_sip_package_assignment.php?form_action=list&id=";
