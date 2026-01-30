<?php
session_start();
include 'db_connection.php';

if (isset($_SESSION["authenticated"]) && $_SESSION["authenticated"]) {
    header("Location: index.php");
    exit();
}

$error_message = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $password = $_POST["password"];

    // Validate username and password against your database
    if (isValidUser($username, $password)) {
        $_SESSION["authenticated"] = true;
        header("Location: index.php");
        exit();
    } else {
        $error_message = "Invalid username or password";
    }
}

function isValidUser($username, $password) {
    include 'db_connection.php';

    $username = mysqli_real_escape_string($conn, $username);

    // Retrieve hashed password from the database for the given username
    $query = "SELECT `Password` FROM `users` WHERE `Username`='$username'";
    $result = mysqli_query($conn, $query);

    if (!$result) {
        die("Query failed: " . mysqli_error($conn));
    }

    if (mysqli_num_rows($result) == 1) {
        $row = mysqli_fetch_assoc($result);
        $hashedPassword = $row['Password'];

        // Use password_verify to check if the entered password matches the hashed one
        if (password_verify($password, $hashedPassword)) {
            return true;
        }
    }

    return false;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="login.css">
</head>
<body>
    <div class="container">
        <!-- <img class="logo" src="img/PCC LOGO.png" alt="Logo">-->
        <!-- <img id="logo" class="logo" src="img/PCC LOGO.png" alt="Logo"> -->
        <h2>Login</h2>
        <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
            <div class="input-group">
                <label for="username">Username:</label>
                <input type="text" name="username" required autocomplete="off">
            </div>
            <div class="input-group">
                <label for="password">Password:</label>
                <input type="password" name="password" required autocomplete="off">
            </div>
            <input class="submit-btn" type="submit" value="Login">
        </form>
        <?php if (!empty($error_message)) echo '<div class="error-message">' . $error_message . '</div>'; ?>
    </div>

    <script>
    document.addEventListener('DOMContentLoaded', function () {
        var logo = document.getElementById('logo');

        // Add a click event listener to the login button
        document.querySelector('.submit-btn').addEventListener('click', function () {
            // Add the fullscreen-logo class to the logo
            logo.classList.add('fullscreen-logo');

            // Redirect to the login page after the animation (adjust the timeout as needed)
            setTimeout(function () {
                window.location.href = "index.php";
            },3000);
        });
    });
</script>


</body>
</html>
