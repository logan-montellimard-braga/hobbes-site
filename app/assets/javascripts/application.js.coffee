#= require jquery
#= require jquery_ujs
#= require jquery.validate
#= require_directory .

IS_ON_MOBILE = false
didScroll = false
lastScrollTop = 0
delta = 10

setOnMobile = () ->
  if $("nav").css("z-index") < 9999
    IS_ON_MOBILE = true
  else
    IS_ON_MOBILE = false

sizeMainImage = () ->
  $("#main #code_image img").css("left", $(window).width() / 2 - $("#main #code_image img").width() / 2)

positionHeaderLogo = () ->
  $('style[data-id="menu"]').remove()
  pos = $(window).width() / 2 - $(".brand-logo").width() / 2 + "px"
  style = "<style data-id='menu' type='text/css'>@media (max-width: 992px) { nav .brand-logo { left: " + pos + " } }</style>"
  $("body").append style

setSubmitButtons = () ->
  $("button.submit").remove()
  $("a.submit").show()
  $('a.submit').click (e) ->
    e.preventDefault()
    $("form#" + $(@).data("id")).submit()

goToNextErrorInForm = () ->
  if $('form .error_notification').length > 0
    $('form span.error').prev('.input-field').children('input').addClass 'input-error'
    $('html, body').animate scrollTop: $('form .error_notification').offset().top - 100, 600

makeToastsDismissible = () ->
  unless IS_ON_MOBILE
    $(".toast").click ->
      $(@).fadeOut 'slow'


hasScrolled = (navHeight) ->
  st = $(this).scrollTop()
  return if Math.abs(lastScrollTop - st) <= delta
  if st > lastScrollTop and st > navHeight
    $("nav").removeClass("nav-down").addClass "nav-up"
  else
    $("nav").removeClass("nav-up").addClass "nav-down"

  lastScrollTop = st

$(document).ready ->
  sizeMainImage()
  positionHeaderLogo()
  setOnMobile()
  setSubmitButtons()
  goToNextErrorInForm()
  makeToastsDismissible()
  navbarHeight = $("nav").outerHeight()

  $(".dropdown-button").dropdown hover: false
  $(".button-collapse").sideNav()
  $('.modal-trigger').leanModal()
  $('.tooltipped').tooltip delay: 100
  $('ul.tabs').tabs()

  $("#main #code_image img").load ->
    sizeMainImage()

  $("nav img.brand-logo").load ->
    positionHeaderLogo()

  $(window).resize ->
    sizeMainImage()
    positionHeaderLogo()
    setOnMobile()

  $("form").on 'keyup', (e) ->
    $(this).submit() if e.which is 13 and !e.shiftKey

  # Navbar auto hiding
  $(window).scroll (e) ->
    didScroll = true

  setInterval () ->
    if IS_ON_MOBILE && didScroll
      hasScrolled(navbarHeight)
      didScroll = false
    else if !IS_ON_MOBILE
      $("nav").removeClass("nav-up").addClass "nav-down"
  , 500
