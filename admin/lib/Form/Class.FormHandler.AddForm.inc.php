<?php

$processed = $this->getProcessed();
 $rowCounter = 0;
?>


<script language="JavaScript" src="./javascript/calonlydays.js"></script>

<FORM  action=<?php echo filter_input(INPUT_SERVER, 'PHP_SELF', FILTER_SANITIZE_URL); ?> id="myForm" method="post" name="myForm">

    <TABLE cellspacing="2" class="addform_table1">
        <INPUT type="hidden" name="form_action" value="add">
        <INPUT type="hidden" name="wh" value="<?php echo $wh; ?>">

        <?php
        if ($this->FG_CSRF_STATUS == true) {
        ?>
            <INPUT type="hidden" name="<?php echo $this->FG_FORM_UNIQID_FIELD ?>" value="<?php echo $this->FG_FORM_UNIQID; ?>" />
            <INPUT type="hidden" name="<?php echo $this->FG_CSRF_FIELD ?>" value="<?php echo $this->FG_CSRF_TOKEN; ?>" />
        <?php
        }
        ?>

        <?php
        if (!empty($this->FG_QUERY_ADITION_HIDDEN_FIELDS)) {
            $split_hidden_fields = preg_split("/,/", trim($this->FG_QUERY_ADITION_HIDDEN_FIELDS));
            $split_hidden_fields_value = preg_split("/,/", trim($this->FG_QUERY_ADITION_HIDDEN_VALUE));
            for ($cur_hidden = 0; $cur_hidden < count($split_hidden_fields); $cur_hidden++) {
                echo "<INPUT type=\"hidden\" name=\"" . trim($split_hidden_fields[$cur_hidden]) . "\" value=\"" . trim($split_hidden_fields_value[$cur_hidden]) . "\">\n";
            }
        }
        if (!empty($this->FG_ADITION_HIDDEN_PARAM)) {
            $split_hidden_fields = preg_split("/,/", trim($this->FG_ADITION_HIDDEN_PARAM));
            $split_hidden_fields_value = preg_split("/,/", trim($this->FG_ADITION_HIDDEN_PARAM_VALUE));
            for ($cur_hidden = 0; $cur_hidden < count($split_hidden_fields); $cur_hidden++) {
                echo "<INPUT type=\"hidden\" name=\"" . trim($split_hidden_fields[$cur_hidden]) . "\" value=\"" . trim($split_hidden_fields_value[$cur_hidden]) . "\">\n";
            }
        }
        ?>
        <INPUT type="hidden" name="atmenu" value="<?php echo $atmenu ?>">
        <TBODY >
            <?php
            for ($i = 0; $i < $this->FG_NB_TABLE_ADITION; $i++) {
                $pos = strpos($this->FG_TABLE_ADITION[$i][14], ":");

                if (strlen($this->FG_TABLE_ADITION[$i][16]) > 1 && strtoupper($this->FG_TABLE_ADITION[$i][3]) != ("HAS_MANY")) {
                    echo '<TR><TD style="padding-left:20px !important;" valign="top" colspan="2" class="tableBodyRight" ><i>';
                    echo $this->FG_TABLE_EDITION[$i][16];
                    echo '</i></TD></TR>';
                }

                if (!$pos) {
            ?>
                   
                        <?php
                         if (!$this->FG_fit_expression[$i]  &&  isset($this->FG_fit_expression[$i])) { ?>
                           
                            <Td style="padding-left:20px !important;"  class="tableBodyRight" background="<?php echo Images_Path; ?>/background_cells_red.gif" class="text">
                           <?php echo $this->FG_TABLE_ADITION[$i][0] ?> <br>
                            <?php } else { ?>
                      
                            <TD style="width: 35% !important; padding-left:20px !important;" >
                          <?php echo $this->FG_TABLE_ADITION[$i][0] ?>  <br>
                            <?php } ?>

                            <?php  
                            if ($this->FG_DEBUG == 1) print($this->FG_TABLE_ADITION[$i][3]);
                            if (strtoupper($this->FG_TABLE_ADITION[$i][3]) == "INPUT") {
                            ?>
                                <INPUT class="form_input_text" name=<?php echo $this->FG_TABLE_ADITION[$i][1] ?> <?php echo $this->FG_TABLE_ADITION[$i][4] ?> value="<?php echo $processed[$this->FG_TABLE_ADITION[$i][1]]; ?>">
                            <?php
                            } elseif (strtoupper($this->FG_TABLE_ADITION[$i][3]) == "LABEL") {
                            ?>
                                <?php echo $this->FG_TABLE_ADITION[$i][4] ?>
                            <?php
                            } elseif (strtoupper($this->FG_TABLE_ADITION[$i][3]) == "POPUPVALUE") {
                            ?>
                                <INPUT class="form_input_text" name=<?php echo $this->FG_TABLE_ADITION[$i][1] ?> <?php echo $this->FG_TABLE_ADITION[$i][4] ?> value="<?php

                                                                                                                                                                    if ($this->VALID_SQL_REG_EXP) {
                                                                                                                                                                        echo stripslashes($list[0][$i]);
                                                                                                                                                                    } else {
                                                                                                                                                                        echo $processed[$this->FG_TABLE_ADITION[$i][1]];
                                                                                                                                                                    } ?>">
                                <a href="#" onclick="window.open('<?php echo $this->FG_TABLE_ADITION[$i][12] ?>popup_formname=myForm&popup_fieldname=<?php echo $this->FG_TABLE_ADITION[$i][1] ?>' <?php echo $this->FG_TABLE_ADITION[$i][13] ?>);"><img src="<?php echo Images_Path_Main; ?>/icon_arrow_orange.gif" /></a>
                                <!--CAPTCHA IMAGE CODE START HERE-->
                            <?php
                            } elseif (strtoupper($this->FG_TABLE_ADITION[$i][3]) == "CAPTCHAIMAGE") {
                            ?>
                                <table cellpadding="2" cellspacing="0" border="0" width="100%">
                                    <tr>
                                        <td> <img src="./captcha/captcha.php"></td>
                                    </tr>
                                    <tr>
                                        <td><INPUT class="form_input_text" name=<?php echo $this->FG_TABLE_ADITION[$i][1] ?> <?php echo $this->FG_TABLE_ADITION[$i][4] ?> value="<?php echo $processed[$this->FG_TABLE_ADITION[$i][1]]; ?>"> Enter code from above picture here.
                                        </td>
                                    </tr>
                                </table>

                                <!--CAPTCHA IMAGE CODE END HERE-->

                            <?php
                            } elseif (strtoupper($this->FG_TABLE_ADITION[$i][3]) == "POPUPVALUETIME") {
                            ?>
                                <INPUT class="form_enter" name=<?php echo $this->FG_TABLE_ADITION[$i][1] ?> <?php echo $this->FG_TABLE_ADITION[$i][4] ?> value="<?php if ($this->VALID_SQL_REG_EXP) {
                                                                                                                                                                    echo stripslashes($list[0][$i]);
                                                                                                                                                                } else {
                                                                                                                                                                    echo $processed[$this->FG_TABLE_ADITION[$i][1]];
                                                                                                                                                                } ?>">
                                <a href="#" onclick="window.open('<?php echo $this->FG_TABLE_ADITION[$i][14] ?>formname=myForm&fieldname=<?php echo $this->FG_TABLE_ADITION[$i][1] ?>' <?php echo $this->FG_TABLE_ADITION[$i][14] ?>);"><img src="<?php echo Images_Path_Main; ?>/icon_arrow_orange.gif" /></a>
                            <?php
                            } elseif (strtoupper($this->FG_TABLE_ADITION[$i][3]) == "POPUPDATETIME") {
                            ?>
                                <INPUT class="form_enter" name=<?php echo $this->FG_TABLE_ADITION[$i][1] ?> <?php echo $this->FG_TABLE_ADITION[$i][4] ?> value="<?php if ($this->VALID_SQL_REG_EXP) {
                                                                                                                                                                    echo stripslashes($list[0][$i]);
                                                                                                                                                                } else {
                                                                                                                                                                    echo $processed[$this->FG_TABLE_ADITION[$i][1]];
                                                                                                                                                                } ?>">
                                <a href="javascript:cal<?php echo $this->FG_TABLE_ADITION[$i][1] ?>.popup();"><img src="<?php echo Images_Path_Main; ?>/cal.gif" width="16" height="16" border="0" title="Click Here to Pick up the date" alt="Click Here to Pick up the date"></a>
                                <script language="JavaScript">
                                    <!-- // create calendar object(s) just after form tag closed
                                    // specify form element as the only parameter (document.forms['formname'].elements['inputname']);
                                    // note: you can have as many calendar objects as you need for your application
                                    var cal<?php echo $this->FG_TABLE_ADITION[$i][1] ?> = new calendaronlyminutes(document.forms['myForm'].elements['<?php echo $this->FG_TABLE_ADITION[$i][1] ?>']);
                                    cal<?php echo $this->FG_TABLE_ADITION[$i][1] ?>.year_scroll = false;
                                    cal<?php echo $this->FG_TABLE_ADITION[$i][1] ?>.time_comp = true;
                                    cal<?php echo $this->FG_TABLE_ADITION[$i][1] ?>.formatpgsql = true;
                                    //
                                    -->
                                </script>
                            <?php
                            } elseif (strtoupper($this->FG_TABLE_ADITION[$i][3]) == "TEXTAREA") {
                            ?>
                                <TEXTAREA class="form_input_textarea" name=<?php echo $this->FG_TABLE_ADITION[$i][1] ?> <?php echo $this->FG_TABLE_ADITION[$i][4] ?>><?php echo $processed[$this->FG_TABLE_ADITION[$i][1]]; ?></TEXTAREA>
                            <?php
                            } elseif (strtoupper($this->FG_TABLE_ADITION[$i][3]) == "SELECT") {
                                if ($this->FG_DEBUG == 1) {
                                    echo "<br> TYPE DE SELECT :" . $this->FG_TABLE_ADITION[$i][7];
                                }
                                if (strtoupper($this->FG_TABLE_ADITION[$i][7]) == "SQL") {

                                    $instance_sub_table = new Table($this->FG_TABLE_ADITION[$i][8], $this->FG_TABLE_ADITION[$i][9]);
                                    $select_list = $instance_sub_table->Get_list($this->DBHandle, $this->FG_TABLE_ADITION[$i][10], null, null, null, null, null, null);
                                    if ($this->FG_DEBUG >= 2) {
                                        echo "<br>";
                                        print_r($select_list);
                                    }
                                } elseif (strtoupper($this->FG_TABLE_ADITION[$i][7]) == "LIST") {
                                    $select_list = $this->FG_TABLE_ADITION[$i][11];
                                }
                            ?>
                                <SELECT style="width: 240px !important;"  name='<?php echo $this->FG_TABLE_ADITION[$i][1] ?><?php if (strpos($this->FG_TABLE_ADITION[$i][4], "multiple")) echo "[]"; ?>' class="form_input_select" <?php echo $this->FG_TABLE_ADITION[$i][4] ?>>
                                    <?php
                                    echo ($this->FG_TABLE_ADITION[$i][15]);
                                    if (strlen($this->FG_TABLE_ADITION[$i][6]) > 0) {
                                    ?>
                                        <option value="-1"><?php echo $this->FG_TABLE_ADITION[$i][6] ?></option>
                                        <?php  }
                                    if (count($select_list) > 0) {
                                        $select_number = 0;
                                        foreach ($select_list as $select_recordset) {
                                            $select_number++;
                                            if ($this->FG_TABLE_ADITION[$i][12] != "") {
                                                $value_display = $this->FG_TABLE_ADITION[$i][12];
                                                $nb_recor_k = count($select_recordset);
                                                for ($k = 1; $k <= $nb_recor_k; $k++) {
                                                    $value_display  = str_replace("%$k", $select_recordset[$k - 1], $value_display);
                                                }
                                            } else {
                                                $value_display = $select_recordset[0];
                                            }
                                        ?>
                                            <OPTION style="width: 60% !important;" value='<?php echo $select_recordset[1] ?>'
                                                <?php
                                                if ($this->FG_TABLE_ADITION[$i][2] == $select_recordset[1]) echo "selected";

                                                // CLOSE THE <OPTION
                                                echo '> ';
                                                echo $value_display . '</OPTION>';
                                            } // END_FOREACH
                                        } else {
                                            echo gettext("No data found !!!");
                                        } //END_IF
                                                ?>
                                                </SELECTs>
                                            <?php
                                        } elseif (strtoupper($this->FG_TABLE_ADITION[$i][3]) == "RADIOBUTTON") {
                                            $radio_table = preg_split("/,/", trim($this->FG_TABLE_ADITION[$i][10]));
                                            foreach ($radio_table as $radio_instance) {
                                                $radio_composant = preg_split("/:/", $radio_instance);
                                                echo $radio_composant[0];
                                                echo ' <input type="radio" name="' . $this->FG_TABLE_ADITION[$i][1] . '" value="' . $radio_composant[1] . '" ';
                                                // TODO just a temporary and quick hack please review $VALID_SQL_REG_EXP
                                                if ($processed[$this->FG_TABLE_ADITION[$i][1]] == $radio_composant[1]) {
                                                    echo "checked";
                                                } elseif ($VALID_SQL_REG_EXP) {
                                                    $know_is_checked = stripslashes($list[0][$i]);
                                                } else {
                                                    $know_is_checked = $this->FG_TABLE_ADITION[$i][2];
                                                }

                                                if ($know_is_checked == $radio_composant[1]) {
                                                    echo "checked";
                                                }
                                                echo ">";
                                            }
                                        } //END_IF (RADIOBUTTON)
                                            ?>
                                            <span class="liens">
                                                <?php
                                                if (!$this->FG_fit_expression[$i]  &&  isset($this->FG_fit_expression[$i])) {
                                                    $concatenatedValue = $this->FG_TABLE_ADITION[$i][6] . " " . $this->FG_regular[$this->FG_TABLE_ADITION[$i][5]][1];
                                                    echo "<script>
                                                    showCustomToast('" . addslashes($concatenatedValue) . "');
                                                </script>";
                                                }
                                                ?>
<!-- added this code to show toaster -->

                                <div id="custom-toast-container" style="position: fixed; top: 20px; right: 20px; z-index: 9999;"></div>
                                <script>
                                function showCustomToast(message, type = 'error') {
                                    const containerId = 'custom-toast-container';
                                    let container = document.getElementById(containerId);

                                    // Create container if it doesn't exist
                                    if (!container) {
                                        container = document.createElement('div');
                                        container.id = containerId;
                                        container.style.position = 'fixed';
                                        container.style.top = '20px';
                                        container.style.right = '20px';
                                        container.style.zIndex = '9999';
                                        document.body.appendChild(container);
                                    }

                                    // Create toast element
                                    const toast = document.createElement('div');
                                    toast.innerText = message;
                                    toast.style.backgroundColor = type === 'success' ? '#4CAF50' :
                                                                    type === 'info' ? '#2196F3' :
                                                                    type === 'warning' ? '#FF9800' : '#f44336'; // Default to error
                                    toast.style.color = '#fff';
                                    toast.style.padding = '15px 20px';
                                    toast.style.marginBottom = '10px';
                                    toast.style.borderRadius = '5px';
                                    toast.style.boxShadow = '0 2px 5px rgba(0, 0, 0, 0.2)';
                                    toast.style.fontFamily = 'Arial, sans-serif';
                                    toast.style.animation = 'fade-in 0.5s, fade-out 0.5s 4.5s';
                                    toast.style.position = 'relative';
                                    toast.style.opacity = '1';
                                    toast.style.transition = 'opacity 0.5s ease';

                                    // Add close button
                                    const closeButton = document.createElement('span');
                                    closeButton.innerText = '✖';
                                    closeButton.style.position = 'absolute';
                                    closeButton.style.top = '5px';
                                    closeButton.style.right = '10px';
                                    closeButton.style.cursor = 'pointer';
                                    closeButton.addEventListener('click', () => {
                                        toast.style.opacity = '0';
                                        setTimeout(() => container.removeChild(toast), 200); // Remove after fade-out
                                    });

                                    toast.appendChild(closeButton);

                                    // Append toast to container
                                    container.appendChild(toast);

                                    // Auto-remove toast after 5 seconds
                                    setTimeout(() => {
                                        if (container.contains(toast)) {
                                            toast.style.opacity = '0';
                                            setTimeout(() => container.removeChild(toast), 200);
                                        }
                                    }, 5000);
                                }
                                </script>


                                            </span>
                                            <!-- <?php
                                            if (strlen($this->FG_TABLE_COMMENT[$i]) > 0) {  ?><?php echo "<br/>" . $this->FG_TABLE_COMMENT[$i]; ?> <?php  } ?> -->
                            </TD>
                            <?php 
                            global $rowCounter;
                            $rowCounter++; 
                            if ($rowCounter % 3 == 0 && $rowCounter > 0) {
                                echo '</tr>';
                            }
                            ?>
                           

            <?php       }
            } //END_FOR
            ?>

        </TBODY>
    </TABLE>
    
    <TABLE cellspacing="0" class="editform_table8">
        <tr>
            <td class="text_azul"><span class="tableBodyRight"><?php echo $this->FG_BUTTON_ADITION_BOTTOM_TEXT ?></span></td>

            <td align="right" valign="top" class="text">

                <!-- added custom css here to adjust button aligment on rate-> callpan -> addcall plan page -->
                <a href="#" style="display: flex; width: 200px; margin-bottom: 10px;" onClick="javascript:document.myForm.submit();" class="cssbutton_big"><IMG style="vertical-align:middle;" src="<?php echo Images_Path_Main; ?>/icon_arrow_orange.gif">
                    <?php echo $this->FG_ADD_PAGE_CONFIRM_BUTTON; ?> </a>
                <!--
                <INPUT title="<?php echo gettext("Create a new "); ?><?php echo $this->FG_INSTANCE_NAME ?>" alt="<?php echo gettext("Create a new "); ?> <?php echo $this->FG_INSTANCE_NAME ?>" border=0 hspace=0 id=submit4 name=submit2 src="<?php echo $this->FG_BUTTON_ADITION_SRC ?>" type=image>
                -->
            </td>
        </tr>
    </TABLE>
</FORM>