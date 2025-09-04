import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]

  toggle(event) {
    event.stopPropagation() // ← ADICIONADO: impede a propagação do evento
    this.menuTarget.classList.toggle("show")
  }

  hide(event) {
    if (!this.element.contains(event.target)) {
      this.menuTarget.classList.remove("show")
    }
  }
}