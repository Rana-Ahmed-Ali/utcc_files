<?php
include 'header.php';
include 'db_connection.php';

$courseName = $courseFee = $courseImage = "";
$updateMode = false;

// Check if editing an existing course
if (isset($_GET['id'])) {
    $updateMode = true;
    $courseId = $_GET['id'];
    $query = "SELECT * FROM courses WHERE id = $courseId";
    $result = mysqli_query($conn, $query);
    $course = mysqli_fetch_assoc($result);
    $courseName = $course['name'];
    $courseFee = $course['fees'];
    $courseImage = $course['picture'];
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $courseId = $_POST['course_id'] ?? null;
    $courseName = mysqli_real_escape_string($conn, $_POST['course_name']);
    $courseFee = mysqli_real_escape_string($conn, $_POST['course_fee']);
    
    // File upload handling
    $imagePath = $courseImage;
    if (!empty($_FILES['course_image']['name'])) {
        $targetDir = "uploads/";
        if (!file_exists($targetDir)) {
            mkdir($targetDir, 0777, true);
        }
        $imageFileType = strtolower(pathinfo($_FILES["course_image"]["name"], PATHINFO_EXTENSION));
        $newFileName = uniqid() . "." . $imageFileType;
        $targetFile = $targetDir . $newFileName;

        if (move_uploaded_file($_FILES["course_image"]["tmp_name"], $targetFile)) {
            $imagePath = $targetFile;
        }
    }

    if ($courseId) {
        // Update existing course
        $sql = "UPDATE courses SET name='$courseName', fees='$courseFee', picture='$imagePath' WHERE id=$courseId";
    } else {
        // Insert new course
        $sql = "INSERT INTO courses (name, fees, picture) VALUES ('$courseName', '$courseFee', '$imagePath')";
    }

    if (mysqli_query($conn, $sql)) {
        header("Location: courses.php");
        exit();
    } else {
        echo "<p>Error: " . mysqli_error($conn) . "</p>";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $updateMode ? "Edit Course" : "Add New Course"; ?></title>
    <link rel="stylesheet" href="style1.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>

<div id="main-content">
    <h2><i class="fa <?php echo $updateMode ? 'fa-edit' : 'fa-plus'; ?>"></i> <?php echo $updateMode ? "Edit Course" : "Add New Course"; ?></h2>
    <form class="post-form" action="add_course.php<?php echo $updateMode ? "?id=$courseId" : ""; ?>" method="post" enctype="multipart/form-data">
        <input type="hidden" name="course_id" value="<?php echo $updateMode ? $courseId : ''; ?>">
        
        <div class="form-group">
            <label><i class="fa fa-book"></i> Course Name</label>
            <input type="text" name="course_name" value="<?php echo $courseName; ?>" required />
        </div>
        
        <div class="form-group">
            <label><i class="fa fa-dollar-sign"></i> Course Fee</label>
            <input type="number" name="course_fee" step="0.01" value="<?php echo $courseFee; ?>" required />
        </div>
        
        <div class="form-group">
            <label><i class="fa fa-image"></i> Course Image</label>
            <input type="file" name="course_image" accept="image/*" />
            <?php if ($updateMode && $courseImage) { ?>
                <p>Current Image:</p>
                <img src="<?php echo $courseImage; ?>" width="100">
            <?php } ?>
        </div>
        
        <input class="submit-btn" type="submit" value="<?php echo $updateMode ? "Update Course" : "Add Course"; ?>" />
    </form>
</div>

</body>
</html>
