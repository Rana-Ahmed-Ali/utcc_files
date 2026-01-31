<?php
include 'header.php';
?>
<div id="main-content">
    <h2>Edit Record</h2>


    <?php
    // if (isset($_POST['showbtn'])) {
        include 'db_connection.php';

        // $stu_roll_no = $_POST['roll_no'];
    $stu_roll_no = $_GET['id'];


        $sql = "SELECT student_info.*, courses.name AS CourseName, class_times.time_slot AS ClassTime, 
                       blood_groups.type AS BloodGroup, qualifications.name AS Qualification, 
                       course_durations.duration_length AS CourseDuration, status.status_name AS Status
                FROM student_info
                LEFT JOIN courses ON student_info.course_id = courses.id    
                LEFT JOIN class_times ON student_info.class_time_id = class_times.id
                LEFT JOIN blood_groups ON student_info.blood_group_id = blood_groups.id
                LEFT JOIN qualifications ON student_info.qualification_id = qualifications.id
                LEFT JOIN course_durations ON student_info.course_duration_id = course_durations.id
                LEFT JOIN status ON student_info.status_id = status.status_id
                WHERE roll_no = '$stu_roll_no'";

        $result = mysqli_query($conn, $sql) or die("Query Unsuccessful.");

        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                ?>
                <form class="post-form" action="updatedata.php" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="id">ID</label>
                        <input type="text" name="id" value="<?php echo $row['id']; ?>" readonly/>
                    </div>
                    <div class="form-group">
                        <label for="roll_no">Roll No</label>
                        <input type="text" name="roll_no" value="<?php echo $row['roll_no']; ?>" />
                    </div>
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" name="name" value="<?php echo $row['name']; ?>" />
                    </div>
                    <div class="form-group">
                        <label for="father_name">Father Name</label>
                        <input type="text" name="father_name" value="<?php echo $row['father_name']; ?>" />
                    </div>
                    <div class="form-group">
                        <label for="gender">Gender</label>
                        <select name="gender">
                            <option value="Male" <?php echo ($row['gender'] == 'Male') ? "selected" : ""; ?>>Male</option>
                            <option value="Female" <?php echo ($row['gender'] == 'Female') ? "selected" : ""; ?>>Female</option>
                            <option value="Other" <?php echo ($row['gender'] == 'Other') ? "selected" : ""; ?>>Other</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="phone_personal">Personal Phone</label>
                        <input type="text" name="phone_personal" value="<?php echo $row['phone_personal']; ?>" />
                    </div>
                    <div class="form-group">
                        <label for="phone_home">Home Phone</label>
                        <input type="text" name="phone_home" value="<?php echo $row['phone_home']; ?>" />
                    </div>
                    <div class="form-group">
                        <label for="phone_relatives">Relatives' Phone</label>
                        <input type="text" name="phone_relatives" value="<?php echo $row['phone_relatives']; ?>" />
                    </div>
                    <div class="form-group">
                        <label for="address">Address</label>
                        <textarea name="address"><?php echo $row['address']; ?></textarea>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" name="email" value="<?php echo $row['email']; ?>" />
                    </div>
                    <div class="form-group">
                        <label for="date_of_birth">Date of Birth</label>
                        <input type="date" name="date_of_birth" value="<?php echo $row['date_of_birth']; ?>" />
                    </div>
                    <div class="form-group">
                        <label for="admission_date">Admission Date</label>
                        <input type="date" name="admission_date" value="<?php echo $row['admission_date']; ?>" />
                    </div>
                    <div class="form-group">
                        <label for="blood_group_id">Blood Group</label>
                        <?php
                        $sql_bg = "SELECT * FROM blood_groups";
                        $result_bg = mysqli_query($conn, $sql_bg) or die("Query Unsuccessful.");

                        if (mysqli_num_rows($result_bg) > 0) {
                            echo "<select name='blood_group_id'>";
                            while ($row_bg = mysqli_fetch_assoc($result_bg)) {
                                $selected = ($row['blood_group_id'] == $row_bg['id']) ? "selected" : "";
                                echo "<option {$selected} value='{$row_bg['id']}'>{$row_bg['type']}</option>";
                            }
                            echo "</select>";
                        }
                        ?>
                    </div>
                    <div class="form-group">
                        <label for="qualification_id">Qualification</label>
                        <?php
                        $sql_qual = "SELECT * FROM qualifications";
                        $result_qual = mysqli_query($conn, $sql_qual) or die("Query Unsuccessful.");

                        if (mysqli_num_rows($result_qual) > 0) {
                            echo "<select name='qualification_id'>";
                            while ($row_qual = mysqli_fetch_assoc($result_qual)) {
                                $selected = ($row['qualification_id'] == $row_qual['id']) ? "selected" : "";
                                echo "<option {$selected} value='{$row_qual['id']}'>{$row_qual['name']}</option>";
                            }
                            echo "</select>";
                        }
                        ?>
                    </div>
                    <div class="form-group">
                        <label for="course_id">Course</label>
                        <?php
                        $sql_course = "SELECT * FROM courses";
                        $result_course = mysqli_query($conn, $sql_course) or die("Query Unsuccessful.");

                        if (mysqli_num_rows($result_course) > 0) {
                            echo "<select name='course_id'>";
                            while ($row_course = mysqli_fetch_assoc($result_course)) {
                                $selected = ($row['course_id'] == $row_course['id']) ? "selected" : "";
                                echo "<option {$selected} value='{$row_course['id']}'>{$row_course['name']}</option>";
                            }
                            echo "</select>";
                        }
                        ?>
                    </div>
                    <div class="form-group">
                        <label for="class_time_id">Class Time</label>
                        <?php
                        $sql_class_time = "SELECT * FROM class_times";
                        $result_class_time = mysqli_query($conn, $sql_class_time) or die("Query Unsuccessful.");

                        if (mysqli_num_rows($result_class_time) > 0) {
                            echo "<select name='class_time_id'>";
                            while ($row_class_time = mysqli_fetch_assoc($result_class_time)) {
                                $selected = ($row['class_time_id'] == $row_class_time['id']) ? "selected" : "";
                                echo "<option {$selected} value='{$row_class_time['id']}'>{$row_class_time['time_slot']}</option>";
                            }
                            echo "</select>";
                        }
                        ?>
                    </div>
                    <div class="form-group">
                        <label for="course_duration_id">Course Duration</label>
                        <?php
                        $sql_course_duration = "SELECT * FROM course_durations";
                        $result_course_duration = mysqli_query($conn, $sql_course_duration) or die("Query Unsuccessful.");

                        if (mysqli_num_rows($result_course_duration) > 0) {
                            echo "<select name='course_duration_id'>";
                            while ($row_course_duration = mysqli_fetch_assoc($result_course_duration)) {
                                $selected = ($row['course_duration_id'] == $row_course_duration['id']) ? "selected" : "";
                                echo "<option {$selected} value='{$row_course_duration['id']}'>{$row_course_duration['duration_length']}</option>";
                            }
                            echo "</select>";
                        }
                        ?>
                    </div>
                    <div class="form-group">
                        <label for="status_id">Status</label>
                        <?php
                        $sql_status = "SELECT * FROM status";
                        $result_status = mysqli_query($conn, $sql_status) or die("Query Unsuccessful.");

                        if (mysqli_num_rows($result_status) > 0) {
                            echo "<select name='status_id'>";
                            while ($row_status = mysqli_fetch_assoc($result_status)) {
                                $selected = ($row['status_id'] == $row_status['status_id']) ? "selected" : "";
                                echo "<option {$selected} value='{$row_status['status_id']}'>{$row_status['status_name']}</option>";
                            }
                            echo "</select>";
                        }
                        ?>
                    </div>
                    <input type="hidden" name="remaining_fees" value="<?php echo $row['RemainingFees']; ?>" />
                    <div class="form-group">
                        <label for="picture">Picture</label>
                        <input type="file" name="pic" />
                        <?php if (!empty($row['pic'])): ?>
                            <img src="<?php echo $row['pic']; ?>" alt="Student Picture" class="td-img" width=100 height=100>
                        <?php endif; ?>
                    </div>
                    <!-- <div class="form-group">
                        <label for="fingerprint">Fingerprint</label>
                        <input type="text" name="fingerprint" value="<?php echo $row['fingerprint']; ?>" />
                    </div> -->
                    <input class="submit" type="submit" value="Update" />
                </form>
                <?php
            }
        // } else {
        //     echo "<p>No records found for the provided Roll No.</p>";
        // }
    }
    ?>
</div>
</div>
</body>
</html>
