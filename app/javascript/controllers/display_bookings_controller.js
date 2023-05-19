import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-bookings"
export default class extends Controller {
    static targets = [ 'pending', 'active', 'completed' ]

  connect() {
    console.log("Display booking HI");
  }

  active() {
    console.log("CLICK Active");
    console.log(this.activeTarget);
    this.activeTarget.classList.remove("d-none");
    this.pendingTarget.classList.add("d-none");
    this.completedTarget.classList.add("d-none");
  }

  pending() {
    console.log("CLICK pending");
    console.log(this.pendingTarget);
    this.activeTarget.classList.add("d-none");
    this.pendingTarget.classList.remove("d-none");
    this.completedTarget.classList.add("d-none");
  }

  history() {
    console.log("CLICK history");
    console.log(this.completedTarget);
    this.activeTarget.classList.add("d-none");
    this.pendingTarget.classList.add("d-none");
    this.completedTarget.classList.remove("d-none");
  }

  // this.linkTarget.classList.remove("d-none")
    // fetch(this.formTarget.action, {
      //   method: "POST",
      //   headers: { "Accept": "application/json" },
      //   body: new FormData(this.formTarget)
      // })
      //   .then(response => response.json())
      //   .then((data) => {
        //     console.log(data)
        //   })
    }
