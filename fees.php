<?php
// Database connection
include "db_connection.php";
include "header.php";

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch students with pending dues
$sql = "SELECT s.roll_no, s.pic, s.name, s.father_name, c.name AS course, d.duration_length, 
               s.admission_date, s.RemainingFees, s.submitted_fees
        FROM student_info s
        JOIN courses c ON s.course_id = c.id
        JOIN course_durations d ON s.course_duration_id = d.id
        WHERE s.RemainingFees > 0";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pending Fees</title>
    <link rel="stylesheet" href="fees_styles.css">
</head>
<div id="wrapper">
    <div id="header">
        <h1>Pending Fees</h1>
    </div>

    <div id="main-content">
        <table>
            <tr>
                <th>Pic</th>
                <th>Name</th>
                <th>Father Name</th>
                <th>Course</th>
                <th>Duration</th>
                <th>Admission Date</th>
                <th>Pending Dues</th>
                <th>Actions</th>
            </tr>
            <?php while ($row = $result->fetch_assoc()) { ?>
                <tr>
                    <td><img src="<?php echo $row['pic']; ?>" width="50"></td>
                    <td><?php echo $row['name']; ?></td>
                    <td><?php echo $row['father_name']; ?></td>
                    <td><?php echo $row['course']; ?></td>
                    <td><?php echo $row['duration_length']; ?></td>
                    <td><?php echo $row['admission_date']; ?></td>
                    <td><?php echo $row['RemainingFees']; ?></td>
                    <td>
                        <button class="p-btn" onclick="openForm('<?php echo $row['roll_no']; ?>', '<?php echo $row['name']; ?>', '<?php echo $row['father_name']; ?>', '<?php echo $row['course']; ?>', '<?php echo $row['duration_length']; ?>', '<?php echo $row['admission_date']; ?>', '<?php echo $row['submitted_fees']; ?>', '<?php echo $row['RemainingFees']; ?>', '<?php echo $row['pic']; ?>')">Pay Fees</button>
                        <button class="submit-btn" onclick="viewRecords('<?php echo $row['roll_no']; ?>')">View Records</button>
                    </td>
                </tr>
            <?php } ?>
        </table>

        <!-- Payment Form Modal -->
        <div id="paymentForm">
            <h3>Pay Fees</h3>
            <form id="payFeesForm">
                <img id="student_pic" width="70"><br>

                <label>Roll No:</label>
                <p id="roll_no_text"></p>
                <input type="hidden" id="roll_no" name="roll_no">

                <label>Name:</label>
                <p id="student_name_text"></p>
                <input type="hidden" id="student_name" name="student_name">

                <label>Father Name:</label>
                <p id="father_name_text"></p>
                <input type="hidden" id="father_name" name="father_name">

                <label>Course:</label>
                <p id="course_text"></p>
                <input type="hidden" id="course" name="course">

                <label>Duration:</label>
                <p id="duration_text"></p>
                <input type="hidden" id="duration" name="duration">

                <label>Admission Date:</label>
                <p id="admission_date_text"></p>
                <input type="hidden" id="admission_date" name="admission_date">

                <label>Submitted Fees:</label>
                <p id="submitted_fees_text"></p>
                <input type="hidden" id="submitted_fees" name="submitted_fees">

                <label>Pending Dues:</label>
                <p id="pending_dues_text"></p>
                <input type="hidden" id="pending_dues" name="pending_dues">

                <label>Fees Pay Now:</label>
                <input type="number" id="fees_now" name="fees_paid_now" required>

                <button type="submit">Submit</button>
                <button type="button" onclick="closeForm()">Close</button>
            </form>
        </div>



        <!-- View Records Modal -->
        <div id="viewRecordsModal">
            <h3>Payment History</h3>
            <table id="recordsTable">
                <tr>
                    <th>Date</th>
                    <th>Amount Paid</th>
                </tr>
            </table>
            <button onclick="closeRecordsModal()">Close</button>
        </div>

        <script>
            function openForm(roll_no, name, father_name, course, duration, admission_date, submitted_fees, pending_dues, pic) {
                document.getElementById("student_pic").src = pic;

                // Fill visible text
                document.getElementById("roll_no_text").innerText = roll_no;
                document.getElementById("student_name_text").innerText = name;
                document.getElementById("father_name_text").innerText = father_name;
                document.getElementById("course_text").innerText = course;
                document.getElementById("duration_text").innerText = duration;
                document.getElementById("admission_date_text").innerText = admission_date;
                document.getElementById("submitted_fees_text").innerText = submitted_fees;
                document.getElementById("pending_dues_text").innerText = pending_dues;

                // Fill hidden input fields
                document.getElementById("roll_no").value = roll_no;
                document.getElementById("student_name").value = name;
                document.getElementById("father_name").value = father_name;
                document.getElementById("course").value = course;
                document.getElementById("duration").value = duration;
                document.getElementById("admission_date").value = admission_date;
                document.getElementById("submitted_fees").value = submitted_fees;
                document.getElementById("pending_dues").value = pending_dues;

                document.getElementById("paymentForm").style.display = "block";
            }


            function closeForm() {
                document.getElementById("paymentForm").style.display = "none";
            }

            document.getElementById("payFeesForm").addEventListener("submit", function(event) {
                event.preventDefault();
                var formData = new FormData(this);
                fetch("process_payment.php", {
                    method: "POST",
                    body: formData
                }).then(response => response.json()).then(data => {
                    alert(data.message);
                    location.reload();
                });
            });

            function viewRecords(roll_no) {
                fetch("view_records.php?roll_no=" + roll_no)
                    .then(response => response.json())
                    .then(data => {
                        let table = document.getElementById("recordsTable");
                        table.innerHTML = "<tr><th>Date</th><th>Amount Paid</th></tr>";
                        data.forEach(record => {
                            let row = `<tr><td>${record.payment_date}</td><td>${record.amount_paid}</td></tr>`;
                            table.innerHTML += row;
                        });
                        document.getElementById("viewRecordsModal").style.display = "block";
                    });
            }

            function closeRecordsModal() {
                document.getElementById("viewRecordsModal").style.display = "none";
            }
        </script>
        </body>

</html>

<?php $conn->close(); ?>