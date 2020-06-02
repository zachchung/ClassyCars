import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

flatpickr("#booking_start_date", {
  minDate: "today",
  maxDate: new Date().fp_incr(60),
  altInput: true,
  plugins: [new rangePlugin({ input: "#booking_range_end"})]
});

