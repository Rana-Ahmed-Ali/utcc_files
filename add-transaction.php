<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Transaction</title>
    <style>
        body {
            display: flex;
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .sidebar {
            width: 200px;
            background-color: #333;
            color: white;
            padding: 15px;
            height: 100vh;
            position: fixed;
        }
        .sidebar h2 {
            text-align: center;
        }
        .sidebar a {
            display: block;
            color: white;
            text-decoration: none;
            padding: 10px 0;
            text-align: center;
        }
        .sidebar a:hover {
            background-color: #575757;
        }
        .content {
            margin-left: 220px;
            padding: 20px;
            flex: 1;
        }
         /* Reset some default styles for cross-browser consistency */
         * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 20px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        /* Style the backup button */
        .backup-btn {
            font-size: 18px;
            padding: 10px 20px;
            /*background-color: #3498db;*/
            background-color: green;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-bottom: 20px;
        }

        .backup-btn:hover {
            background-color: #2980b9;
        }

        /* Style the backup table */
        table {
            width: 100%;
            border-collapse: collapse;
            /*background-color: #fff;*/
                        background-color: #444;

            border-radius: 5px;
            overflow: hidden;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            /*background-color: #3498db;*/
            background-color: #333;
            color: #fff;
            text-transform: uppercase;
        }

        td {
            background-color: #444;
        }

        /* Style the download button */
        .download-btn {
            font-size: 14px;
            padding: 8px 12px;
            background-color: #27ae60;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .download-btn:hover {
            background-color: #219a52;
        }

        /* Style the delete button */
        .delete-btn {
            font-size: 14px;
            padding: 8px 12px;
            background-color: #e74c3c;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .delete-btn:hover {
            background-color: #c0392b;
        }
        .submit {
  font-size: 16px;
  letter-spacing: 1px;
  text-transform: uppercase;
  padding: 10px 15px;
  color: #fff;
  background-color: #1abc9c;  
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background 0.3s, box-shadow 0.3s, transform 0.2s; /* Add a transition for button effects */
}
.form-group-exp{
  width: 30%;
  font-size: 16px;
  padding: 10px;
  margin: 5px 0;
  border: 1px solid #555; /* Slightly lighter border color */
  border-radius: 5px;
  background-color: #44; /* Darker input background */
  transition: border-color 0.3s, color 0.3s; /* Add transitions for border and color changes */
}
.form-group{
  width: 60%;
  font-size: 16px;
  padding: 15px;
  margin: 5px 0;
  border: 1px solid #555; /* Slightly lighter border color */
  border-radius: 5px;
  background-color: #44; /* Darker input background */
  transition: border-color 0.3s, color 0.3s; /* Add transitions for border and color changes */
}
.drop{
  font-size: 14px;
  padding: 8px;
  border: 1px solid #555;
  border-radius: 5px;
  background-color: #444;
  color: #fff;
}
.table1 td{
    background-color: #333;
}
.delete-btn{
    font-size: 14px;
    padding: 8px 12px;
    background-color: #e74c3c;
    color: #fff;
    border: none;
    border-radius: 3px;
    cursor: pointer;
    transition: background-color 0.3s;
}

    </style>
  <!-- <link rel="stylesheet" href="styles.css"> -->
  <link rel="stylesheet" href="style1.css">

</head>
<body>
    <div class="sidebar">
        <a href="index.php"><h2>Menu</h2></a>
        <a href="exp_records.php">Records</a>
        <a href="add-expense.php">Add Expense</a>
        <a href="add-transaction.php">Add Transaction</a>
    </div>
    <div class="content">
        <h1>Add Transaction</h1>
        <h2>ADD TRANSACTION</h2>

<form method="POST" action="">
    <table class="table1">
        <tr>
            <td><label for="expense_type">Expense Type:</label></td>
            <td>
                <select id="expense_type" name="expense_type" class="drop" required>
                    <option value="">Select an option</option>
                    <?php
                    include 'db_connection.php';

                    // Fetch distinct expense types from expense_types table
                    $sql = "SELECT expense_type FROM expense_types";
                    $result = $conn->query($sql);

                    if ($result->num_rows > 0) {
                        while ($row = $result->fetch_assoc()) {
                            echo '<option value="' . htmlspecialchars($row['expense_type']) . '">' . htmlspecialchars($row['expense_type']) . '</option>';
                        }
                    } else {
                        echo '<option value="">No expense types available</option>';
                    }

                    ?>
                </select>
            </td>
        </tr>
        <tr>
            <td><label for="expenses">Expenses:</label></td>
            <td><input type="number" id="expenses" class="form-group-exp" name="expenses" step="0.01" required></td>
        </tr>
        <tr>
            <td><label for="note">Note:</label></td>
            <td><textarea id="note" name="note" class="form-group" required></textarea></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center;">
                <button type="submit" class="submit" name="save">SAVE</button>
            </td>
        </tr>
    </table>
</form>
<?php
// Handle form submission for adding new transaction
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['save'])) {
    $expense_type = $_POST['expense_type'];
    $expenses = $_POST['expenses'];
    $note = $_POST['note'];
    $date = date('Y-m-d');

    $stmt = $conn->prepare("INSERT INTO expenses (expense_type, date, expenses, note) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("ssds", $expense_type, $date, $expenses, $note);

    if ($stmt->execute()) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
}
?>
    </div>
</body>
</html>
