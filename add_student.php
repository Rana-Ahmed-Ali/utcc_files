<?php
// Include database connection
include 'db_connection.php';

// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data with checks for missing keys
    $name = mysqli_real_escape_string($conn, $_POST['name']);
    $father_name = mysqli_real_escape_string($conn, $_POST['father_name']);
    $id = mysqli_real_escape_string($conn, $_POST['id']);
    $gender = isset($_POST['gender']) ? $_POST['gender'] : null;
    $phone_personal = isset($_POST['phone_personal']) ? $_POST['phone_personal'] : null;
    $phone_home = isset($_POST['phone_home']) ? $_POST['phone_home'] : null;
    $phone_relatives = isset($_POST['phone_relatives']) ? $_POST['phone_relatives'] : null;
    $address = mysqli_real_escape_string($conn, $_POST['address']);
    $email = isset($_POST['email']) ? $_POST['email'] : null;
    $date_of_birth = isset($_POST['date_of_birth']) ? $_POST['date_of_birth'] : null;
    $admission_date = isset($_POST['admission_date']) ? $_POST['admission_date'] : date('Y-m-d'); // Default to current date
    $submitted_fees = isset($_POST['submitted_fees']) ? $_POST['submitted_fees'] : 0;
    $discounted_fees = isset($_POST['discounted_fees']) ? $_POST['discounted_fees'] : 0;
    $blood_group_id = isset($_POST['blood_group_id']) ? $_POST['blood_group_id'] : null;
    $qualification_id = isset($_POST['qualification_id']) ? $_POST['qualification_id'] : null;
    $course_id = isset($_POST['course_id']) ? $_POST['course_id'] : null;
    $class_time_id = isset($_POST['class_time_id']) ? $_POST['class_time_id'] : null;
    $course_duration_id = isset($_POST['course_duration_id']) ? $_POST['course_duration_id'] : null;
    $status_id = isset($_POST['status_id']) ? $_POST['status_id'] : null;

    // Check if course_duration_id exists in the database
    $checkCourseDuration = mysqli_query($conn, "SELECT id FROM course_durations WHERE id = '$course_duration_id'");
    if (mysqli_num_rows($checkCourseDuration) == 0) {
        die("Error: Invalid course_duration_id. Please select a valid course duration.");
    }

    // File upload handling
    $pic_folder = null;
    $fingerprint_folder = null;

    if (!empty($_FILES['pic']['name'])) {
        $pic = $_FILES['pic']['name'];
        $pic_temp = $_FILES['pic']['tmp_name'];
        $pic_folder = "uploads/pictures/" . basename($pic);
        if (!file_exists('uploads/pictures')) {
            mkdir('uploads/pictures', 0777, true);
        }
        move_uploaded_file($pic_temp, $pic_folder);
    }

    if (!empty($_FILES['fingerprint']['name'])) {
        $fingerprint = $_FILES['fingerprint']['name'];
        $fingerprint_temp = $_FILES['fingerprint']['tmp_name'];
        $fingerprint_folder = "uploads/fingerprints/" . basename($fingerprint);
        if (!file_exists('uploads/fingerprints')) {
            mkdir('uploads/fingerprints', 0777, true);
        }
        move_uploaded_file($fingerprint_temp, $fingerprint_folder);
    }

    // Handle Roll Number
    if (isset($_POST['roll_no']) && !empty(trim($_POST['roll_no']))) {
        $roll_no = mysqli_real_escape_string($conn, $_POST['roll_no']);
    } else {
        // Generate roll number
        $currentYear = date('y');
        $result = mysqli_query($conn, "SELECT COUNT(*) as count FROM student_info WHERE roll_no LIKE '$currentYear/%'");
        $row = mysqli_fetch_assoc($result);
        $nextNumber = $row['count'] + 1;
        $roll_no = "$currentYear/$nextNumber";
    }

    // Retrieve the course fee for the selected course
    $courseFeeQuery = "SELECT fees FROM courses WHERE id = '$course_id'";
    $courseFeeResult = mysqli_query($conn, $courseFeeQuery);

    if ($courseFeeResult && mysqli_num_rows($courseFeeResult) > 0) {
        $row = mysqli_fetch_assoc($courseFeeResult);
        $courseFee = $row['fees'];

        // Calculate the remaining fees
        $remainingFees = $courseFee - $submitted_fees - $discounted_fees;
    } else {
        $remainingFees = null; // Handle case where course fee is not found
    }

    // Prepare INSERT statement
    $sql = "INSERT INTO student_info (roll_no, name, father_name, id, gender, phone_personal, phone_home, phone_relatives, address, email, date_of_birth, admission_date, pic, fingerprint, submitted_fees, discounted_fees, blood_group_id, qualification_id, course_id, class_time_id, course_duration_id, status_id, RemainingFees) 
            VALUES ('$roll_no', '$name', '$father_name', '$id', '$gender', '$phone_personal', '$phone_home', '$phone_relatives', '$address', '$email', '$date_of_birth', '$admission_date', '$pic_folder', '$fingerprint_folder', '$submitted_fees', '$discounted_fees', '$blood_group_id', '$qualification_id', '$course_id', '$class_time_id', '$course_duration_id', '$status_id', '$remainingFees')";

    // Execute INSERT statement
    if (mysqli_query($conn, $sql)) {
        header("Location: index.php"); // Redirect only if successful
        exit();
    } else {
        echo "Error: " . mysqli_error($conn);
    }
}

// Close database connection
mysqli_close($conn);
?>
