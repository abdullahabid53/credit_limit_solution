<?php

getpost_ifset(array('id', 'package_id', 'number_category', 'direction', 'network_type', 'inbundle_rate', 'payg_rate', 'charge_party'));

$pkg_id_filter  = isset($package_id) ? (int) $package_id : 0;
$default_pkg_id = $pkg_id_filter > 0 ? (string)$pkg_id_filter : '';

$HD_Form = new FormHandler("cc_sip_package_rate", gettext("SIP Package Rate"));

$HD_Form->FG_DEBUG               = 0;
$HD_Form->FG_TABLE_DEFAULT_ORDER = "package_id, number_category";
$HD_Form->FG_TABLE_DEFAULT_SENS  = "ASC";

if ($pkg_id_filter > 0) {
    $HD_Form->FG_TABLE_CLAUSE = "package_id = $pkg_id_filter";
}

/* LIST VIEW */
$HD_Form->AddViewElement(gettext("ID"),            "id",              "5%",  "center", "sort");
$HD_Form->AddViewElement(gettext("PKG ID"),        "package_id",      "7%",  "center", "sort");
$HD_Form->AddViewElement(gettext("CATEGORY"),      "number_category", "12%", "center", "sort");
$HD_Form->AddViewElement(gettext("DIRECTION"),     "direction",       "10%", "center", "sort");
$HD_Form->AddViewElement(gettext("NETWORK"),       "network_type",    "10%", "center", "sort");
$HD_Form->AddViewElement(gettext("INBUNDLE RATE"), "inbundle_rate",   "12%", "center", "sort");
$HD_Form->AddViewElement(gettext("PAYG RATE"),     "payg_rate",       "12%", "center", "sort");
$HD_Form->AddViewElement(gettext("CHARGE PARTY"),  "charge_party",    "12%", "center", "sort");
$HD_Form->FieldViewElement("id, package_id, number_category, direction, network_type, inbundle_rate, payg_rate, charge_party");

$HD_Form->CV_NO_FIELDS                      = gettext("NO RATE ROWS FOUND FOR THIS PACKAGE");
$HD_Form->CV_DISPLAY_LINE_TITLE_ABOVE_TABLE = false;
$HD_Form->CV_DISPLAY_FILTER_ABOVE_TABLE     = false;

$add_extra = $pkg_id_filter > 0 ? "&package_id=$pkg_id_filter" : "";
$HD_Form->FG_LIST_ADDING_BUTTON1      = true;
$HD_Form->FG_LIST_ADDING_BUTTON_LINK1 = "A2B_entity_sip_package_rate.php?form_action=ask-add$add_extra";
$HD_Form->FG_LIST_ADDING_BUTTON_ALT1  = $HD_Form->FG_LIST_ADDING_BUTTON_MSG1 = gettext("Add Rate Row");

$HD_Form->FG_ADDITION = true;
$HD_Form->FG_EDITION  = true;
$HD_Form->FG_DELETION = true;

/* SELECT LISTS */
$category_list = array(
    "UAN"           => array("UAN",           "UAN"),
    "TFN"           => array("TFN",           "TFN"),
    "GTS"           => array("GTS",           "GTS"),
    "Nomadic"       => array("Nomadic",       "Nomadic"),
    "ShortCode"     => array("ShortCode",     "ShortCode"),
    "International" => array("International", "International"),
);
$direction_list = array(
    "both"     => array("Both",     "both"),
    "inbound"  => array("Inbound",  "inbound"),
    "outbound" => array("Outbound", "outbound"),
);
$network_list = array(
    "both"   => array("Both",   "both"),
    "onnet"  => array("OnNet",  "onnet"),
    "offnet" => array("OffNet", "offnet"),
);
$charge_party_list = array(
    "calling" => array("Calling (A-Party)", "calling"),
    "called"  => array("Called (B-Party)",  "called"),
    "split"   => array("Split (Both)",      "split"),
);

/* PACKAGE DROPDOWN — loaded from DB */
$DBHandle_pkg = DbConnect();
$res_pkg      = $DBHandle_pkg->Execute("SELECT id, name, package_type FROM cc_sip_package WHERE status = 1 ORDER BY name");
$package_list = array();
if ($res_pkg) {
    while (!$res_pkg->EOF) {
        $row = $res_pkg->fields;
        $type_label = ($row['package_type'] === 'capped') ? 'Capped' : 'Uncapped';
        $package_list[(string)$row['id']] = array($row['name'] . ' [' . $type_label . ']', (string)$row['id']);
        $res_pkg->MoveNext();
    }
}

/*
 * Validation codes:
 *   ""   = no validation (is_numeric("") is false — validation block skipped entirely)
 *         Use this for SELECT fields; the dropdown enforces valid values.
 *   "12" = decimal number: ^(-){0,1}[0-9]+(\.){0,1}[0-9]*$
 *
 * NOTE: "0" must NOT be used for "no validation" — is_numeric("0") is true,
 * so "0" maps to FG_regular[0] = "^.{3}" (at least 3 chars), which breaks
 * single/double-digit package IDs.
 */
$HD_Form->AddEditElement(
    gettext("PACKAGE"), "package_id", $default_pkg_id, "SELECT", "",
    "", gettext("Package this rate row belongs to"), "list", "", "", "", $package_list, "%1", "", ""
);
$HD_Form->AddEditElement(
    gettext("NUMBER CATEGORY"), "number_category", "UAN", "SELECT", "",
    "", gettext("Number category this rate applies to"), "list", "", "", "", $category_list, "%1", "", ""
);
$HD_Form->AddEditElement(
    gettext("DIRECTION"), "direction", "both", "SELECT", "",
    "", gettext("Call direction"), "list", "", "", "", $direction_list, "%1", "", ""
);
$HD_Form->AddEditElement(
    gettext("NETWORK TYPE"), "network_type", "both", "SELECT", "",
    "", gettext("On-net or off-net"), "list", "", "", "", $network_list, "%1", "", ""
);
$HD_Form->AddEditElement(
    gettext("INBUNDLE RATE (SAR/min)"), "inbundle_rate", "0", "INPUT", "size=12 maxlength=12",
    "12", gettext("Rate per minute while bundle minutes remain (0 = free)"), "", "", "", "", "", "", "", ""
);
$HD_Form->AddEditElement(
    gettext("PAYG RATE (SAR/min)"), "payg_rate", "0", "INPUT", "size=12 maxlength=12",
    "12", gettext("Rate per minute after bundle is exhausted"), "", "", "", "", "", "", "", ""
);
$HD_Form->AddEditElement(
    gettext("CHARGE PARTY"), "charge_party", "calling", "SELECT", "",
    "", gettext("Who is billed for the call"), "list", "", "", "", $charge_party_list, "%1", "", ""
);

$HD_Form->FieldEditElement("package_id, number_category, direction, network_type, inbundle_rate, payg_rate, charge_party");

$HD_Form->FG_INTRO_TEXT_ADD          = gettext("Add a rate row for this package.");
$HD_Form->FG_INTRO_TEXT_EDITION      = gettext("Modify the rate row.");
$HD_Form->FG_INTRO_TEXT_ASK_DELETION = gettext("Remove this rate row?");
$HD_Form->FG_INTRO_TEXT_ADITION      = '';
$HD_Form->FG_TEXT_ADITION_CONFIRMATION = gettext("Rate row saved.");

/* FormHandler appends the new row ID to FG_GO_LINK_AFTER_ACTION_ADD,
 * so the URL must end with &id= to avoid corrupting other param values. */
$back = "A2B_entity_sip_package_rate.php?form_action=list$add_extra&id=";
$HD_Form->FG_GO_LINK_AFTER_ACTION_ADD    = $back;
$HD_Form->FG_GO_LINK_AFTER_ACTION_EDIT   = $back;
$HD_Form->FG_GO_LINK_AFTER_ACTION_DELETE = "A2B_entity_sip_package_rate.php?form_action=list$add_extra&id=";
