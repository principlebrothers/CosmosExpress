import { Application } from "@hotwired/stimulus"
import "packs/bootstrap"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
