// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as Alpine from "alpinejs"

// Initialize Alpine.js
window.Alpine = Alpine
Alpine.start()

// Add this to debug
console.log("Application.js loaded")
