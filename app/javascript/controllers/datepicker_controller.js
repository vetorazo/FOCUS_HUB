import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      dateFormat: "Y-m-d",
      mode: "range",
      disable: [
          {
              from: "2025-08-07",
              to: "2025-08-09"
          },
          {
              from: "2025-09-01",
              to: "2025-12-01"
          }
      ]
    })
  }
}


// # Make the date picker into a range mode
// # have to seperate the data in post request into start_date and end_date to save into the database
// # Disable with range: Get all booking from today onwards for that listing, create an array of hashes
// # [
// #         {
// #             from: "2025-04-01",
// #             to: "2025-05-01"
// #         },
// #         {
// #             from: "2025-09-01",
// #             to: "2025-12-01"
// #         }
// #     ] => to json

// # add it to stimulus data-value

// # datepicker_controller: declare the value as an array -> give this array to the disable key (see documentation)
