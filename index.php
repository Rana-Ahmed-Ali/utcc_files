<?php
// --- CONFIGURATION ---
$maintenance_mode = false; // Set to true to ENABLE, false to DISABLE
$maintenance_file = 'maintenance.html';
// $admin_ip = '223.123.77.150'; // Your specific IP address

// --- LOGIC ---
if ($maintenance_mode === true) {
    
    // Get the visitor's IP address
    $user_ip = $_SERVER['REMOTE_ADDR'];

    // If the visitor is NOT you (the admin), show the maintenance page
    if ($user_ip !== $admin_ip) {
        
        if (file_exists($maintenance_file)) {
            include($maintenance_file);
            exit(); // Stop the script here for normal users
        } else {
            echo "Maintenance mode is on, but maintenance.html is missing!";
            exit();
        }
    }
    
    // If the visitor IS you ($user_ip == $admin_ip), 
    // the code ignores the block above and continues loading the site below.
}

// ... The rest of your index.php code continues below ...
?>






<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="temp.1.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@300;400;500;600;700&family=Vibes&display=swap" rel="stylesheet">

<!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" /> -->

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>
<body>
    <?php include 'header.php'; ?>
    <div id="main-content">
        <!-- <h2>Filter Student Records</h2> -->
        <input type="text" id="searchInput" placeholder="Name, Roll No or Phone No" onkeyup="searchTable()" class="search-input">
        <table id="filter-table">
            <thead>
            <tr>
            <th>Roll No</th>
            <th>Picture</th>
            <th>Name</th>
            <th>Father Name</th>
            <th>Phone No</th>
            <th data-filter="course">Course</th>
            <th>Admission Date</th>
            <th data-filter="class_time">Class Time</th>
            <th data-filter="fee_status">Fee Status</th>
            <th data-filter="status">Status</th>
            <th>Action</th>
        </tr>
            </thead>
            <tbody>
                <?php
                include 'db_connection.php';

            //     $sql = "SELECT 
            //     si.*, 
            //     c.name AS course_name, 
            //     cd.duration_length AS course_duration, 
            //     ct.time_slot, 
            //     s.status_name, 
            //     bg.type AS blood_group, 
            //     q.name AS qualification
            // FROM 
            //     student_info AS si
            // LEFT JOIN 
            //     courses AS c ON si.course_id = c.id
            // LEFT JOIN 
            //     course_durations AS cd ON si.course_duration_id = cd.id
            // LEFT JOIN 
            //     class_times AS ct ON si.class_time_id = ct.id
            // LEFT JOIN 
            //     status AS s ON si.status_id = s.status_id
            // LEFT JOIN 
            //     blood_groups AS bg ON si.blood_group_id = bg.id
            // LEFT JOIN 
            //     qualifications AS q ON si.qualification_id = q.id";
    

$sql = "SELECT 
    si.*, 
    c.name AS course_name, 
    cd.duration_length AS course_duration, 
    ct.time_slot, 
    s.status_name, 
    bg.type AS blood_group, 
    q.name AS qualification
FROM 
    student_info AS si
LEFT JOIN 
    courses AS c ON si.course_id = c.id
LEFT JOIN 
    course_durations AS cd ON si.course_duration_id = cd.id
LEFT JOIN 
    class_times AS ct ON si.class_time_id = ct.id
LEFT JOIN 
    status AS s ON si.status_id = s.status_id
LEFT JOIN 
    blood_groups AS bg ON si.blood_group_id = bg.id
LEFT JOIN 
    qualifications AS q ON si.qualification_id = q.id
ORDER BY 
    CAST(SUBSTRING_INDEX(si.roll_no, '/', 1) AS UNSIGNED),
    CAST(SUBSTRING_INDEX(si.roll_no, '/', -1) AS UNSIGNED)";



                $result = mysqli_query($conn, $sql) or die("Query Unsuccessful.");

                // if (mysqli_num_rows($result) > 0) {
                //     while ($row = mysqli_fetch_assoc($result)) {
                //         $feeStatus = ($row['RemainingFees'] == 0) ? 'PAID' : 'DUE';
                
                if (mysqli_num_rows($result) > 0) {
                     $all_rows = array();
                        while ($row = mysqli_fetch_assoc($result)) {
                        $all_rows[] = $row;
                }
                    $all_rows = array_reverse($all_rows); // Reverse the order here

                     foreach ($all_rows as $row) {
                          $feeStatus = ($row['RemainingFees'] == 0) ? 'PAID' : 'DUE';

                ?>
                        <tr class="tr-main">
                            <td class="td-m1"><?php echo $row['roll_no']; ?></td>
                            <td class="popup-trigger td-m1">
                                <?php if ($row['pic']) { ?>
                                    <img src="<?php echo $row['pic']; ?>" alt="Student Picture" class="td-img" width=60 height=60>
                                <?php } else { ?>
                                    No Picture
                                <?php } ?>
                            </td>
                            <td class="td-m1"><?php echo $row['name']; ?></td>
                            <td class="td-m1"><?php echo $row['father_name']; ?></td>
                            <td class="td-m1"><?php echo $row['phone_personal']; ?></td>
                            <td class="td-m1" data-filter="course"><?php echo $row['course_name']; ?></td>
                            <td class="td-m1"><?php echo $row['admission_date']; ?></td>
                            <td class="td-m1" data-filter="class_time"><?php echo $row['time_slot']; ?></td>
                            <td class="td-m1" data-filter="fee_status">
                                <?php if ($feeStatus == 'DUE') { ?>
                                    <a href="#" class="show-popup" style="font-size:17px; color:red;" data-remaining-fees="<?php echo $row['RemainingFees']; ?>"><?php echo $feeStatus; ?></a>
                                <?php } else { ?>
                                    <?php echo $feeStatus; ?>
                                <?php } ?>
                            </td>
                            <td class="td-m1" data-filter="status"><?php echo $row['status_name']; ?></td>
                            <td class="td-m1">
                                <button class="view-details submit"
                                    data-id="<?php echo $row['id']; ?>"
                                    data-roll-no="<?php echo $row['roll_no']; ?>"
                                    data-name="<?php echo $row['name']; ?>"
                                    data-father-name="<?php echo $row['father_name']; ?>"
                                    data-phone-personal="<?php echo $row['phone_personal']; ?>"
                                    data-course-name="<?php echo $row['course_name']; ?>"
                                    data-course-duration="<?php echo $row['course_duration']; ?>"
                                    data-admission-date="<?php echo $row['admission_date']; ?>"
                                    data-time-slot="<?php echo $row['time_slot']; ?>"
                                    data-status-name="<?php echo $row['status_name']; ?>"
                                    data-pic="<?php echo $row['pic']; ?>"
                                    data-gender="<?php echo $row['gender']; ?>"
                                    data-phone-home="<?php echo $row['phone_home']; ?>"
                                    data-phone-relatives="<?php echo $row['phone_relatives']; ?>"
                                    data-address="<?php echo $row['address']; ?>"
                                    data-email="<?php echo $row['email']; ?>"
                                    data-date-of-birth="<?php echo $row['date_of_birth']; ?>"
                                    data-blood-group="<?php echo $row['blood_group']; ?>"
                                    data-qualification="<?php echo $row['qualification']; ?>"
                                    data-submitted-fees="<?php echo $row['submitted_fees']; ?>"
                                    data-discounted-fees="<?php echo $row['discounted_fees']; ?>"
                                    data-remaining-fees="<?php echo $row['RemainingFees']; ?>">
                                    <!-- <span class="material-symbols-outlined">visibility</span> -->
                                    <i class="fa-solid fa-eye"></i>
                                </button>
                                <a  href='edit.php?id=<?php echo $row['roll_no']; ?>' class="edit-btn"><i class="fa-solid fa-pen-to-square"></i></a>
                            </td>
                        </tr>
                <?php
                    }
                } else {
                    echo "<tr><td colspan='12'><h2>No Student Records Found</h2></td></tr>";
                }
                mysqli_close($conn);
                ?>
            </tbody>
        </table>
    </div>

    <div class="popup-overlay"></div>
<div class="popup">
    <div class="popup-header">
        <h2>Student Details</h2>
        <a href="#" class="popup-close"><span class="material-symbols-outlined">close</span></a>
    </div>
    <div class="popup-content">
        <div class="popup-main">
            <div class="popup-image-container">
                <img class="popup-image" src="" alt="Student Picture">
            </div>
            <div class="popup-details">
                <div class="popup-section">
                    <h3>Personal Information</h3>
                    <div class="popup-detail">
                        <span class="label">ID:</span>
                        <span class="value popup-id"></span>
                    </div>
                    <div class="popup-detail">
                        <span class="label">Name:</span>
                        <span class="value popup-name"></span>
                    </div>
                    <div class="popup-detail">
                        <span class="label">Father Name:</span>
                        <span class="value popup-father-name"></span>
                    </div>
                    <div class="popup-detail">
                        <span class="label">Gender:</span>
                        <span class="value popup-gender"></span>
                    </div>
                    <div class="popup-detail">
                        <span class="label">DOB:</span>
                        <span class="value popup-date-of-birth"></span>
                    </div>
                    <div class="popup-detail">
                        <span class="label">Email:</span>
                        <span class="value popup-email"></span>
                    </div>
                    <div class="popup-detail">
                        <span class="label">Blood:</span>
                        <span class="value popup-blood-group"></span>
                    </div>
                    <div class="popup-detail">
                        <span class="label">Qualification:</span>
                        <span class="value popup-qualification"></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="popup-section">
            <h3>Contact Information</h3>
            <div class="popup-detail">
                <span class="label">Phone (P):</span>
                <span class="value popup-phone-personal"></span>
            </div>
            <div class="popup-detail">
                <span class="label">Phone (H):</span>
                <span class="value popup-phone-home"></span>
            </div>
            <div class="popup-detail">
                <span class="label">Phone (R):</span>
                <span class="value popup-phone-relatives"></span>
            </div>
            <div class="popup-detail">
                <span class="label">Address:</span>
                <span class="value popup-address"></span>
            </div>
        </div>
        <div class="popup-section">
            <h3>Academic Information</h3>
            <div class="popup-detail">
                <span class="label">Roll No:</span>
                <span class="value popup-roll-no"></span>
            </div>
            <div class="popup-detail">
                <span class="label">Course:</span>
                <span class="value popup-course-name"></span>
            </div>
            <div class="popup-detail">
                <span class="label">Time:</span>
                <span class="value popup-time-slot"></span>
            </div>
            <div class="popup-detail">
                <span class="label">Duration:</span>
                <span class="value popup-course-duration"></span>
            </div>
            <div class="popup-detail">
                <span class="label">Admission:</span>
                <span class="value popup-admission-date"></span>
            </div>
            <div class="popup-detail">
                <span class="label">Status:</span>
                <span class="value popup-status-name"></span>
            </div>
        </div>
        <div class="popup-section">
            <h3>Fee Information</h3>
            <div class="popup-detail">
                <span class="label">Submit Fee:</span>
                <span class="value popup-submitted-fees"></span>
            </div>
            <div class="popup-detail">
                <span class="label">Discount:</span>
                <span class="value popup-discounted-fees"></span>
            </div>
            <div class="popup-detail">
                <span class="label">Due:</span>
                <span class="value popup-remaining-fees"></span>
            </div>
        </div>
    </div>
</div>


    <script>
function searchTable() {
    var input, filter, table, tr, tdName, tdRollNo, tdPhone, i, txtValueName, txtValueRollNo, txtValuePhone;
    input = document.getElementById("searchInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("filter-table");
    tr = table.getElementsByTagName("tr");

    for (i = 1; i < tr.length; i++) {
        tdRollNo = tr[i].getElementsByTagName("td")[0];
        tdName = tr[i].getElementsByTagName("td")[2];
        tdPhone = tr[i].getElementsByTagName("td")[4];
        if (tdRollNo || tdName || tdPhone) {
            txtValueRollNo = tdRollNo.textContent || tdRollNo.innerText;
            txtValueName = tdName.textContent || tdName.innerText;
            txtValuePhone = tdPhone.textContent || tdPhone.innerText;
            if (txtValueRollNo.toUpperCase().indexOf(filter) > -1 || txtValueName.toUpperCase().indexOf(filter) > -1 || txtValuePhone.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}

document.addEventListener('DOMContentLoaded', function () {
        const filterTable = document.getElementById('filter-table');
        const filterHeaderRow = filterTable.querySelector('thead tr');

        const filters = {
            course: '',
            class_time: '',
            fee_status: '',
            status: ''
        };

        createFilterDropdown(filterHeaderRow.querySelector('th[data-filter="course"]'));
        createFilterDropdown(filterHeaderRow.querySelector('th[data-filter="class_time"]'));
        createFilterDropdown(filterHeaderRow.querySelector('th[data-filter="fee_status"]'));
        createFilterDropdown(filterHeaderRow.querySelector('th[data-filter="status"]'));

        function createFilterDropdown(headerCell) {
            const filterType = headerCell.dataset.filter;
            const filterValues = Array.from(new Set(filterTable.querySelectorAll(`td[data-filter="${filterType}"]`)))
                .map(cell => cell.textContent)
                .filter(Boolean);

            const uniqueFilterValues = [...new Set(filterValues)];

            const dropdown = document.createElement('select');
            dropdown.innerHTML = `<option value="">All ${filterType.replace('_', ' ')}</option>`;
            uniqueFilterValues.forEach(value => {
                const option = document.createElement('option');
                option.value = value;
                option.textContent = value;
                dropdown.appendChild(option);
            });

            dropdown.addEventListener('change', function () {
                filters[filterType] = dropdown.value;
                applyFilters();
            });

            headerCell.innerHTML = '';
            headerCell.appendChild(dropdown);
        }

        function applyFilters() {
            const filterRows = filterTable.querySelectorAll('tbody tr');

            filterRows.forEach(function (row) {
                const course = row.querySelector('td[data-filter="course"]').textContent;
                const classTime = row.querySelector('td[data-filter="class_time"]').textContent;
                const feeStatus = row.querySelector('td[data-filter="fee_status"]').textContent;
                const status = row.querySelector('td[data-filter="status"]').textContent;

                const matchesFilter =
                    (filters.course === '' || filters.course === course) &&
                    (filters.class_time === '' || filters.class_time === classTime) &&
                    (filters.fee_status === '' || filters.fee_status === feeStatus) &&
                    (filters.status === '' || filters.status === status);

                if (matchesFilter) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        }


            document.querySelectorAll('.view-details').forEach(button => {
                button.addEventListener('click', function () {
                    const popup = document.querySelector('.popup');
                    const overlay = document.querySelector('.popup-overlay');
                    popup.querySelector('.popup-id').textContent = button.getAttribute('data-id');
                    popup.querySelector('.popup-roll-no').textContent = button.getAttribute('data-roll-no');
                    popup.querySelector('.popup-name').textContent = button.getAttribute('data-name');
                    popup.querySelector('.popup-father-name').textContent = button.getAttribute('data-father-name');
                    popup.querySelector('.popup-phone-personal').textContent = button.getAttribute('data-phone-personal');
                    popup.querySelector('.popup-course-name').textContent = button.getAttribute('data-course-name');
                    popup.querySelector('.popup-course-duration').textContent = button.getAttribute('data-course-duration');
                    popup.querySelector('.popup-admission-date').textContent = button.getAttribute('data-admission-date');
                    popup.querySelector('.popup-time-slot').textContent = button.getAttribute('data-time-slot');
                    popup.querySelector('.popup-status-name').textContent = button.getAttribute('data-status-name');
                    popup.querySelector('.popup-image').src = button.getAttribute('data-pic');
                    popup.querySelector('.popup-gender').textContent = button.getAttribute('data-gender');
                    popup.querySelector('.popup-phone-home').textContent = button.getAttribute('data-phone-home');
                    popup.querySelector('.popup-phone-relatives').textContent = button.getAttribute('data-phone-relatives');
                    popup.querySelector('.popup-address').textContent = button.getAttribute('data-address');
                    popup.querySelector('.popup-email').textContent = button.getAttribute('data-email');
                    popup.querySelector('.popup-date-of-birth').textContent = button.getAttribute('data-date-of-birth');
                    popup.querySelector('.popup-blood-group').textContent = button.getAttribute('data-blood-group');
                    popup.querySelector('.popup-qualification').textContent = button.getAttribute('data-qualification');
                    popup.querySelector('.popup-submitted-fees').textContent = button.getAttribute('data-submitted-fees');
                    popup.querySelector('.popup-discounted-fees').textContent = button.getAttribute('data-discounted-fees');
                    popup.querySelector('.popup-remaining-fees').textContent = button.getAttribute('data-remaining-fees');
                    
                    overlay.style.display = 'block';
                    popup.style.display = 'block';
                });
            });

            document.querySelector('.popup-close').addEventListener('click', function () {
                document.querySelector('.popup-overlay').style.display = 'none';
                document.querySelector('.popup').style.display = 'none';
            });
            const showPopupLinks = document.querySelectorAll('.show-popup');
            showPopupLinks.forEach(link => {
            link.addEventListener('click', function (event) {
            event.preventDefault();
            const remainingFees = this.dataset.remainingFees;
            alert(`Remaining Fees: ${remainingFees}`);
            // You can customize the alert with a modal or any other UI element for better user experience
        });
    });
        });
    </script>

</body>
</html>