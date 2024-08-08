<?php

/* vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4: */

/**
 * This file is part of A2Billing (http://www.a2billing.net/)
 *
 * A2Billing, Commercial Open Source Telecom Billing platform,
 * powered by Star2billing S.L. <http://www.star2billing.com/>
 *
 * @copyright   Copyright (C) 2004-2015 - Star2billing S.L.
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

include_once '../lib/admin.defines.php';
include_once '../lib/admin.module.access.php';
include_once '../lib/admin.smarty.php';

if (!$ACXACCESS) {
    Header ("HTTP/1.0 401 Unauthorized");
    Header ("Location: PP_error.php?c=accessdenied");
    die();
}

$smarty->display('main.tpl');

?>
<br/><br/>
<center>
<table align="center" width="90%" bgcolor="white" cellpadding="15" cellspacing="15" style="border: solid 1px">
    <tr>
        <td width="340" align="center">
            <img style="width: 260px;" src="https://go.com.sa/Resources/2/go-logo.png">
            <br><br>

        </td>
        <?php if (SHOW_DONATION) { ?>
        <td align="left">
        For information and documentation on CREDIT LIMIT SOLUTION, <br> please visit <a href="https://www.go.com.sa/en/" target="_blank">https://www.go.com.sa/en/</a><br><br>

        For Commercial Installations, Hosted Systems, Customisation and Commercial support, please visit <a href="https://www.go.com.sa/en/" target="_blank">https://www.go.com.sa/en/</a><br><br>

        
        <!-- <center>
        <?php echo '<a href="http://www.call-labs.com/" target="_blank"><img src="'.Images_Path.'/call-labs.com.png" alt="call-labs"/></a>'; ?>
        </center>
        </td>
        <?php } ?>
    </tr>

    <tr>
        <td colspan="2">
        <center>
            <b><i>A2Billing is licensed under <a href="http://www.fsf.org/licensing/licenses/agpl-3.0.html" 	target="_blank">AGPL 3</a>.</i></b>
            <br><a href="http://www.fsf.org/licensing/licenses/agpl-3.0.html" target="_blank"><img src="images/agplv3-88x31.png"></a>
            </center>

        <div class="scroll">
<pre>
<?php echo (file_get_contents("../lib/COPYING")); ?>
</pre>
</div> -->

        </td>
    </tr>

</table>

<br>



</center>

<?php

$smarty->display('footer.tpl');
