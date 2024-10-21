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

$query = "SELECT * FROM promotion WHERE status = 0 AND is_enabled = 1 AND expiry < NOW();";
$stmt = $pdo->query($query);
$promotions = $stmt->fetchAll();

foreach ($promotions as $promotion) {
    
    if ($promotion['action'] == 'seasonal') {
        $card_idQuery = "SELECT card_id FROM cc_call WHERE starttime between  '$promotion[start]' AND '$promotion[expiry]' group by card_id;";
        $stmt = $pdo->query($card_idQuery);
        $card_ids = $stmt->fetchAll();
        foreach ($card_ids as $id) {
            if($promotion['type']== 'minutes'){
                $query = "update cc_card set bonus_mins = '$promotion[amount]', bonus_mins_validity = DATE_ADD(NOW(), INTERVAL $promotion[validity] DAY) where id = '$id[card_id]'";
                $stmt = $pdo->query($query);
                $promotions = $stmt->fetchAll();
                $query = "update promotion set status = 1 where id = $promotion[id]";
                $stmt = $pdo->query($query);
                $promotions = $stmt->fetchAll();
                
            }
            elseif($promotion['type']== 'balance'){
                $query = "update cc_card set bonus_credit = '$promotion[amount]', bonus_credit_validity = DATE_ADD(NOW(), INTERVAL $promotion[validity] DAY) where id = '$id[card_id]'";
                $stmt = $pdo->query($query);
                $promotions = $stmt->fetchAll();
                $query = "update promotion set status = 1 where id = $promotion[id]";
                $stmt = $pdo->query($query);
                $promotions = $stmt->fetchAll();
                
            }
        }
    }

    if ($promotion['action'] == 'recharge') {
    $card_idQuery = "SELECT card_id FROM cc_logrefill WHERE date between  '$promotion[start]' AND '$promotion[expiry]' group by card_id;";
    $stmt = $pdo->query($card_idQuery);
        $card_ids = $stmt->fetchAll();
        foreach ($card_ids as $id) {
            // if($promotion['type']== 'minutes'){
            //     $query = "update cc_card set bonus_mins = '$promotion[amount]', bonus_mins_validity = DATE_ADD(NOW(), INTERVAL $promotion[validity] DAY) where id = '$id[card_id]'";
            //     $stmt = $pdo->query($query);
            //     $promotions = $stmt->fetchAll();
            // }
            // else

            if($promotion['type']== 'balance'){
                $query = "update cc_card set bonus_credit = '$promotion[amount]', bonus_credit_validity = DATE_ADD(NOW(), INTERVAL $promotion[validity] DAY) where id = '$id[card_id]'";
                $stmt = $pdo->query($query);
                $promotions = $stmt->fetchAll();
                $query = "update promotion set status = 1 where id = $promotion[id]";
                $stmt = $pdo->query($query);
                $promotions = $stmt->fetchAll();
                
            }
        }
    }
}





?>

