<?php
include 'header.php';
include 'db_connection.php';

$sql = "SELECT * FROM courses";
$result = mysqli_query($conn, $sql);
?>

<!-- Font Awesome for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<div id="main-content">
    <h2>Course List</h2>
    <a href="add_course.php" class="p-btn">Add New Course</a>
    
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Course Name</th>
            <th>Fee</th>
            <th>Image</th>
            <th>Actions</th>
        </tr>
        <?php while ($row = mysqli_fetch_assoc($result)) { ?>
        <tr>
            <td><?php echo $row['id']; ?></td>
            <td><?php echo $row['name']; ?></td>
            <td><?php echo $row['fees']; ?></td>
            <td><img src="<?php echo $row['picture']; ?>" width="50" height="50"></td>
            <td>
                <a href="edit_course.php?id=<?php echo $row['id']; ?>" class="edit-btn" title="Edit">
                    <i class="fa-solid fa-pen-to-square"></i>
                </a> 
                <a href="delete_course.php?id=<?php echo $row['id']; ?>" class="delete-btn" title="Delete" onclick="return confirm('Are you sure?');">
                    <i class="fa-solid fa-trash"></i>
                </a>
            </td>
        </tr>
        <?php } ?>
    </table>
</div>

<!-- Custom Styling for Buttons -->
<style>
    .edit-btn, .delete-btn {
        font-size: 20px;
        padding: 8px 12px;
        border-radius: 5px;
        text-decoration: none;
        transition: 0.3s ease-in-out;
    }

    .edit-btn {
        color: #1abc9c;
    }

    .edit-btn:hover {
        background-color: #1abc9c;
        color: #000;
    }

    .delete-btn {
        color: #e74c3c;
    }

    .delete-btn:hover {
        background-color: #e74c3c;
        color: #fff;
    }

    #main-content table img {
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(255, 255, 255, 0.2);
    }

    .p-btn {
        display: inline-block;
        padding: 10px 15px;
        font-size: 16px;
        color: #fff;
        background-color: #1abc9c;
        border-radius: 5px;
        text-decoration: none;
        transition: 0.3s ease;
    }

    .p-btn:hover {
        background-color: #16a085;
        transform: scale(1.05);
    }
</style>

</body>
</html>
