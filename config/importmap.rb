# Pin npm packages by running ./bin/importmap

pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "application", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "alpinejs", to: "https://unpkg.com/alpinejs@3.13.3/dist/cdn.min.js"
