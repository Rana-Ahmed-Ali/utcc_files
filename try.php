<?php
include 'db_connection.php';

// Replace 'specific_roll_no' with an actual roll number from your database
$roll_no = 'specific_roll_no';

$sql = "SELECT pic FROM student_info WHERE roll_no = '24/1' LIMIT 1";
$result = mysqli_query($conn, $sql);

if ($row = mysqli_fetch_assoc($result)) {
    if ($row['pic']) {
        header("Content-Type: image/jpeg");
        echo $row['pic'];
    } else {
        echo "No image found for roll number: $roll_no.";
    }
} else {
    echo "No record found for roll number: $roll_no.";
}

mysqli_close($conn);
?>
