// scripts.js
document.addEventListener('DOMContentLoaded', function() {
    const table = document.getElementById('filter-table');
    const searchInput = document.getElementById('searchInput');
    const rows = table.querySelectorAll('tbody tr');
    const popupOverlay = document.querySelector('.popup-overlay');
    const popup = document.querySelector('.popup');
    const popupClose = document.querySelector('.popup-close');
    const popupRemainingFees = document.querySelector('.popup-remaining-fees');
    const popupRemainingFeesClose = document.querySelector('.popup-remaining-fees-close');
    const remainingFeesAmount = document.querySelector('.remaining-fees-amount');
    const popupFields = {
        id: document.querySelector('.popup-id'),
        rollNo: document.querySelector('.popup-roll-no'),
        name: document.querySelector('.popup-name'),
        fatherName: document.querySelector('.popup-father-name'),
        gender: document.querySelector('.popup-gender'),
        dateOfBirth: document.querySelector('.popup-date-of-birth'),
        email: document.querySelector('.popup-email'),
        bloodGroup: document.querySelector('.popup-blood-group'),
        qualification: document.querySelector('.popup-qualification'),
        phonePersonal: document.querySelector('.popup-phone-personal'),
        phoneHome: document.querySelector('.popup-phone-home'),
        phoneRelatives: document.querySelector('.popup-phone-relatives'),
        address: document.querySelector('.popup-address'),
        courseName: document.querySelector('.popup-course-name'),
        timeSlot: document.querySelector('.popup-time-slot'),
        courseDuration: document.querySelector('.popup-course-duration'),
        admissionDate: document.querySelector('.popup-admission-date'),
        statusName: document.querySelector('.popup-status-name'),
        submittedFees: document.querySelector('.popup-submitted-fees'),
        discountedFees: document.querySelector('.popup-discounted-fees'),
        remainingFees: document.querySelector('.popup-remaining-fees'),
    };
    
    function searchTable() {
        const filter = searchInput.value.toLowerCase();
        rows.forEach(row => {
            const cells = row.querySelectorAll('td');
            const match = [...cells].some(cell => cell.textContent.toLowerCase().includes(filter));
            row.style.display = match ? '' : 'none';
        });
    }

    searchInput.addEventListener('keyup', searchTable);

    function closePopup() {
        popup.style.display = 'none';
        popupOverlay.style.display = 'none';
    }

    function closeRemainingFeesPopup() {
        popupRemainingFees.style.display = 'none';
        popupOverlay.style.display = 'none';
    }

    popupClose.addEventListener('click', closePopup);
    popupRemainingFeesClose.addEventListener('click', closeRemainingFeesPopup);
    
    document.querySelectorAll('.show-popup').forEach(link => {
        link.addEventListener('click', function(event) {
            event.preventDefault();
            const remainingFees = this.getAttribute('data-remaining-fees');
            remainingFeesAmount.textContent = `Remaining Fees: ${remainingFees}`;
            popupRemainingFees.style.display = 'block';
            popupOverlay.style.display = 'block';
        });
    });

    document.querySelectorAll('.view-details').forEach(button => {
        button.addEventListener('click', function() {
            Object.keys(popupFields).forEach(key => {
                popupFields[key].textContent = this.getAttribute(`data-${key}`);
            });
            document.querySelector('.popup-image').src = this.getAttribute('data-pic');
            popup.style.display = 'block';
            popupOverlay.style.display = 'block';
        });
    });

    popupOverlay.addEventListener('click', function() {
        closePopup();
        closeRemainingFeesPopup();
    });
});
