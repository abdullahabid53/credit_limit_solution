<?php

getpost_ifset(array('id', 'assignment_id', 'billing_month', 'number_category', 'filter_assignment_id'));

$assignment_filter = isset($filter_assignment_id) ? (int) $filter_assignment_id : 0;

$HD_Form = new FormHandler("cc_sip_package_usage", gettext("SIP Package Usage"));

$HD_Form->FG_DEBUG               = 0;
$HD_Form->FG_TABLE_DEFAULT_ORDER = "billing_month DESC, assignment_id";
$HD_Form->FG_TABLE_DEFAULT_SENS  = "DESC";

if ($assignment_filter > 0) {
    $HD_Form->FG_TABLE_CLAUSE = "assignment_id = $assignment_filter";
}

/* LIST VIEW — read only */
$HD_Form->AddViewElement(gettext("ID"),              "id",              "5%",  "center", "sort");
$HD_Form->AddViewElement(gettext("ASSIGNMENT ID"),   "assignment_id",   "12%", "center", "sort");
$HD_Form->AddViewElement(gettext("BILLING MONTH"),   "billing_month",   "15%", "center", "sort");
$HD_Form->AddViewElement(gettext("CATEGORY"),        "number_category", "15%", "center", "sort");
$HD_Form->AddViewElement(gettext("USED (SECONDS)"),  "used_seconds",    "15%", "center", "sort");
$HD_Form->FieldViewElement("id, assignment_id, billing_month, number_category, used_seconds");

$HD_Form->CV_NO_FIELDS                      = gettext("NO USAGE RECORDS FOUND");
$HD_Form->CV_DISPLAY_LINE_TITLE_ABOVE_TABLE = false;
$HD_Form->CV_DISPLAY_FILTER_ABOVE_TABLE     = false;

/* Read-only — no add, edit, or delete */
$HD_Form->FG_ADDITION = false;
$HD_Form->FG_EDITION  = false;
$HD_Form->FG_DELETION = false;
