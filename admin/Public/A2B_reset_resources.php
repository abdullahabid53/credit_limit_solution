<?php
require '../../common/lib/admin.defines.php';


$A2B = new A2Billing();
$A2B -> load_conf($agi, NULL, 0, $idconfig);

if (!$A2B -> DbConnect()) {
    echo "[Cannot connect to the database]\n";
    write_log(LOGFILE_CRONT_CHECKACCOUNT, basename(__FILE__).' line:'.__LINE__."[Cannot connect to the database]");
    exit;
}

//$A2B -> DBHandle
$instance_table = new Table();

$id = isset($_GET['id']) ? $_GET['id'] : null;

$A2B -> DBHandle -> Execute('SET AUTOCOMMIT=1');

$qry = "UPDATE cc_card SET 
                credit = 0,
                used_onnet_mins = 0,
                used_offnet_mins = 0,
                used_intl_mins = 0,
                notification_level = 0,
                notification_level_pkg_onnet = 0,
                notification_level_pkg_offnet = 0,
                notification_level_pkg_intl = 0 
              WHERE id = $id;";

$A2B -> DBHandle -> Execute('BEGIN;');
            $instance_table -> SQLExec ($A2B -> DBHandle, $qry);
            $A2B -> DBHandle -> Execute('COMMIT;');

            header("Location: " . $_SERVER['HTTP_REFERER']);
            exit();
?>