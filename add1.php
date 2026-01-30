<?php
 include 'header.php'; 
 include 'db_connection.php'; 
?>
<div class="container" id="main-content">
        <h2>Add Student</h2>
        <form class="post-form" action="add_student.php" method="post">
        <div class="form-group">
            <label>Roll No</label>
            <input type="number" name="roll_no" required />
        </div>

        <div class="form-group">
            <label>Name</label>
            <input type="text" name="name" required />
        </div>
        <div class="form-group">
            <label>Father Name</label>
            <input type="text" name="father_name" required />
        </div>
        <div class="form-group">
            <label for="id">ID:</label>
            <input type="text" id="id" name="id"><br><br>
        </div>
        <div class="form-group">
            <label>Gender</label>
            <select id="gender" name="gender">
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select><br><br>
        </div>
        <div class="form-group">
            <label>Personal Phone</label>
            <input type="tel" id="phone_personal" name="phone_personal"><br><br>
        </div>
        <div class="form-group">
            <label>Home Phone</label>
            <input type="tel" id="phone_home" name="phone_home"><br><br>
        </div>
        <div class="form-group">
            <label>Relatives Phone</label>
            <input type="tel" id="phone_relatives" name="phone_relatives"><br><br>
        </div>
        <div class="form-group">
            <label>Address</label>
            <textarea id="address" name="address"></textarea><br><br>
        </div>
        <div class="form-group">
            <label>Email</label>
            <input type="email" id="email" name="email"><br><br>
        </div>
        <div class="form-group">
            <label>Date of Birth</label>
            <input type="date" id="date_of_birth" name="date_of_birth"><br><br>
        </div>
        <div class="form-group">
            <label for="pic">Picture:</label>
            <input type="file" id="pic" name="pic"><br><br>
        </div>
        <div class="form-group">
            <label for="fingerprint">Fingerprint:</label>
            <input type="file" id="fingerprint" name="fingerprint"><br><br>
        </div>
        <div class="form-group">
            <label for="submitted_fees">Submitted Fees:</label>
            <input type="text" id="submitted_fees" name="submitted_fees"><br><br>
        </div>
        <div class="form-group">
            <label for="discounted_fees">Discounted Fees:</label>
            <input type="text" id="discounted_fees" name="discounted_fees"><br><br>
        </div>

        <div class="form-group">
            <label for="blood_group_id">Blood Group:</label>
            <select id="blood_group_id" name="blood_group_id">
                <option value="" selected disabled>blood group</option>
                <?php
                // Query to fetch blood groups
                $sql = "SELECT * FROM blood_groups";
                $result = mysqli_query($conn, $sql);
                // Display blood groups in dropdown
                while ($row = mysqli_fetch_assoc($result)) {
                    echo "<option value='" . $row['id'] . "'>" . $row['type'] . "</option>";
                }
                ?>
            </select>
        </div>
        <div class="form-group">
        <label for="qualification_id">Qualification:</label>
            <select id="qualification_id" name="qualification_id">
                <option value="" selected disabled>Qualification</option>
                <?php
                // Query to fetch qualifications
                $sql = "SELECT * FROM qualifications";
                $result = mysqli_query($conn, $sql);
                
                // Display qualifications in dropdown
                while ($row = mysqli_fetch_assoc($result)) {
                    echo "<option value='" . $row['id'] . "'>" . $row['name'] . "</option>";
                }
                ?>
            </select><br><br>
        </div>

        <div class="form-group">
            <label for="course_id">Course:</label>
            <select id="course_id" name="course_id">
            <option value="" selected disabled>Course</option>

                <?php
                // Query to fetch courses
                $sql = "SELECT * FROM courses";
                $result = mysqli_query($conn, $sql);
                
                // Display courses in dropdown
                while ($row = mysqli_fetch_assoc($result)) {
                    echo "<option value='" . $row['id'] . "'>" . $row['name'] . "</option>";
                }
                ?>
            </select><br><br>
        </div>

        <div class="form-group">
            <label for="class_time_id">Class Time:</label>
            <select id="class_time_id" name="class_time_id">
            <option value="" selected disabled>Time</option>
                <?php
                // Query to fetch class times
                $sql = "SELECT * FROM class_times";
                $result = mysqli_query($conn, $sql);
                
                // Display class times in dropdown
                while ($row = mysqli_fetch_assoc($result)) {
                    echo "<option value='" . $row['id'] . "'>" . $row['time_slot'] . "</option>";
                }
                ?>
            </select><br><br>
        </div>

        <div class="form-group">
            <label for="course_duration_id">Course Duration:</label>
            <select id="course_duration_id" name="course_duration_id">
            <option value="" selected disabled>Duration</option>
                <?php
                // Query to fetch course durations
                $sql = "SELECT * FROM course_durations";
                $result = mysqli_query($conn, $sql);
                
                // Display course durations in dropdown
                while ($row = mysqli_fetch_assoc($result)) {
                    echo "<option value='" . $row['id'] . "'>" . $row['duration_length'] . "</option>";
                }
                ?>
            </select><br><br>
        </div>

        <div class="form-group">
            <label for="status_id">Status:</label>
            <select id="status_id" name="status_id">
            <option value="" selected disabled>Status</option>
                <?php
                // Query to fetch statuses
                $sql = "SELECT * FROM status";
                $result = mysqli_query($conn, $sql);
                
                // Display statuses in dropdown
                while ($row = mysqli_fetch_assoc($result)) {
                    echo "<option value='" . $row['status_id'] . "'>" . $row['status_name'] . "</option>";
                }
                ?>
            </select><br><br>
            </div>

            <input class="submit" type="submit" value="Submit">
        </form>
    </div>
</div>
</body>
</html>
