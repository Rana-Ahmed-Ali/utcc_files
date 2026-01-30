<?php
// $servername = "localhost";
// $username = "root"; // Default username for XAMPP
// $password = ""; // Default password for XAMPP (empty)
// $database = "ucc"; // Your database name


$servername = "localhost";
$username = "u961900210_adminu"; // Default username for XAMPP
$password = "adminUtcc12"; // Default password for XAMPP (empty)
$database = "u961900210_ucc"; // Your database name

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
