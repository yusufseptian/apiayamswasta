<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once '../config/Database.php';
include_once '../objects/Ayamswasta.php';

$database = new Database();
$db = $database->getConnection();
$ayamswasta = new Ayamswasta($db);
$stmt = $ayamswasta->tampil_login();
$num = $stmt->rowCount();

if ($num > 0) {
    $login_arr = array();
    $login_arr["records"] = array();
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        extract($row);
        $login_item = array(
            "us_role_id" => $us_role_id
        );
        array_push($login_arr["records"], $login_item);
    }
    http_response_code(200);
    echo json_encode($login_arr);
} else {
    $login_arr["records"] = array();
    $login_item = array(
        "us_role_id" => '0'
    );
    array_push($login_arr["records"], $login_item);
    http_response_code(200);
    echo json_encode($login_arr);
}
