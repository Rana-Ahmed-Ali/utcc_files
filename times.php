<?php
include 'header.php';

include 'db_connection.php';


if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

if (isset($_POST['add_time'])) {
    $class_time = $_POST['class_time'];

    // Convert 12-hour time to 24-hour format
    $convertedTime = date("H:i:s", strtotime($class_time));

    // Insert the new time slot into the 'time' table
    $sql = "INSERT INTO class_times (time_slot) VALUES ('$convertedTime')";
    if (mysqli_query($conn, $sql)) {
        echo "Time slot added successfully.";
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }
}

if (isset($_POST['remove_time'])) {
    $time_id = $_POST['time_id'];

    // Delete the selected time slot from the 'time' table
    $sql = "DELETE FROM class_times WHERE id = $time_id";
    if (mysqli_query($conn, $sql)) {
        echo "Time slot removed successfully.";
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }
}

// Query to retrieve the list of existing time slots
$timeQuery = "SELECT * FROM class_times";
$timeResult = mysqli_query($conn, $timeQuery);

mysqli_close($conn);
?>

<div id="main-content">
    <h2>Add or Remove Time Slots</h2>
    <form class="post-form" action="" method="post">
        <div class="form-group">
            <label>Add Time Slot (12-hour format)</label>
            <input type="time" name="class_time" required/>
            <input class="submit" type="submit" name="add_time" value="Add" />
        </div>
    </form>

    <form class="post-form" action="" method="post">
        <div class="form-group">
            <label>Remove Time Slot</label>
            <select name="time_id" required>
                <option value="" selected disabled>Select Time Slot to Remove</option>
                <?php
                while ($row = mysqli_fetch_assoc($timeResult)) {
                    $timeID = $row['id'];
                    $classTime = date("h:i A", strtotime($row['time_slot'])); // Convert time to 12-hour format
                    echo "<option value='$timeID'>$classTime</option>";
                }
                ?>
            </select>
            <input class="submit" type="submit" name="remove_time" value="Remove" />
        </div>
    </form>
</div>

</body>
</html>
