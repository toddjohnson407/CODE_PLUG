import flatpickr from 'flatpickr';

const initDatePicker = function() {
  const startDateinput = document.getElementById("booking_start_date");
  const endDateinput = document.getElementById('booking_end_date');

  if (startDateinput && endDateinput) {
    flatpickr(startDateinput, {
    minDate: 'today',
    enableTime: true,
    dateFormat: 'd-m-Y h:i',
    onChange: function(_, selectedDate) {
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
        dateFormat: 'd-m-Y h:i',
      });
  }
};

export default initDatePicker;
initDatePicker();

