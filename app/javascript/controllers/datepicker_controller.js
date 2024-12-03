import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["start", "end"];

  connect() {
    this.initStartDatePicker();
    this.initEndDatePicker();
  }

  initStartDatePicker() {
    flatpickr(this.startTarget, {
      enableTime: true,           // Enable time picker
      dateFormat: "Y-m-d H:i",    // Date and time format
 
      onChange: this.setEndDate.bind(this), // Set end date based on start date
    })
  }

  initEndDatePicker() {
    flatpickr(this.endTarget, {
      enableTime: true,           // Enable time picker
      dateFormat: "Y-m-d H:i",    // Date and time format

    });
  }

  setEndDate(selectedDates) {
    if (selectedDates.length > 0) {
      const selectedDate = selectedDates[0];
      selectedDate.setMinutes(selectedDate.getMinutes() + 90); // Add 90 minutes
      this.endTarget._flatpickr.setDate(selectedDate);
    }
  }
}
