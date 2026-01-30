<?php
// get_student_info.php
include "db_connection.php";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

if(isset($_GET['roll_no'])) {
    $roll_no = $conn->real_escape_string($_GET['roll_no']);
    $sql = "SELECT si.*, 
                   bg.type AS blood_group,
                   q.name AS qualification,
                   c.name AS course,
                   ct.time_slot AS class_time,
                   cd.duration_length AS course_duration,
                   s.status_name AS status
            FROM student_info si
            LEFT JOIN blood_groups bg ON si.blood_group_id = bg.id
            LEFT JOIN qualifications q ON si.qualification_id = q.id
            LEFT JOIN courses c ON si.course_id = c.id
            LEFT JOIN class_times ct ON si.class_time_id = ct.id
            LEFT JOIN course_durations cd ON si.course_duration_id = cd.id
            LEFT JOIN status s ON si.status_id = s.status_id
            WHERE si.roll_no = '$roll_no'";

    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $student_info = $result->fetch_assoc();
        echo json_encode($student_info);
    } else {
        echo json_encode(['error' => 'No student found']);
    }
} else {
    echo json_encode(['error' => 'Invalid request']);
}

$conn->close();
?>
