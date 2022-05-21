<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once '../config/Database.php';
include_once '../objects/Ayamswasta.php';

$database = new Database();
$db = $database->getConnection();
$ayamswasta = new Ayamswasta($db);
$stmt = $ayamswasta->tampil_menu();
$num = $stmt->rowCount();

if ($num > 0) {
    $menu_arr = array();
    $menu_arr["records"] = array();
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        extract($row);
        $menu_item = array(
            "menu_id" => $menu_id,
            "menu_name" => $menu_name,
            "menu_harga" => $menu_harga,
            "menu_disc" => $menu_disc,
            "menu_status" => $menu_status,
        );
        array_push($menu_arr["records"], $menu_item);
    }
    http_response_code(200);
    echo json_encode($menu_arr);
} else {
    $menu_arr["records"] = array();
    $menu_item = array(
        "menu_id" => '0'
    );
    array_push($menu_arr["records"], $menu_item);
    http_response_code(200);
    echo json_encode($menu_arr);
}
