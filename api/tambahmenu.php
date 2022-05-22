<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// koneksi database dan inisialisasi object
include_once '../config/Database.php';
include_once '../objects/Ayamswasta.php';

$database = new Database();
$db = $database->getConnection();

$menu = new Ayamswasta($db);

// mendapatkan data yang telah ada
$data = json_decode(file_get_contents("php://input"));

// memastikan data tidak kosong
if (
    !empty($data->menu_id) &&
    !empty($data->menu_name) &&
    !empty($data->menu_harga) &&
    !empty($data->menu_disc) &&
    !empty($data->menu_status)
) {

    // mengatur nilai property obat
    $menu->menu_id = $data->menu_id;
    $menu->menu_name = $data->menu_name;
    $menu->menu_harga = $data->menu_harga;
    $menu->menu_disc = $data->menu_disc;
    $menu->menu_status = $data->menu_status;

    // menyimpan obat
    if ($menu->tambah_menu()) {

        // set response code - 201 created
        http_response_code(201);

        // data obat berhasil tersimpan
        echo json_encode(array("message" => "Data menu tersimpan."));
    } else {

        // set response code - 503 service unavailable
        http_response_code(503);

        // menampilkan ke user bahwa data obat gagal disimpan
        echo json_encode(array("message" => "Gagal menyimpan data menu."));
    }
}
// jika data tidak komplet
else {

    // set response code - 400 bad request
    http_response_code(400);

    // data yang dimasukkan kurang lengkap
    echo json_encode(array("message" => "Gagal menambahkan data menu. Data tidak lengkap."));
}
