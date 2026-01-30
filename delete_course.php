<?php
include 'db_connection.php';

if (isset($_GET['id'])) {
    $courseId = $_GET['id'];

    // Get image path before deleting
    $query = "SELECT picture FROM courses WHERE id = $courseId";
    $result = mysqli_query($conn, $query);
    $course = mysqli_fetch_assoc($result);

    // Delete the course record
    $sql = "DELETE FROM courses WHERE id = $courseId";
    if (mysqli_query($conn, $sql)) {
        // Delete the image file
        if (!empty($course['picture']) && file_exists($course['picture'])) {
            unlink($course['picture']);
        }
        header("Location: courses.php");
        exit();
    } else {
        echo "<p>Error deleting course: " . mysqli_error($conn) . "</p>";
    }
}
?>
