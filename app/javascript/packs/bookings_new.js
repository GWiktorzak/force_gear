const bookingPrice = document.getElementById("price-per-day");
const pricePerDay = parseInt(bookingPrice.innerHTML, 10);
const bookingTotal = document.getElementById("total-price");
const currentStartDate = document.querySelector("#booking_booking_start_date");
const currentEndDate = document.querySelector("#booking_booking_end_date");

const calculatePrice = (currentStartDate, currentEndDate) => {
  const startDate = new Date(currentStartDate.value);
  const endDate = new Date(currentEndDate.value);
  const numberOfDays = (endDate - startDate) / 86400000 + 1;
  return pricePerDay * numberOfDays;
};

currentStartDate.addEventListener("change", (_event) => {
  const total = calculatePrice(currentStartDate, currentEndDate);
  if (isNaN(total) === false) {
    if (total > 0) {
      bookingTotal.innerHTML = `Total: £${total}`;
    } else {
      bookingTotal.innerHTML = "Total: £0";
    }
  }
});

currentEndDate.addEventListener("change", (_event) => {
  const total = calculatePrice(currentStartDate, currentEndDate);
  if (isNaN(total) === false) {
    if (total > 0) {
      bookingTotal.innerHTML = `Total: £${total}`;
    } else {
      bookingTotal.innerHTML = "Total: £0";
    }
  }
});
