<?php
include 'header.php';
include "db_connection.php";

if (isset($_POST['confirmDelete'])) {
    $stu_roll_no = $_POST['roll_no'];

    // Delete query
    $sql = "DELETE FROM student_info WHERE roll_no = '$stu_roll_no'";
    $result = mysqli_query($conn, $sql) or die("Query Unsuccessful.");

    if (mysqli_affected_rows($conn) > 0) {
        header("Location:index.php");
        exit();
    } else {
        echo "<div id='main-content'><h2>Student Not Found</h2></div>";
    }

    mysqli_close($conn);
}
?>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<div id="main-content">
    <h2>Delete Record</h2>
    <form class="post-form" id="deleteForm" method="post">
        <div class="form-group">
            <label>Roll No</label>
            <input type="text" id="roll_no" name="roll_no" required />
        </div>
        <input class="submit" type="button" id="fetchStudentBtn" value="Delete" />
    </form>
</div>

<!-- Confirmation Modal -->
<div id="deleteModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>Confirm Deletion</h2>
        <div id="studentDetails">
            <img id="studentPic" src="" class="img-thumbnail mb-3" width="120">
            <p><strong>Roll No:</strong> <span id="studentRollNo"></span></p>
            <p><strong>Name:</strong> <span id="studentName"></span></p>
            <p><strong>Father's Name:</strong> <span id="studentFather"></span></p>
            <p><strong>Pending Fees:</strong> <span id="pendingFees" class="text-danger font-weight-bold"></span></p>
        </div>
        <form method="post">
            <input type="hidden" name="roll_no" id="hiddenRollNo">
            <button type="submit" name="confirmDelete" class="btn btn-danger">Delete</button>
            <button type="button" class="btn btn-secondary closeModal">Cancel</button>
        </form>
    </div>
</div>

<!-- CSS for Modal -->
<style>
    .modal {
        display: none;
        position: fixed;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.5);
    }

    .modal-content {
        background: fff;
        padding: 20px;
        width: 40%;
        margin: 15% auto;
        text-align: center;
        border-radius: 8px;
    }

    .close {
        float: right;
        font-size: 24px;
        cursor: pointer;
    }
</style>

<!-- JavaScript -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        $("#fetchStudentBtn").click(function() {
            var roll_no = $("#roll_no").val().trim();
            if (roll_no === "") {
                alert("Please enter a Roll No.");
                return;
            }

            $.ajax({
                type: "POST",
                url: "fetch_student.php",
                data: {
                    roll_no: roll_no
                },
                dataType: "json",
                success: function(response) {
                    if (response.error) {
                        alert(response.error);
                    } else {
                        $("#studentPic").attr("src", response.pic);
                        $("#studentRollNo").text(response.roll_no);
                        $("#studentName").text(response.name);
                        $("#studentFather").text(response.father_name);
                        $("#pendingFees").text("Rs. " + response.RemainingFees);

                        $("#hiddenRollNo").val(response.roll_no);
                        $("#deleteModal").fadeIn();
                    }
                }
            });
        });

        $(".close, .closeModal").click(function() {
            $("#deleteModal").fadeOut();
        });
    });
</script>