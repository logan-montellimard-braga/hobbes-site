#= require jquery
#= require jquery_ujs
#= require jquery.validate
#= require_directory .

IS_ON_MOBILE = false

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

$(document).ready ->
  sizeMainImage()
  positionHeaderLogo()
  setOnMobile()
  $(".dropdown-button").dropdown hover: false
  $(".button-collapse").sideNav()
  $('.tooltipped').tooltip delay: 100
  $('ul.tabs').tabs()

  $("button.submit").remove()
  $("a.submit").show()
  $('a.submit').click (e) ->
    e.preventDefault()
    $("form#" + $(@).data("id")).submit()

  if $('form .error_notification').length > 0
    $('form span.error').prev('.input-field').children('input').addClass 'input-error'
    $('html, body').animate scrollTop: $('form .error_notification').offset().top - 100, 600

  $(".toast").click ->
    $(@).fadeOut 'slow'

  $("#main #code_image img").load ->
    sizeMainImage()

  $("nav img.brand-logo").load ->
    positionHeaderLogo()

  $(window).resize ->
    sizeMainImage()
    positionHeaderLogo()
    setOnMobile()

  didScroll = false
  lastScrollTop = 0
  delta = 10
  navbarHeight = $("nav").outerHeight()

  $(window).scroll (e) ->
    didScroll = true

  hasScrolled = () ->
    st = $(this).scrollTop()
    return if Math.abs(lastScrollTop - st) <= delta
    if st > lastScrollTop and st > navbarHeight
      $("nav").removeClass("nav-down").addClass "nav-up"
    else
      $("nav").removeClass("nav-up").addClass "nav-down"

    lastScrollTop = st

  setInterval () ->
    if IS_ON_MOBILE && didScroll
      hasScrolled()
      didScroll = false
    else if !IS_ON_MOBILE
      $("nav").removeClass("nav-up").addClass "nav-down"
  , 500
