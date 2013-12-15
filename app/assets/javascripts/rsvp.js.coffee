# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('#rsvp button').on('click', ->
    $('#rsvp-modal').modal('show')
  )

  $('#attendingYes').on('click', ->
    $('#attending-food-row').show()
    $('#guest-row').show()
  )

  $('#attendingNo').on('click', ->
    $('#attending-food-row').hide()
    $('#guest-row').hide()
  )

  $('#guestYes').on('click', ->
    $('#guest-name-input').show()
    $('#guest-name-input').css('display','block')
    $('#guest-food-row').show()
  )

  $('#guestNo').on('click', ->
    $('#guest-name-input').hide()
    $('#guest-food-row').hide()
  )