<?php
// session_start();
// if (!isset($_SESSION["authenticated"]) || !$_SESSION["authenticated"]) {
//     // Redirect to the login page
//     header("Location: login.php");
//     exit();
// }
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Students</title>
    <link rel="stylesheet" href="style1.css">
    <style>
        /* Add this style for the current date and time */
        #currentDateTime {
            position: absolute;
            top: 25px;
            right: 10px;
            font-size: 14px;
        }

        #header {
            display: flex;
            align-items: center;
            /* justify-content: space-between; */
            padding: 10px;
            position: relative;
        }

        #logo {
            height: 70px;
            /* Adjust size as needed */
            margin-right: 15px;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
    <div id="bdy">

        <div id="wrapper">
            <div id="header">
                <img src="images/UTCC.png" alt="UTCC Logo" id="logo">
                <h1>UTCC</h1>
                <!-- Add this to your authenticated pages -->
                <div id="currentDateTime">
                    <?php
                    // Set the default time zone to Pakistan Standard Time
                    date_default_timezone_set('Asia/Karachi');

                    // Get current date and time with seconds
                    $currentDateTime = date("l, F j, Y - h:i:s A");
                    echo $currentDateTime;
                    ?>
                </div>
            </div>
            <div id="menu">
                <ul>
                    <li>
                        <a href="index.php">Home</a>
                    </li>
                    <li>
                        <a href="add.php">Add</a>
                    </li>
                    <li>
                        <a href="fees.php">Fees</a>
                    </li>
                    <!--<li>-->
                    <!--    <a href="update.php">Update</a>-->
                    <!--</li>-->
                    <li>
                        <a href="delete.php">Delete</a>
                    </li>
                    <li>
                        <a href="courses.php">Courses</a>
                    </li>
                    <li>
                        <a href="times.php">Slots</a>
                    </li>
                    <li>
                        <a href="logout.php" class="logout-btn">Logout</a>
                    </li>
                    <li>
                        <a href="export_database.php">
                            <i class="fa-solid fa-screwdriver-wrench"></i>
                        </a>
                    </li>
                    <li>
                        <a href="exp_records.php">
                            <i class="fa-solid fa-money-check-dollar"></i>
                        </a>
                    </li>
                </ul>
            </div>

        </div>
    </div>

    <script>
        // Update current date and time every second
        setInterval(function() {
            var currentDateTimeElement = document.getElementById('currentDateTime');
            var currentDate = new Date();
            var dateString = currentDate.toLocaleString('en-US', {
                weekday: 'long',
                month: 'long',
                day: 'numeric',
                year: 'numeric',
                hour: 'numeric',
                minute: 'numeric',
                second: 'numeric',
                hour12: true
            });
            currentDateTimeElement.innerText = dateString;
        }, 1000); // 1000 milliseconds = 1 second
    </script>
</body>

</html>