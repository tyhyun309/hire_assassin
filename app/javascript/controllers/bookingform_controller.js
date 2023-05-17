import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bookingform"
export default class extends Controller {
  static targets = [ "hideable" ]

  connect() {
    console.log("The 'bookingform' controller is now loaded!")
  }
  showTargets() {
    this.hideableTarget.hidden = false;
    window.scrollTo(100, 1000)
    };

}
