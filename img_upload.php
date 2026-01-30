<?php
error_reporting(E_ALL);
?>
<html>
<head>
    <title>File Upload</title>
</head>
<body>
    <form action="#" method="POST" enctype="multipart/form-data">
        <input type="file" name="uploadfile"><br><br>
        <input type="submit" name="submit" value="Upload File">    
    </form>
</body>
</html>

<?php
if (isset($_POST['submit'])) {
    $filename = $_FILES["uploadfile"]["name"];
    $tempname = $_FILES["uploadfile"]["tmp_name"];
    $folder = "images/" . $filename;
    
    if (!file_exists('images')) {
        mkdir('images', 0777, true);
    }

    if (move_uploaded_file($tempname, $folder)) {
        echo "File uploaded successfully!";
    } else {
        echo "Failed to upload file.";
    }
}
?>
