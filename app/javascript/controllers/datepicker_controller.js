import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["start", "end", "list", "locationList"];

  connect() {
    this.initStartDatePicker();
    this.initEndDatePicker();
  }

  initStartDatePicker() {
    flatpickr(this.startTarget, {
      enableTime: true,           // Enable time picker
      dateFormat: "Y-m-d H:i",    // Date and time format
      disableMobile: "true",
      onChange: this.setEndDate.bind(this), // Set end date based on start date
    })
  }

  initEndDatePicker() {
    flatpickr(this.endTarget, {
      enableTime: true,           // Enable time picker
      dateFormat: "Y-m-d H:i",    // Date and time format
      disableMobile: "true",
    });
  }

  setEndDate(selectedDates) {
    if (selectedDates.length > 0) {
      const selectedDate = selectedDates[0];
      selectedDate.setMinutes(selectedDate.getMinutes() + 60); // Add 60 minutes
      this.endTarget._flatpickr.setDate(selectedDate);
    }
  }

  fetchStudios() {
    const url = `${location.href}?start_time=${this.startTarget.value}&end_time=${this.endTarget.value}`
    fetch(url)
      .then(response=>response.text())
      .then(data => {
        // console.log(data)
        this.listTarget.innerHTML = data
        const studioNames = this.listTarget.querySelectorAll(".studio-name")
        studioNames.forEach(studio=>{
          const name = studio.innerText
          this.locationListTarget.insertAdjacentHTML("beforeend", `<option value="${name}">${name}</option>`)
        })
        const studioCards = this.listTarget.querySelectorAll(".studio-card")
        studioCards.forEach(card=>{
          card.addEventListener("click", (event) => {
            const name = event.currentTarget.querySelector(".studio-name").innerText
            this.locationListTarget.value = name
            this.locationListTarget.name = "location_name"
          })
        })
      })
  }
}
