<?php
class Ayamswasta
{
    private $conn;
    private $table_menu = "tb_menu";
    private $table_user = "tb_user";

    // object properties (kolom pada tabel user)
    public $us_id;
    public $us_username;
    public $us_password;
    public $us_fullname;
    public $us_alamat;
    public $us_telepon;
    public $us_role_id;
    // object properties (kolom pada tabel menu)
    public $menu_id;
    public $menu_name;
    public $menu_harga;
    public $menu_disc;
    public $menu_status;
    public function __construct($db)
    {
        $this->conn = $db;
    }
    function tampil_login()
    {
        $username = $_POST['us_username'];
        $password = $_POST['us_password'];
        $query = "SELECT * FROM tb_user where us_username = '$username' and us_password = '$password' ";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }
    function register_user()
    {
        // query untuk menyimpan data 
        $query = "INSERT INTO tb_user
            VALUES(:us_username, :us_password )";
        // prepare query
        $stmt = $this->conn->prepare($query);
        // sanitize
        $this->us_username = htmlspecialchars(strip_tags($this->us_username));
        $this->us_password = htmlspecialchars(strip_tags($this->us_password));
        // bind nilai property
        $stmt->bindParam(":us_username", $this->us_username);
        $stmt->bindParam(":us_password", $this->us_password);

        // execute query
        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    //crud menu makan
    function tampil_menu()
    {
        $query = "SELECT * FROM tb_menu";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    function tambah_menu()
    {
        // query untuk menyimpan data 
        $query = "INSERT INTO  " . $this->table_menu . "
        VALUES(:menu_id, :menu_name, :menu_harga, :menu_disc, :menu_status)";
        // prepare query
        $stmt = $this->conn->prepare($query);
        // sanitize
        $this->menu_id = htmlspecialchars(strip_tags($this->menu_id));
        $this->menu_name = htmlspecialchars(strip_tags($this->menu_name));
        $this->menu_harga = htmlspecialchars(strip_tags($this->menu_harga));
        $this->menu_disc = htmlspecialchars(strip_tags($this->menu_disc));
        $this->menu_status = htmlspecialchars(strip_tags($this->menu_status));
        // bind nilai property
        $stmt->bindParam(":menu_id", $this->menu_id);
        $stmt->bindParam(":menu_name", $this->menu_name);
        $stmt->bindParam(":menu_harga", $this->menu_harga);
        $stmt->bindParam(":menu_disc", $this->menu_disc);
        $stmt->bindParam(":menu_status", $this->menu_status);

        // execute query
        if ($stmt->execute()) {
            return true;
        }
        return false;
    }
    function hapus_menu()
    {

        // query hapus
        $query = "DELETE FROM " . $this->table_menu . " WHERE menu_id = ?";
        // prepare query
        $stmt = $this->conn->prepare($query);
        // sanitize
        $this->menu_id = htmlspecialchars(strip_tags($this->menu_id));
        // bind menu_id of record to delete
        $stmt->bindParam(1, $this->menu_id);
        // execute query
        if ($stmt->execute()) {
            return true;
        }
        return false;
    }
    function tampil_satu_user()
    {
        // query untuk membaca satu data
        $query = "SELECT * FROM " . $this->table_user . " WHERE us_username = ?";
        // prepare query statement
        $stmt = $this->conn->prepare($query);
        // binding kode_obat
        $stmt->bindParam(1, $this->us_username);
        // eksekusi query
        $stmt->execute();
        // mengambil satu data obat sesuai kode_obat
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        // memberikan nilai ke object properties
        $this->us_username = $row['us_username'];
        $this->us_password = $row['us_password'];
        $this->us_fullname = $row['us_fullname'];
        $this->us_alamat = $row['us_alamat'];
        $this->us_telepon = $row['us_telepon'];
        $this->us_role_id = $row['us_role_id'];
    }
}
