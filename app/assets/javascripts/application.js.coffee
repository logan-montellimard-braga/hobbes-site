#= require jquery
#= require jquery_ujs
#= require_directory .

sizeMainImage = () ->
  $("#main #code_image img").css("left", $(window).width() / 2 - $("#main #code_image img").width() / 2)

positionHeaderLogo = () ->
  $('style[data-id="menu"]').remove()
  pos = $(window).width() / 2 - $(".brand-logo").width() / 2 + "px"
  style = "<style data-id='menu' type='text/css'>@media (max-width: 992px) { nav .brand-logo { left: " + pos + " } }</style>"
  $("body").append style

$(document).ready ->
  sizeMainImage()
  positionHeaderLogo()
  $(".dropdown-button").dropdown hover: false
  $(".button-collapse").sideNav()
  $('.tooltipped').tooltip delay: 100

  # $("#preloader").fadeOut 'slow'

  $("#main_drop a").click ->
    @.click()

  $(".toast").click ->
    $(@).fadeOut 'slow'

  $("#main #code_image img").load ->
    sizeMainImage()

  $("nav img.brand-logo").load ->
    positionHeaderLogo()

  $(window).resize ->
    sizeMainImage()
    positionHeaderLogo()
