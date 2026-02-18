<?php

/* vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4: */

include '../lib/admin.defines.php';
include '../lib/admin.module.access.php';
include '../lib/Form/Class.FormHandler.inc.php';
include './form_data/FG_var_card_customers.inc';
include '../lib/admin.smarty.php';

if (! has_rights(ACX_CUSTOMER)) {
    Header("HTTP/1.0 401 Unauthorized");
    Header("Location: PP_error.php?c=accessdenied");
    die();
}

$HD_Form->setDBHandler(DbConnect());

$HD_Form->init();

if ($id != "" || !is_null($id)) {
    $HD_Form->FG_EDITION_CLAUSE = str_replace("%id", "$id", $HD_Form->FG_EDITION_CLAUSE);
}

if (!isset($form_action))  $form_action = "list";
if (!isset($action)) $action = $form_action;

$list = $HD_Form->perform_action($form_action);

// #### HEADER SECTION
$smarty->display('main.tpl');

if ($popup_select) {
?>
    <SCRIPT LANGUAGE="javascript">
        function sendValue(selvalue, othervalue) {
            window.opener.document.<?php echo $popup_formname ?>.<?php echo $popup_fieldname ?>.value = selvalue;
            if (othervalue && window.opener.document.<?php echo $popup_formname ?>.accountcode) {
                window.opener.document.<?php echo $popup_formname ?>.accountcode.value = othervalue;
            }
            window.close();
        }
    </SCRIPT>
<?php
}

// #### HELP SECTION
if ($form_action == 'list' && !($popup_select >= 1)) {
    echo $CC_help_list_customer;
?>
    <script language="JavaScript" src="javascript/card.js"></script>

    <?php

    /********************************* BATCH UPDATE ***********************************/
    if ($form_action == "list" && (!($popup_select >= 1))) {

    ?>
        <!-- ** ** ** ** ** Part for the Update ** ** ** ** ** -->
         <div style="display: flex;justify-content: flex-start;align-items: center;margin-left: 20px;">

         <?php
         if (has_rights (ADD_CUSTOMERS) && !($popup_select>=1)) {
         ?>
         <div>
         <a id="btn-1"  style="display:inline; color: white; font-size: 17px; font-weight: 400; padding: 10px 20px; border-radius: 20px; background: #016774; text-decoration: none; margin-left: 10px;"
          href="A2B_entity_card_customers.php?form_action=ask-add&amp;atmenu=card&amp;stitle=Card&amp;section=0"> 
          Add Customer&nbsp;&nbsp;<img src="../Public/templates/default/images/user_add.png" border="0"
           title="Add Customer" alt="Add Customer"></a>
         </div>
         <?php
        }
        ?>
         
            
        <div id="m.div.1" class="toggle_hide2show" style="margin-left:10px; width: ;">
            <center>
            </center>

            <script>
                  setTimeout(function() {
                    location.reload();
                }, 30000); // 30,000 milliseconds = 30 seconds
            function manageButtons1() {
                //display the class on click 
               var div1 = document.getElementById("tohide1");
                if (div1.style.display === "none") {
                    div1.style.display = "inline"; // Use "table" for proper table display
                } else {
                    div1.style.display = "none";
                }

                //hide the buttons

                var btn1 = document.getElementById("btn-1");
                if (btn1.style.display === "inline") {
                    btn1.style.display = "none";
                } else {
                    btn1.style.display = "inline";
                }

                var btn2 = document.getElementById("btn-2");
                if (btn2.style.display === "") {
                    btn2.style.display = "none"; 
                } else {
                    btn2.style.display = "";
                }

                //update with of table
                var mdiv1 = document.getElementById("m.div.1");
                if (mdiv1.style.width === "") {
                    mdiv1.style.width = "100%"; 
                } else {
                    mdiv1.style.width = "";
                }

    }
        </script>
        </div>

        <div class="toggle_hide2show" style="margin-left:10px">
            <center>
                <a id="btn-2" onclick="manageButtons2()"  href="#" target="_self" class="custom_a_href"><img class="toggle_hide2show" src="<?php echo KICON_PATH; ?>/search_icon.png" onmouseover="this.style.cursor='hand';" HEIGHT="16">
                    <font style="color: white;font-size: 15px;font-weight: 400;" class="fontstyle_002"><?php echo gettext("SEARCH CUSTOMERS"); ?> </font>
                </a>
            </center>

            <script>
            function manageButtons2() {
                //display the class on click 
               var div1 = document.getElementById("tohide2");
                if (div1.style.display === "none") {
                    div1.style.display = "block"; // Use "table" for proper table display
                } else {
                    div1.style.display = "none";
                }

                //hide the buttons

                var btn1 = document.getElementById("btn-1");
                if (btn1.style.display === "inline") {
                    btn1.style.display = "none"; //
                } else {
                    btn1.style.display = "inline";
                }

                var btn2 = document.getElementById("btn-3");
                if (btn2.style.display === "") {
                    btn2.style.display = "none"; 
                } else {
                    btn2.style.display = "";
                }

                //update with of table
                var mdiv1 = document.getElementById("");
                if (mdiv1.style.width === "") {
                    mdiv1.style.width = "100%"; 
                } else {
                    mdiv1.style.width = "";
                }

    }
        </script>


            <div id="tohide2" class="tohide" style="display:none;">
                <?php
                // #### CREATE SEARCH FORM
                if ($form_action == "list") {
                    $HD_Form->create_search_form();
                }
                ?>
            </div>
        </div>
        </div>
        <!-- ** ** ** ** ** Part for the Update ** ** ** ** ** -->
    <?php
    } // END if ($form_action == "list")
    ?>

<?php  } // endif is_sip_iax_change

if (isset($update_msg) && strlen($update_msg) > 0) echo $update_msg;

// #### TOP SECTION PAGE
$HD_Form->create_toppage($form_action);

if (!$popup_select && $form_action == "ask-add") {
?>
    <center>
        <table width="95%" align="center" cellpadding="2" cellspacing="0">
            <script language="javascript">
                function submitform() {
                    document.cardform.submit();
                }
            </script>
            <form action="A2B_entity_card_customers.php?form_action=ask-add&section=0" method="post" name="cardform">
                <tr>
                    <td class="viewhandler_filter_td1">
                        <span>
                            <font class="viewhandler_filter_on"><?php echo gettext("Change the Account Number Length") ?> :</font>
                            <select name="cardnumberlenght_list" size="1" class="form_input_select" onChange="submitform()">
                                <?php foreach ($A2B->cardnumber_range as $value) { ?>
                                    <option value='<?php echo $value ?>'
                                        <?php if ($value == $cardnumberlenght_list) echo "selected";
                                        ?>> <?php echo $value . " " . gettext("Digits"); ?> </option>
                                <?php } ?>
                            </select>
                        </span>
                    </td>
                </tr>
            </form>
        </table>
    </center>
<?php
}

if ($form_action == 'ask-edit') {
    echo Display_Login_Button($HD_Form->DBHandle, $id);
}

$HD_Form->create_form($form_action, $list, $id = null);

// Code for the Export Functionality
$_SESSION[$HD_Form->FG_EXPORT_SESSION_VAR] = "SELECT " . $HD_Form->FG_EXPORT_FIELD_LIST . " FROM $HD_Form->FG_TABLE_NAME";

if (strlen($HD_Form->FG_TABLE_CLAUSE) > 1) {
    $_SESSION[$HD_Form->FG_EXPORT_SESSION_VAR] .= " WHERE $HD_Form->FG_TABLE_CLAUSE ";
}

if (!is_null($HD_Form->FG_ORDER) && ($HD_Form->FG_ORDER != '') && !is_null($HD_Form->FG_SENS) && ($HD_Form->FG_SENS != ''))
    $_SESSION[$HD_Form->FG_EXPORT_SESSION_VAR] .= " ORDER BY $HD_Form->FG_ORDER $HD_Form->FG_SENS";

if (!($popup_select >= 1))
    $smarty->display('footer.tpl');
?>