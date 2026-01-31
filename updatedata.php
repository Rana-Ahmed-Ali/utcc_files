<?php
// Get form data
$stu_id = $_POST['id'];
$stu_roll_no = $_POST['roll_no'];
$stu_name = $_POST['name'];
$stu_father_name = $_POST['father_name'];
$stu_gender = $_POST['gender'];
$stu_phone_personal = $_POST['phone_personal'];
$stu_phone_home = $_POST['phone_home'];
$stu_phone_relatives = $_POST['phone_relatives'];
$stu_address = $_POST['address'];
$stu_email = $_POST['email'];
$stu_date_of_birth = $_POST['date_of_birth'];
$stu_admission_date = $_POST['admission_date'];
$stu_blood_group_id = $_POST['blood_group_id'];
$stu_qualification_id = $_POST['qualification_id'];
$stu_course_id = $_POST['course_id'];
$stu_class_time_id = $_POST['class_time_id'];
$stu_course_duration_id = $_POST['course_duration_id'];
$stu_status_id = $_POST['status_id'];
$stu_remaining_fees = $_POST['remaining_fees'];

include 'db_connection.php';

$upload_dir = 'uploads/pictures/';
if (!file_exists($upload_dir)) {
    mkdir($upload_dir, 0777, true);
}
$picture = "";

// Handle file upload
if (!empty($_FILES['pic']['name'])) {
    $picture_name = time() . "_" . basename($_FILES['pic']['name']); // Rename file to avoid conflicts
    $picture_temp = $_FILES['pic']['tmp_name'];
    $target_path = $upload_dir . $picture_name;

    if (move_uploaded_file($picture_temp, $target_path)) {
        $picture = $target_path; // Store full path for DB

        // Remove old image from the server (optional)
        $old_img_query = "SELECT pic FROM student_info WHERE id = '$stu_id'";
        $old_img_result = mysqli_query($conn, $old_img_query);

        if ($old_img_result && mysqli_num_rows($old_img_result) > 0) {
            $old_img_row = mysqli_fetch_assoc($old_img_result);
            $old_img = $old_img_row['pic'];
            // Check if file exists treating DB value as relative path
            if (!empty($old_img) && file_exists($old_img)) {
                unlink($old_img); // Delete old image
            }
        }
    } else {
        echo "File upload failed!";
        exit;
    }
}

// SQL query
if (!empty($picture)) {
    $sql = "UPDATE student_info SET 
                roll_no = '$stu_roll_no',
                name = '$stu_name',
                father_name = '$stu_father_name',
                gender = '$stu_gender',
                phone_personal = '$stu_phone_personal',
                phone_home = '$stu_phone_home',
                phone_relatives = '$stu_phone_relatives',
                address = '$stu_address',
                email = '$stu_email',
                date_of_birth = '$stu_date_of_birth',
                admission_date = '$stu_admission_date',
                blood_group_id = '$stu_blood_group_id',
                qualification_id = '$stu_qualification_id',
                course_id = '$stu_course_id',
                class_time_id = '$stu_class_time_id',
                course_duration_id = '$stu_course_duration_id',
                status_id = '$stu_status_id',
                RemainingFees = '$stu_remaining_fees',
                pic = '$picture'
            WHERE id = '$stu_id'";
} else {
    $sql = "UPDATE student_info SET 
                roll_no = '$stu_roll_no',
                name = '$stu_name',
                father_name = '$stu_father_name',
                gender = '$stu_gender',
                phone_personal = '$stu_phone_personal',
                phone_home = '$stu_phone_home',
                phone_relatives = '$stu_phone_relatives',
                address = '$stu_address',
                email = '$stu_email',
                date_of_birth = '$stu_date_of_birth',
                admission_date = '$stu_admission_date',
                blood_group_id = '$stu_blood_group_id',
                qualification_id = '$stu_qualification_id',
                course_id = '$stu_course_id',
                class_time_id = '$stu_class_time_id',
                course_duration_id = '$stu_course_duration_id',
                status_id = '$stu_status_id',
                RemainingFees = '$stu_remaining_fees'
            WHERE id = '$stu_id'";
}

// Execute query
$result = mysqli_query($conn, $sql);

if ($result) {
    header("Location: index.php");
    exit;
} else {
    echo "Update failed: " . mysqli_error($conn);
}

mysqli_close($conn);
?>
