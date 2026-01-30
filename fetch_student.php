<?php
include "db_connection.php";

if (isset($_POST['roll_no'])) {
    $roll_no = $_POST['roll_no'];
    $query = "SELECT roll_no, name, father_name, RemainingFees, pic FROM student_info WHERE roll_no = '$roll_no'";

    $result = mysqli_query($conn, $query);
    if ($row = mysqli_fetch_assoc($result)) {
        echo json_encode($row);
    } else {
        echo json_encode(['error' => 'Student not found']);
    }
    exit();
}
