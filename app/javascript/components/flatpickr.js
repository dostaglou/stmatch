const initFlatpickr = () => {
  $("#booking_date").flatpickr({
    altInput: true,
    altFormat: "F j, Y - H:i",
    enableTime: true,
    dateFormat: "Y-m-d H:i"
  });
}

export { initFlatpickr };
