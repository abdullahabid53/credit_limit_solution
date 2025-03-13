<?php

$host = 'localhost';
$db   = 'a2billing';
$user = 'root';
$pass = 'root';
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

try {
    $pdo = new PDO($dsn, $user, $pass, $options);
} catch (PDOException $e) {
    throw new PDOException($e->getMessage(), (int)$e->getCode());
}

// Get the current day of the month
$invoiceday = date('j'); // 'j' returns day without leading zero

// Create user_resources_reset table if not exists
$query = "CREATE TABLE IF NOT EXISTS user_resources_reset (
            card_id bigint(20) NOT NULL,
            username varchar(50) NOT NULL,
            credit DECIMAL(15,5) NOT NULL DEFAULT 0.00000,
            used_onnet_mins INT(11) DEFAULT NULL,
            used_offnet_mins INT(11) DEFAULT NULL,
            used_intl_mins INT(11) DEFAULT NULL,
            notification_level INT(11) DEFAULT 0,
            notification_level_pkg_onnet INT(11) DEFAULT 0,
            notification_level_pkg_offnet INT(11) DEFAULT 0,
            notification_level_pkg_intl INT(11) DEFAULT 0,
            created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
          );";
$stmt = $pdo->query($query);

// Fetch records that match today's invoiceday
$query = "SELECT id, username, credit, used_onnet_mins, used_offnet_mins, used_intl_mins, 
                 notification_level, notification_level_pkg_onnet, notification_level_pkg_offnet, 
                 notification_level_pkg_intl, invoiceday 
          FROM cc_card 
          WHERE invoiceday = :invoiceday;";

$stmt = $pdo->prepare($query);
$stmt->execute(['invoiceday' => $invoiceday]);
$resources = $stmt->fetchAll();

foreach ($resources as $resource) {
    $card_id = $resource['id'];
    $username = $resource['username'];
    $credit = isset($resource['credit']) ? $resource['credit'] : 0;
    $used_onnet_mins = isset($resource['used_onnet_mins']) ? $resource['used_onnet_mins'] : 0;
    $used_offnet_mins = isset($resource['used_offnet_mins']) ? $resource['used_offnet_mins'] : 0;
    $used_intl_mins = isset($resource['used_intl_mins']) ? $resource['used_intl_mins'] : 0;
    $notification_level = isset($resource['notification_level']) ? $resource['notification_level'] : 0;
    $notification_level_pkg_onnet = isset($resource['notification_level_pkg_onnet']) ? $resource['notification_level_pkg_onnet'] : 0;
    $notification_level_pkg_offnet = isset($resource['notification_level_pkg_offnet']) ? $resource['notification_level_pkg_offnet'] : 0;
    $notification_level_pkg_intl = isset($resource['notification_level_pkg_intl']) ? $resource['notification_level_pkg_intl'] : 0;

    // Insert the backup record
    $query = "INSERT INTO user_resources_reset 
                (card_id, username, credit, used_onnet_mins, used_offnet_mins, used_intl_mins, 
                 notification_level, notification_level_pkg_onnet, notification_level_pkg_offnet, 
                 notification_level_pkg_intl, created_at) 
              VALUES 
                (:card_id, :username, :credit, :used_onnet_mins, :used_offnet_mins, :used_intl_mins, 
                 :notification_level, :notification_level_pkg_onnet, :notification_level_pkg_offnet, 
                 :notification_level_pkg_intl, NOW());";

    $stmt = $pdo->prepare($query);
    $stmt->execute([
        'card_id' => $card_id,
        'username' => $username,
        'credit' => $credit,
        'used_onnet_mins' => $used_onnet_mins,
        'used_offnet_mins' => $used_offnet_mins,
        'used_intl_mins' => $used_intl_mins,
        'notification_level' => $notification_level,
        'notification_level_pkg_onnet' => $notification_level_pkg_onnet,
        'notification_level_pkg_offnet' => $notification_level_pkg_offnet,
        'notification_level_pkg_intl' => $notification_level_pkg_intl
    ]);

    // Reset the original record
    $query = "UPDATE cc_card SET 
                credit = 0,
                used_onnet_mins = 0,
                used_offnet_mins = 0,
                used_intl_mins = 0,
                notification_level = 0,
                notification_level_pkg_onnet = 0,
                notification_level_pkg_offnet = 0,
                notification_level_pkg_intl = 0 
              WHERE id = :card_id;";

    $stmt = $pdo->prepare($query);
    $stmt->execute(['card_id' => $card_id]);
}

?>

