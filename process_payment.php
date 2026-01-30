<?php
include 'db_connection.php'; // Include database connection

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $roll_no = $_POST['roll_no'];
    $fees_paid_now = floatval($_POST['fees_paid_now']);

    // Fetch student details
    $query = "SELECT name, submitted_fees, RemainingFees FROM student_info WHERE roll_no = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("s", $roll_no);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $student_name = $row['name'];
        $submitted_fees = floatval($row['submitted_fees']);
        $remaining_fees = floatval($row['RemainingFees']);

        // Calculate new fee values
        $new_submitted_fees = $submitted_fees + $fees_paid_now;
        $new_remaining_fees = max(0, $remaining_fees - $fees_paid_now);

        // Update the student_info table
        $update_query = "UPDATE student_info SET submitted_fees = ?, RemainingFees = ? WHERE roll_no = ?";
        $update_stmt = $conn->prepare($update_query);
        $update_stmt->bind_param("dds", $new_submitted_fees, $new_remaining_fees, $roll_no);

        if ($update_stmt->execute()) {
            // Insert record into fee_payments table
            $insert_query = "INSERT INTO fee_payments (roll_no, student_name, amount_paid) VALUES (?, ?, ?)";
            $insert_stmt = $conn->prepare($insert_query);
            $insert_stmt->bind_param("ssd", $roll_no, $student_name, $fees_paid_now);
            $insert_stmt->execute();

            echo json_encode(["status" => "success", "message" => "Payment recorded successfully."]);
        } else {
            echo json_encode(["status" => "error", "message" => "Failed to update payment."]);
        }
    } else {
        echo json_encode(["status" => "error", "message" => "Student not found."]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Invalid request method."]);
}
