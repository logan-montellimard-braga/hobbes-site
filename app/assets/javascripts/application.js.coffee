#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require_directory .

Turbolinks.enableProgressBar()

$(document).ready ->
  $(".dropdown-button").dropdown hover: false
  $(".button-collapse").sideNav()

  $("#preloader").fadeOut 'slow'

  $("#main_drop a").click ->
    @.click()

  $(".toast").click ->
    $(@).fadeOut 'slow'
