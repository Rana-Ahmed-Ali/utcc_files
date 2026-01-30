<?php
session_start();

include 'db_connection.php';


// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $user = $_POST['username'];
    $pass = $_POST['password'];

    // SQL query to check if the user exists
    $sql = "SELECT * FROM users WHERE username='$user' AND password=MD5('$pass')";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // User authenticated
        $_SESSION['username'] = $user;
        header("Location: index.php"); // redirect to a welcome page
    } else {
        // Authentication failed
        echo "<p class='error-message'>Invalid username or password</p>";
    }
}

$conn->close();
?>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="login.css">
</head>
<body>
    <div class="container">
    <form method="post" action="login.php">
        <div class="">
            <img src="images/UTCC.png" alt="" class="logo">
        </div>
        <div class="input-group">
            <label>Username:</label>
            <input type="text" name="username" required>
        </div>
        <div class="input-group">
            <label>Password:</label>
            <input type="password" name="password" required>
        </div>
        <div>
            <button type="submit" class="submit-btn">Login</button>
        </div>
    </form>
    </div>

</body>
</html>
