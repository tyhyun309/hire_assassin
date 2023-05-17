// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName
import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers"

import { application } from "./application"

import BookingformController from "./bookingform_controller"
application.register("bookingform", BookingformController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)
