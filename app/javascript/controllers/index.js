// Import and register all your controllers from the importmap under controllers/*

import { application } from "./application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
import ThemeController from "./theme_controller"

application.register("theme", ThemeController)
eagerLoadControllersFrom("controllers", application)
