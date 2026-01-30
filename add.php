<?php
include 'header.php';
include 'db_connection.php';
?>

<div class="container" id="main-content">
    <h2>Add Student</h2>
    <form class="post-form" action="add_student.php" method="post" autocomplete="off" enctype="multipart/form-data">

        <!-- Personal Information -->
        <div class="form-group">
            <label>Name</label>
            <input type="text" name="name" required />
        </div>
        <div class="form-group">
            <label>Father Name</label>
            <input type="text" name="father_name" required autocomplete="off" />
        </div>
        <div class="form-group">
            <label>CNIC</label>
            <input type="text" name="id" autocomplete="off" />
        </div>
        <div class="form-group">
            <label>Gender</label>
            <select name="gender">
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>
        </div>
        <div class="form-group">
            <label>Personal Phone</label>
            <input type="tel" name="phone_personal" autocomplete="off" />
        </div>
        <div class="form-group">
            <label>Home Phone</label>
            <input type="tel" name="phone_home" autocomplete="off" />
        </div>
        <div class="form-group">
            <label>Relative Phone</label>
            <input type="tel" name="phone_relatives" autocomplete="off" />
        </div>
        <div class="form-group">
            <label>Address</label>
            <textarea name="address"></textarea>
        </div>
        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" />
        </div>
        <div class="form-group">
            <label>Date of Birth</label>
            <input type="date" name="date_of_birth" />
        </div>
        
        <input type="hidden" name="admission_date" value="<?php echo date('Y-m-d'); ?>" />

        <div class="form-group">
            <label>Picture</label>
            <input type="file" name="pic" />
        </div>

        <!-- Fees Section -->
        <div class="form-group">
            <label>Course</label>
            <select id="course_id" name="course_id" onchange="fetchFees()">
                <option value="" selected disabled>Select Course</option>
                <?php
                $courses = mysqli_query($conn, "SELECT * FROM courses");
                while ($row = mysqli_fetch_assoc($courses)) {
                    echo "<option value='{$row['id']}' data-fees='{$row['fees']}'>{$row['name']}</option>";
                }
                ?>
            </select>
        </div>

        <div class="form-group">
            <label>Course Duration</label>
            <select name="course_duration_id">
                <option value="" selected disabled>Select Duration</option>
                <?php
                $durations = mysqli_query($conn, "SELECT * FROM course_durations");
                while ($row = mysqli_fetch_assoc($durations)) {
                    echo "<option value='{$row['id']}'>{$row['duration_length']}</option>";
                }
                ?>
            </select>
        </div>

        <div class="form-group">
            <label>Course Fees</label>
            <input type="text" id="course_fees" name="course_fees" readonly />
        </div>
        <div class="form-group">
            <label>Submitted Fees</label>
            <input type="text" id="submitted_fees" name="submitted_fees" oninput="calculateRemaining()" />
        </div>
        <div class="form-group">
            <label>Discounted Fees</label>
            <input type="text" id="discounted_fees" name="discounted_fees" oninput="calculateRemaining()" />
        </div>
        <div class="form-group">
            <label>Remaining Fees</label>
            <input type="text" id="remaining_fees" name="remaining_fees" />
        </div>

        <!-- Other Information -->
        <div class="form-group">
            <label>Blood Group</label>
            <select name="blood_group_id">
                <option value="" selected disabled>Select Blood Group</option>
                <?php
                $blood_groups = mysqli_query($conn, "SELECT * FROM blood_groups");
                while ($row = mysqli_fetch_assoc($blood_groups)) {
                    echo "<option value='{$row['id']}'>{$row['type']}</option>";
                }
                ?>
            </select>
        </div>
        <div class="form-group">
            <label>Qualification</label>
            <select name="qualification_id">
                <option value="" selected disabled>Select Qualification</option>
                <?php
                $qualifications = mysqli_query($conn, "SELECT * FROM qualifications");
                while ($row = mysqli_fetch_assoc($qualifications)) {
                    echo "<option value='{$row['id']}'>{$row['name']}</option>";
                }
                ?>
            </select>
        </div>
        <div class="form-group">
            <label>Class Time</label>
            <select name="class_time_id">
                <option value="" selected disabled>Select Class Time</option>
                <?php
                $times = mysqli_query($conn, "SELECT * FROM class_times");
                while ($row = mysqli_fetch_assoc($times)) {
                    echo "<option value='{$row['id']}'>{$row['time_slot']}</option>";
                }
                ?>
            </select>
        </div>
        <div class="form-group">
            <label>Status</label>
            <select name="status_id">
                <option value="" selected disabled>Select Status</option>
                <?php
                $statuses = mysqli_query($conn, "SELECT * FROM status");
                while ($row = mysqli_fetch_assoc($statuses)) {
                    echo "<option value='{$row['status_id']}'>{$row['status_name']}</option>";
                }
                ?>
            </select>
        </div>

        <input class="submit" type="submit" value="Submit">
    </form>
</div>

<script>
    function fetchFees() {
        let selectedCourse = document.getElementById('course_id');
        let courseFees = selectedCourse.options[selectedCourse.selectedIndex].getAttribute('data-fees');
        document.getElementById('course_fees').value = courseFees;
        calculateRemaining();
    }

    function calculateRemaining() {
        let fees = parseFloat(document.getElementById('course_fees').value) || 0;
        let submitted = parseFloat(document.getElementById('submitted_fees').value) || 0;
        let discount = parseFloat(document.getElementById('discounted_fees').value) || 0;
        document.getElementById('remaining_fees').value = fees - (submitted + discount);
    }
</script>
