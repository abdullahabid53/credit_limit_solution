<?php

/* vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4: */

/**
 * This file is part of A2Billing (http://www.a2billing.net/)
 *
 * A2Billing, Commercial Open Source Telecom Billing platform,
 * powered by Star2billing S.L. <http://www.star2billing.com/>
 *
 * @copyright   Copyright (C) 2004-2012 - Star2billing S.L.
 * @author      Belaid Arezqui <areski@gmail.com>
 * @license     http://www.fsf.org/licensing/licenses/agpl-3.0.html
 * @package     A2Billing
 *
 * Software License Agreement (GNU Affero General Public License)
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 *
**/



getpost_ifset(array('id', 'name', 'type', 'action','start','expiry', 'amount', 'is_enabled'));


$FG_INSTANCE_NAME="Promotion";
$ADDING_BUTTON_LINK1 = "A2B_entity_promotion.php?form_action=ask-add&section=".$_SESSION["menu_section"];
$ADDING_BUTTON_ALT1 = gettext("Add Promotion");
$ADDING_BUTTON_IMG1 = Images_Path ."/user_gray.png" ;


$HD_Form = new FormHandler("promotion");


$HD_Form -> FG_DEBUG = 0;
$HD_Form -> FG_TABLE_ID = " id";
// $HD_Form -> FG_TABLE_DEFAULT_ORDER = " datecreation";
// $HD_Form -> FG_TABLE_DEFAULT_SENS = "ASC";

$HD_Form ->FG_LIST_ADDING_BUTTON1 = true;
$HD_Form ->FG_LIST_ADDING_BUTTON_LINK1 = $ADDING_BUTTON_LINK1;
$HD_Form ->FG_LIST_ADDING_BUTTON_ALT1 = $HD_Form ->FG_LIST_ADDING_BUTTON_MSG1 = $ADDING_BUTTON_ALT1;
$HD_Form ->FG_LIST_ADDING_BUTTON_IMG1 = $ADDING_BUTTON_IMG1;


// if (is_numeric($groupID)) {
// 	$FG_TABLE_CLAUSE = "groupid='$groupID'";
// }
// //else select all

// $HD_Form -> FG_TABLE_CLAUSE = $FG_TABLE_CLAUSE;
$status_list = Constants::getPromotionStateList();

$HD_Form -> AddViewElement(gettext("ID"), "id", "", "center", "sort");
$HD_Form -> AddViewElement(gettext("NAME"), "name", "", "center", "sort");
$HD_Form -> AddViewElement(gettext("TYPE"), "type", "", "center", "sort");
$HD_Form -> AddViewElement(gettext("ACTION"), "action", "", "center", "sort");
$HD_Form -> AddViewElement(gettext("START DATE"), "start", "", "center", "sort", "19", "", "", "", "", "", "display_dateformat");
$HD_Form -> AddViewElement(gettext("END DATE"), "expiry", "", "center", "sort", "19", "", "", "", "", "", "display_dateformat");
$HD_Form -> AddViewElement(gettext("AMOUNT"), "amount", "", "center", "sort");
$HD_Form -> AddViewElement(gettext("STATUS"), "is_enabled", "", "center", "sort", "", "list", $status_list);

$HD_Form -> FieldViewElement ('id, name, type, action, start, expiry, amount, is_enabled');

$HD_Form -> CV_NO_FIELDS  = gettext("NO")." ".strtoupper($HD_Form->FG_INSTANCE_NAME)." ".gettext("HAVE BEEN CREATED!");
$HD_Form -> CV_DISPLAY_LINE_TITLE_ABOVE_TABLE = false;
$HD_Form -> CV_TEXT_TITLE_ABOVE_TABLE = '';
$HD_Form -> CV_DISPLAY_FILTER_ABOVE_TABLE = false;


if (!$popup_select) {
	$HD_Form -> FG_ADDITION = true;
	$HD_Form -> FG_INFO = true;
	$HD_Form -> FG_INFO_LINK = "A2B_admin_info.php?groupID=$groupID&id=";
}

if (has_rights (ACX_MODIFY_ADMINS) && !($popup_select)) {
	$HD_Form -> FG_DELETION = true;
	$HD_Form -> FG_EDITION = true;

	if ($form_action!="ask-add" && $form_action!="add") {
		$HD_Form -> AddEditElement (gettext("ID"),
			"id",
			'$value',
			"INPUT",
			"size=8 READONLY maxlength=6",
			"4",
			gettext("Insert the id"),
			"" , "", "", "", "", "", "", "" );
	}

	$HD_Form -> AddEditElement (gettext("Name"),
		"name",
		'$value',
		"INPUT",
		"size=30 maxlength=255",
		"3",
		gettext("Insert the name"),
		"" , "", "", "", "" , "", "", "");

	$right_list = array();
	$right_list["1"] = array( gettext("MINUTES"), "minutes");
	$right_list["2"] = array( gettext("BALANCE"), "balance");
	
	$len_right_list = count($right_list);
	$HD_Form -> AddEditElement (gettext("TYPE"),
		"type",
		'$value',
		"SELECT",
		"",
		"", "",
		"list", "", "description, id", "", $right_list, "%1" , "",
		gettext("Select the type of promotion") );

	$action_list = array();
	$action_list["1"] = array( gettext("SEASONAL"), "seasonal");
	$action_list["2"] = array( gettext("RECHARGE"), "recharge");
	$len_action_list = count($action_list);
	$HD_Form -> AddEditElement (gettext("ACTION"),
		"action",
		'$value',
		"SELECT",
		"",
		"", "",
		"list", "", "description, id", "", $action_list, "%1" , "",
		gettext("Select the action of promotion") );


	$HD_Form -> AddEditElement (gettext("START DATE"),
		"start",
		'$value',
		"INPUT",
		"size=60 maxlength=50 type=datetime-local",
		"",
		gettext("Insert the start date"),
		"" , "", "", "", "", "", "", "");

	$HD_Form -> AddEditElement (gettext("END DATE"),
		"expiry",
		'$value',
		"INPUT",
		"size=60 maxlength=50 type=datetime-local",
		"",
		gettext("Insert the end date"),
		"" , "", "", "", "", "", "", "");

		$HD_Form -> AddEditElement (gettext("VALIDITY PERIOD"),
		"validity",
		'$value',
		"INPUT",
		"type=number min=0",
		"",
		gettext("Insert the validity days"),
		"" , "", "", "", "", "", "", "",
		gettext("Insert the validity days") );;

	$HD_Form -> AddEditElement (gettext("AMOUNT / MINUTES"),
		"amount",
		'$value',
		"INPUT",
		"size=60 maxlength=50",
		"",
		gettext("Insert the MIN/CREDIT date"),
		"" , "", "", "", "", "", "", "");

	$status_list = array();
	$status_list["1"] = array( gettext("ENABLED"), 1);
	$status_list["2"] = array( gettext("DISABLED"), 0);
	$default_status = isset($value) ? $value : 1;
	$len_status_list = count($status_list);
	$HD_Form -> AddEditElement (gettext("STATUS"),
			"is_enabled",
			$default_status,
			"SELECT",
			"",
			"", "",
			"list", "", "description, id", "", $status_list, "%1" , "",
			gettext("Select the status of promotion") );

	if ($form_action!="ask-add" && $form_action!="add") {
	        $FG_QUERY_EDITION='id, ';
	}

	$FG_QUERY_EDITION .='name, type, action, start, expiry, validity, amount, is_enabled';

	$HD_Form -> FieldEditElement ($FG_QUERY_EDITION);

	$HD_Form -> FG_EDITION_CLAUSE = " id='%id'";

	if (($popup_select>=1)){
		$HD_Form -> FG_OTHER_BUTTON1 = true;
		$HD_Form -> FG_OTHER_BUTTON1_ALT = '<font color="red">&lt;select&gt;</font>';
		$HD_Form -> FG_OTHER_BUTTON1_IMG = '';

		if ($popup_select==1) {
			$HD_Form -> FG_OTHER_BUTTON1_LINK = "javascript:sendValue('|param|');";
		}
	}

	$HD_Form -> FG_INTRO_TEXT_EDITION= gettext("Modify the properties of the")." ".$HD_Form->FG_INSTANCE_NAME;
	$HD_Form -> FG_INTRO_TEXT_ASK_DELETION = gettext("If you really want remove this")." ".$HD_Form->FG_INSTANCE_NAME.", ".gettext("click on the delete button.");
	$HD_Form -> FG_INTRO_TEXT_ADD = gettext("you can add easily a new")." ".$HD_Form->FG_INSTANCE_NAME.".<br>".gettext("Fill the following fields and confirm by clicking on the button add.");


	$HD_Form -> FG_INTRO_TEXT_ADITION = '';
	$HD_Form -> FG_TEXT_ADITION_CONFIRMATION = gettext("Your new")." ".$HD_Form->FG_INSTANCE_NAME." ".gettext("has been inserted.")."<br>";


	$HD_Form -> FG_BUTTON_EDITION_SRC = $HD_Form -> FG_BUTTON_ADITION_SRC  = Images_Path . "/cormfirmboton.gif";
	$HD_Form -> FG_BUTTON_EDITION_BOTTOM_TEXT = $HD_Form -> FG_BUTTON_ADITION_BOTTOM_TEXT = gettext("Click 'Confirm Data' to continue");


	$HD_Form -> FG_GO_LINK_AFTER_ACTION = filter_input(INPUT_SERVER, 'PHP_SELF', FILTER_SANITIZE_URL)."?atmenu=user&groupID=$groupID&stitle=Administrator+management&id=";
	$HD_Form -> FG_GO_LINK_AFTER_ACTION_ADD = filter_input(INPUT_SERVER, 'PHP_SELF', FILTER_SANITIZE_URL)."?atmenu=user&groupID=$groupID&stitle=Administrator+management&id=";
	$HD_Form -> FG_GO_LINK_AFTER_ACTION_EDIT = filter_input(INPUT_SERVER, 'PHP_SELF', FILTER_SANITIZE_URL)."?atmenu=user&groupID=$groupID&stitle=Administrator+management&id=";
	$HD_Form -> FG_GO_LINK_AFTER_ACTION_DELETE = filter_input(INPUT_SERVER, 'PHP_SELF', FILTER_SANITIZE_URL)."?atmenu=user&groupID=$groupID&stitle=Administrator+management&id=";
}

