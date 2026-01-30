<?php
include "db_connection.php";

$roll_no = $_GET['roll_no'];

$query = "SELECT payment_date, amount_paid FROM fee_payments WHERE roll_no = ? ORDER BY payment_date DESC";
$stmt = $conn->prepare($query);
$stmt->bind_param("s", $roll_no);
$stmt->execute();
$result = $stmt->get_result();

$records = [];
while ($row = $result->fetch_assoc()) {
    $records[] = $row;
}

echo json_encode($records);
?>
