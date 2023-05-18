import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
// export default class extends Controller {
//   connect() {
//   }
// }

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.mapContainers = document.querySelectorAll('[data-controller="map"]')

    this.mapContainers.forEach((container) => {
      const mapId = container.getAttribute('id')
      const bookingId = mapId.split('-')[1] // Extract the booking ID from the container's ID

      this.map = new mapboxgl.Map({
        container: mapId,
        style: 'mapbox://styles/mapbox/streets-v10'
      })

      const bookingMarkers = this.markersValue.filter((marker) => marker.booking.id == bookingId)

      this.#addMarkersToMap(bookingMarkers)
      this.#fitMapToMarkers(bookingMarkers)
    })
  }

  #addMarkersToMap(markers) {
    markers.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map)
    })
  }

  #fitMapToMarkers(markers) {
    const bounds = new mapboxgl.LngLatBounds()

    markers.forEach(marker => {
      bounds.extend([marker.lng, marker.lat])
    })

    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  #addMarkersToMap(markers) {
    markers.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map)
    })
  }
}
