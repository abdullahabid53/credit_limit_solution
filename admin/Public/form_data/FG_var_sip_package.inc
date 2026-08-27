<?php

getpost_ifset(array('id', 'name', 'code', 'package_type', 'cap_minutes', 'reset_day', 'status', 'description'));

$HD_Form = new FormHandler("cc_sip_package", gettext("SIP Package"));

$HD_Form->FG_DEBUG              = 0;
$HD_Form->FG_TABLE_DEFAULT_ORDER = "name";
$HD_Form->FG_TABLE_DEFAULT_SENS  = "ASC";

/* LIST VIEW */
$HD_Form->AddViewElement(gettext("ID"),           "id",           "5%",  "center", "sort");
$HD_Form->AddViewElement(gettext("NAME"),         "name",         "22%", "center", "sort");
$HD_Form->AddViewElement(gettext("CODE"),         "code",         "12%", "center", "sort");
$HD_Form->AddViewElement(gettext("TYPE"),         "package_type", "10%", "center", "sort");
$HD_Form->AddViewElement(gettext("CAP (MINS)"),   "cap_minutes",  "10%", "center", "sort");
$HD_Form->AddViewElement(gettext("RESET DAY"),    "reset_day",    "10%", "center", "sort");
$HD_Form->AddViewElement(gettext("STATUS"),       "status",       "8%",  "center", "sort");
$HD_Form->FieldViewElement("id, name, code, package_type, cap_minutes, reset_day, status");

$HD_Form->FG_ACTION_SIZE_COLUMN             = '15%';
$HD_Form->CV_NO_FIELDS                      = gettext("NO SIP PACKAGES FOUND");
$HD_Form->CV_DISPLAY_LINE_TITLE_ABOVE_TABLE = false;
$HD_Form->CV_DISPLAY_FILTER_ABOVE_TABLE     = false;

/* ADD BUTTON */
$HD_Form->FG_LIST_ADDING_BUTTON1      = true;
$HD_Form->FG_LIST_ADDING_BUTTON_LINK1 = "A2B_entity_sip_package.php?form_action=ask-add";
$HD_Form->FG_LIST_ADDING_BUTTON_ALT1  = $HD_Form->FG_LIST_ADDING_BUTTON_MSG1 = gettext("Add SIP Package");

/* RATES BUTTON */
$HD_Form->FG_OTHER_BUTTON1      = true;
$HD_Form->FG_OTHER_BUTTON1_ALT  = gettext("Rates");
$HD_Form->FG_OTHER_BUTTON1_IMG  = "";
$HD_Form->FG_OTHER_BUTTON1_LINK = "A2B_entity_sip_package_rate.php?package_id=|param|";

$HD_Form->FG_ADDITION = true;
$HD_Form->FG_EDITION  = true;
$HD_Form->FG_DELETION = true;

/* SELECT LISTS */
$package_type_list = array(
    "capped"   => array("Capped",   "capped"),
    "uncapped" => array("Uncapped", "uncapped"),
);
$status_list = array(
    "1" => array("Active",   "1"),
    "0" => array("Inactive", "0"),
);

/* Reset day dropdown 1–28 */
$reset_day_list = array();
for ($d = 1; $d <= 28; $d++) {
    $reset_day_list[$d] = array((string)$d, (string)$d);
}

/* FORM FIELDS */
$HD_Form->AddEditElement(
    gettext("NAME"), "name", '$value', "INPUT", "size=40 maxlength=100",
    "11", gettext("Package name (required)"), "", "", "", "", "", "", "", ""
);
$HD_Form->AddEditElement(
    gettext("CODE"), "code", '$value', "INPUT", "size=20 maxlength=30",
    "", gettext("Unique short code (letters/numbers, optional)"), "", "", "", "", "", "", "NO", ""
);
$HD_Form->AddEditElement(
    gettext("PACKAGE TYPE"), "package_type", '$value', "SELECT", "",
    "", gettext("Capped = limited minutes; Uncapped = rate-only"), "list", "", "", "", $package_type_list, "%1", "", ""
);
$HD_Form->AddEditElement(
    gettext("CAP MINUTES"), "cap_minutes", '$value', "INPUT", "size=10 maxlength=10",
    "4", gettext("Monthly cap in minutes (0 = unlimited; leave blank for uncapped)"), "", "", "", "", "", "", "NO", ""
);
$HD_Form->AddEditElement(
    gettext("RESET DAY"), "reset_day", '$value', "SELECT", "",
    "", gettext("Day of month the billing cycle resets (1–28)"), "list", "", "", "", $reset_day_list, "%1", "", ""
);
$HD_Form->AddEditElement(
    gettext("STATUS"), "status", "1", "SELECT", "",
    "", "", "list", "", "", "", $status_list, "%1", "", ""
);
$HD_Form->AddEditElement(
    gettext("DESCRIPTION"), "description", '$value', "TEXTAREA", "rows=3 cols=40",
    "", "", "", "", "", "", "", "", "NO", ""
);

$HD_Form->FieldEditElement("name, code, package_type, cap_minutes, reset_day, status, description");

$HD_Form->FG_INTRO_TEXT_ADD           = gettext("Fill in the fields to create a new SIP Package.");
$HD_Form->FG_INTRO_TEXT_EDITION       = gettext("Modify the SIP Package properties.");
$HD_Form->FG_INTRO_TEXT_ASK_DELETION  = gettext("Are you sure you want to remove this SIP Package?");
$HD_Form->FG_INTRO_TEXT_ADITION       = '';
$HD_Form->FG_TEXT_ADITION_CONFIRMATION = gettext("SIP Package saved successfully.");

$HD_Form->FG_GO_LINK_AFTER_ACTION_ADD    = "A2B_entity_sip_package.php?form_action=list&id=";
$HD_Form->FG_GO_LINK_AFTER_ACTION_EDIT   = "A2B_entity_sip_package.php?form_action=list&id=";
$HD_Form->FG_GO_LINK_AFTER_ACTION_DELETE = "A2B_entity_sip_package.php?form_action=list&id=";
