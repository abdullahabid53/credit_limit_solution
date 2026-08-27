<?php

getpost_ifset(array('id', 'prefix', 'operator', 'description', 'active'));

$HD_Form = new FormHandler("cc_sip_free_numbers", gettext("SIP Free Number"));

$HD_Form->FG_DEBUG               = 0;
$HD_Form->FG_TABLE_DEFAULT_ORDER = "operator, prefix";
$HD_Form->FG_TABLE_DEFAULT_SENS  = "ASC";

/* LIST VIEW */
$HD_Form->AddViewElement(gettext("ID"),          "id",          "5%",  "center", "sort");
$HD_Form->AddViewElement(gettext("PREFIX"),      "prefix",      "20%", "center", "sort");
$HD_Form->AddViewElement(gettext("OPERATOR"),    "operator",    "20%", "center", "sort");
$HD_Form->AddViewElement(gettext("DESCRIPTION"), "description", "30%", "center", "sort");
$HD_Form->AddViewElement(gettext("ACTIVE"),      "active",      "10%", "center", "sort");
$HD_Form->FieldViewElement("id, prefix, operator, description, active");

$HD_Form->CV_NO_FIELDS                      = gettext("NO FREE NUMBERS FOUND");
$HD_Form->CV_DISPLAY_LINE_TITLE_ABOVE_TABLE = false;
$HD_Form->CV_DISPLAY_FILTER_ABOVE_TABLE     = false;

$HD_Form->FG_LIST_ADDING_BUTTON1      = true;
$HD_Form->FG_LIST_ADDING_BUTTON_LINK1 = "A2B_entity_sip_free_numbers.php?form_action=ask-add";
$HD_Form->FG_LIST_ADDING_BUTTON_ALT1  = $HD_Form->FG_LIST_ADDING_BUTTON_MSG1 = gettext("Add Free Number");

$HD_Form->FG_ADDITION = true;
$HD_Form->FG_EDITION  = true;
$HD_Form->FG_DELETION = true;

/* SELECT LISTS */
$active_list = array(
    "1" => array("Yes", "1"),
    "0" => array("No",  "0"),
);

/* FORM FIELDS */
$HD_Form->AddEditElement(
    gettext("PREFIX"), "prefix", '$value', "INPUT", "size=20 maxlength=20",
    "11", gettext("Number prefix to match (e.g. 966900 for STC 900)"), "", "", "", "", "", "", "", ""
);
$HD_Form->AddEditElement(
    gettext("OPERATOR"), "operator", '$value', "INPUT", "size=30 maxlength=50",
    "11", gettext("Operator name (e.g. STC, Mobily, Zain)"), "", "", "", "", "", "", "", ""
);
$HD_Form->AddEditElement(
    gettext("DESCRIPTION"), "description", '$value', "INPUT", "size=50 maxlength=100",
    "", gettext("Human-readable description (optional)"), "", "", "", "", "", "", "NO", ""
);
$HD_Form->AddEditElement(
    gettext("ACTIVE"), "active", "1", "SELECT", "",
    "", "", "list", "", "", "", $active_list, "%1", "", ""
);

$HD_Form->FieldEditElement("prefix, operator, description, active");

$HD_Form->FG_INTRO_TEXT_ADD          = gettext("Add a free operator care number prefix.");
$HD_Form->FG_INTRO_TEXT_EDITION      = gettext("Modify the free number prefix.");
$HD_Form->FG_INTRO_TEXT_ASK_DELETION = gettext("Remove this free number prefix?");
$HD_Form->FG_INTRO_TEXT_ADITION      = '';
$HD_Form->FG_TEXT_ADITION_CONFIRMATION = gettext("Free number prefix saved.");

$HD_Form->FG_GO_LINK_AFTER_ACTION_ADD    = "A2B_entity_sip_free_numbers.php?form_action=list&id=";
$HD_Form->FG_GO_LINK_AFTER_ACTION_EDIT   = "A2B_entity_sip_free_numbers.php?form_action=list&id=";
$HD_Form->FG_GO_LINK_AFTER_ACTION_DELETE = "A2B_entity_sip_free_numbers.php?form_action=list&id=";
