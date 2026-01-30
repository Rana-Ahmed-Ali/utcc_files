<?php
if (isset($_GET['id'])) {
    header("Location: add_course.php?id=" . $_GET['id']);
    exit();
}
?>
