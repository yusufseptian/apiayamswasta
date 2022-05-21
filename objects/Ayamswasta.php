<?php
class Ayamswasta
{
    private $conn;

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
    function simpan()
    {
        // query untuk menyimpan data 
        $query = "INSERT INTO tb_user
            VALUES(us_id(), :us_username, :us_password, )";
        // prepare query
        $stmt = $this->conn->prepare($query);
        // sanitize
        $this->kode_obat = htmlspecialchars(strip_tags($this->kode_obat));
        $this->nama_obat = htmlspecialchars(strip_tags($this->nama_obat));
        $this->stok = htmlspecialchars(strip_tags($this->stok));
        $this->satuan = htmlspecialchars(strip_tags($this->satuan));
        $this->harga_pokok = htmlspecialchars(strip_tags($this->harga_pokok));
        // bind nilai property
        $stmt->bindParam(":kode_obat", $this->kode_obat);
        $stmt->bindParam(":nama_obat", $this->nama_obat);
        $stmt->bindParam(":stok", $this->stok);
        $stmt->bindParam(":satuan", $this->satuan);
        $stmt->bindParam(":harga_pokok", $this->harga_pokok);

        // execute query
        if ($stmt->execute()) {
            return true;
        }
        return false;
    }
    function tampil_menu()
    {
        $query = "SELECT * FROM tb_menu";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }
}
