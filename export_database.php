<?php
// Set the timezone to your desired timezone
date_default_timezone_set('Asia/Karachi');
// MySQL database connection parameters
include 'db_connection.php';


// Check if the form is submitted to take a backup
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["backup"])) {
    // Create a connection to the MySQL database
    $connection = new mysqli($host, $username, $password, $database);

    // Check connection
    if ($connection->connect_error) {
        die("Connection failed: " . $connection->connect_error);
    }

    // Query to retrieve all tables in the database
    $tables_query = "SHOW TABLES";
    $tables_result = $connection->query($tables_query);

    // Initialize an empty SQL string to store the database dump
    $sql_dump = '';

    // Loop through each table
    while ($row = $tables_result->fetch_row()) {
        $table = $row[0];

        // Retrieve table structure
        $structure_query = "SHOW CREATE TABLE $table";
        $structure_result = $connection->query($structure_query);
        $structure_row = $structure_result->fetch_row();

        // Append table structure to SQL dump
        $sql_dump .= "\n-- Table structure for table `$table`\n\n";
        $sql_dump .= $structure_row[1] . ";\n\n";

        // Retrieve table data
        $data_query = "SELECT * FROM $table";
        $data_result = $connection->query($data_query);

        // Append table data to SQL dump
        if ($data_result->num_rows > 0) {
            $sql_dump .= "-- Dumping data for table `$table`\n\n";
            while ($data_row = $data_result->fetch_assoc()) {
                $sql_dump .= "INSERT INTO `$table` VALUES (";
                foreach ($data_row as $value) {
                    $sql_dump .= "'" . $connection->real_escape_string($value) . "', ";
                }
                $sql_dump = rtrim($sql_dump, ", ") . ");\n";
            }
            $sql_dump .= "\n";
        }
    }

    // Close connection
    $connection->close();

    // Specify the folder path where backups will be stored
    $backup_folder = 'backups/';

    // Create the folder if it doesn't exist
    if (!file_exists($backup_folder)) {
        mkdir($backup_folder, 0777, true);
    }

    // Generate the backup file name with the current date and time
    $backup_file = $backup_folder . 'backup_' . date("Y-m-d_h-i") . '.sql';

    // Save SQL dump to the backup file
    file_put_contents($backup_file, $sql_dump);

    // Redirect to the page to display all backups
    header("Location: {$_SERVER['PHP_SELF']}");
    exit();
}

// Check if the delete button is clicked and a backup file is selected for deletion
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["delete"]) && isset($_POST["file_to_delete"])) {
    $file_to_delete = $_POST["file_to_delete"];

    // Check if the file exists before attempting deletion
    if (file_exists($file_to_delete)) {
        unlink($file_to_delete); // Delete the file

        // Redirect to the page to display all backups after deletion
        header("Location: {$_SERVER['PHP_SELF']}");
        exit();
    }
}

// Check if there are any backup files available
$backup_files = glob("backups/backup_*.sql");
?>

<!DOCTYPE html>
<html lang="en">
<head>
        <?php include 'header.php'; ?>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Database Backup</title>
     <style>
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
    </style>
</head>
<body>
    <h1>Database Backup</h1>
    <!-- Form to take a backup -->
    <form method="post">
        <button class="backup-btn" type="submit" name="backup">Take Backup</button>
    </form>

    <!-- Table to display all backups -->
    <h2>Backups</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Backup File</th>
                <th>Date/Time</th>
                <th>Size</th> <!-- New column for file size -->
                <th>Action</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($backup_files as $backup_file) : ?>
                <tr>
                    <td><?php echo basename($backup_file); ?></td>
                    <td><?php echo date("l, F j, Y \a\\t h:i A", filemtime($backup_file)); ?></td>
                    <td><?php echo formatSizeUnits(filesize($backup_file)); ?></td> <!-- Display file size -->
                    <td><a href="<?php echo $backup_file; ?>" class="download-btn" download>Download</a></td>
                    <td>
                        <form method="post">
                            <input type="hidden" name="file_to_delete" value="<?php echo $backup_file; ?>">
                            <button class="delete-btn" type="submit" name="delete">Delete</button>
                        </form>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</body>
</html>

<?php
// Function to format file size
function formatSizeUnits($bytes) {
    $units = array('B', 'KB', 'MB', 'GB', 'TB');
    $i = 0;
    while ($bytes >= 1024 && $i < count($units) - 1) {
        $bytes /= 1024;
        $i++;
    }
    return round($bytes, 2) . ' ' . $units[$i];
}
?>

