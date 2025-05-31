import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // Set initial theme based on localStorage or system preference
    const theme = localStorage.getItem('theme') || 
                 (window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light')
    document.documentElement.classList.toggle('dark', theme === 'dark')
  }

  toggle() {
    // Toggle dark class on html element
    document.documentElement.classList.toggle('dark')
    
    // Save preference
    const isDark = document.documentElement.classList.contains('dark')
    localStorage.setItem('theme', isDark ? 'dark' : 'light')
  }
} 