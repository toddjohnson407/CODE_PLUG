import flatpickr from 'flatpickr';

function updateBookingTotals(time) {
  const totalHours = document.getElementById("total-hours");
  const totalPrice = document.getElementById("total-price");
  const coursePrice = document.getElementById("course-price");
  var price = coursePrice.innerHTML;
  price = price.replace('€', '');
  const perHour = parseInt(price);
  totalHours.innerHTML = time;
  totalPrice.innerHTML = time * perHour;
}

const initDatePicker = function() {
  const startDateinput = document.getElementById("booking_start_date");
  const endDateinput = document.getElementById('booking_end_date');
  const bookingTotals = document.getElementById('booking-totals');
  const bookingHoursInput = document.getElementById('booking_hours')
  if (startDateinput && endDateinput) {
    let startTime, endTime, totalTime
    flatpickr(startDateinput, {
      minDate: 'today',
      enableTime: true,
      dateFormat: 'd-m-Y H:i',
      time_24hr: true,
      minuteIncrement: 60,
      onChange: function(_, selectedDate) {
        console.log(selectedDate)
        startTime = parseInt(selectedDate.split(" ")[1].split(":")[0])
        if (selectedDate === '') {
          return endDateinput.disabled = true;
        }
        endDateCalendar.set('minDate', selectedDate);
        endDateinput.disabled = false;
      }
    });

    const endDateCalendar =
    flatpickr(endDateinput, {
      enableTime: true,
      dateFormat: 'd-m-Y H:i',
      time_24hr: true,
      minuteIncrement: 60,
      onChange: function(_, selectedDate) {
        if (selectedDate === '') return ''
        endTime = parseInt(selectedDate.split(" ")[1].split(":")[0])
        totalTime = endTime - startTime
        bookingHoursInput.value = totalTime
        updateBookingTotals(totalTime)
        bookingTotals.style.display = 'block';
      }
    });
  }
};

export { initDatePicker };

