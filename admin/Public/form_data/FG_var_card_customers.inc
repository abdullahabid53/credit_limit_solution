<?php

/* vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4: */

getpost_ifset(array(
    'id',
    'name',
    'account_number',
    'email',
    'credit_limit',
    'status',
    'popup_select',
    'popup_formname',
    'popup_fieldname',
    'cardnumberlenght_list'
));

$HD_Form = new FormHandler("cc_card_customer", gettext("Customer"));

$HD_Form->FG_DEBUG = 0;
$HD_Form->FG_TABLE_ID = "id";
$HD_Form->FG_TABLE_DEFAULT_SENS = "ASC";
$HD_Form->FG_LIMITE_DISPLAY = 10;
// Hide the automatic "Sort" select above the table; we use our own account-number filter
$HD_Form->CV_DISPLAY_FILTER_ABOVE_TABLE = false;
// Remove the title line above the table ("DIRECTORY")
$HD_Form->CV_DISPLAY_LINE_TITLE_ABOVE_TABLE = false;
$HD_Form->CV_TEXT_TITLE_ABOVE_TABLE = '';

/* LIST VIEW */
$HD_Form->AddViewElement(gettext("ID"), "id", "5%", "center", "sort");
$HD_Form->AddViewElement(gettext("FULL NAME"), "name", "15%", "center", "sort");
$HD_Form->AddViewElement(gettext("ACCOUNT NUMBER"), "account_number", "20%", "center", "sort");
$HD_Form->AddViewElement(gettext("EMAIL"), "email", "25%", "left", "sort");
$HD_Form->AddViewElement(gettext("CREDIT LIMIT"), "credit_limit", "15%", "center", "sort");
$HD_Form->AddViewElement(gettext("STATUS"), "status", "10%", "center", "sort");

$HD_Form->FieldViewElement("id, name, account_number, email, credit_limit, status");

/* SEARCH */
$HD_Form->FG_FILTER_SEARCH_FORM = true;
$HD_Form->AddSearchElement_C1(gettext("FULL NAME"), 'name', 'nametype');
$HD_Form->AddSearchElement_C1(gettext("ACCOUNT NUMBER"), 'account_number', 'accountnumbertype');
$HD_Form->AddSearchElement_C1(gettext("EMAIL"), 'email', 'emailtype');

$HD_Form -> FG_FILTER_APPLY = true;
$HD_Form -> FG_FILTERFIELD = 'account_number';
$HD_Form -> FG_FILTERFIELDNAME = gettext('Account Number');
$HD_Form -> FG_FILTER_FORM_ACTION = 'list';

// Apply simple prefix filter when provided (same pattern as other FG_var files)
if (isset($filterprefix) && (strlen($filterprefix) > 0)) {
    $HD_Form->FG_TABLE_CLAUSE .= "account_number like '$filterprefix%'";
}

/* FORM SETTINGS */
$HD_Form->FG_ADDITION = true;
$HD_Form->FG_EDITION = true;
$HD_Form->FG_DELETION = true;

/* FIELD DEFINITIONS - EXACT PATTERN FROM WORKING CODE */

// Name - Required field with proper validation
$HD_Form->AddEditElement(
    gettext("FULL NAME"),
    "name",
    '$value',                     // CRITICAL: Use '$value' not ""
    "INPUT",
    "size=40 maxlength=255",
    "11",                         // Text validation
    gettext("Enter customer full name"),
    "", "", "", "", "", "", "", "",
    null, null,
    gettext("Customer Information")
);

// Account Number - Required
$HD_Form->AddEditElement(
    gettext("ACCOUNT NUMBER"),
    "account_number",
    '$value',                     // CRITICAL: Use '$value'
    "INPUT",
    "size=30 maxlength=100",
    "11",                         // Text validation  
    gettext("Enter unique account number"),
    "", "", "", "", "", "", "", ""
);

// Email - Optional
$HD_Form->AddEditElement(
    gettext("EMAIL"),
    "email",
    '$value',                     // CRITICAL: Use '$value'
    "INPUT",
    "size=40 maxlength=255",
    "",                           // No validation - optional
    gettext("Enter email address"),
    "", "", "", "", "", "", "NO", ""
);

// Credit Limit - Required numeric
$HD_Form->AddEditElement(
    gettext("CREDIT LIMIT"),
    "credit_limit",
    "",                           // Empty for add, will use POST value
    "INPUT",
    "size=20 maxlength=20",       // REMOVED type='number' - might cause issues
    "4",                          // Numeric validation
    gettext("Insert the credit limit"),
    "", "", "", "", "", "", "NO-NULL",
    gettext("Credit limit is only used for the postpaid account.")
);

// Status - Required select
$status_list = array(
    "1" => array("Active", "1"),
    "0" => array("Inactive", "0")
);

$HD_Form->AddEditElement(
    gettext("STATUS"),
    "status",
    "1",                          // Default to Active
    "SELECT",
    "",
    "",
    "",
    "list",
    "",
    "",
    "",
    $status_list,
    "%1",
    "",
    ""
);

/* FIELD MAPPING - MUST MATCH EXACTLY */
$HD_Form->FieldEditElement(
    "name, account_number, email, credit_limit, status"
);

// Success messages
$HD_Form->FG_INTRO_TEXT_ADITION = '';
$HD_Form->FG_TEXT_ADITION_CONFIRMATION = gettext("Your new") . " " . $HD_Form->FG_INSTANCE_NAME . " " . gettext("has been inserted.") . "<br>";

// Button text
$HD_Form->FG_BUTTON_ADITION_BOTTOM_TEXT = gettext("Click Confirm to Save");

?>
