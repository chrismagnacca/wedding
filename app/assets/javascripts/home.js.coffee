# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#rsvp button').on('click', ->

  )

  $('.carousel').carousel({ interval: 3500, pause: "hover" })

  note = $('#note')
  ts = new Date(2014, 5, 28, 16, 30)

  $('#countdown').countdown({
      timestamp	: ts,
      callback	: (days, hours, minutes, seconds) ->
        message = ""

        message += days + " day" + ( days==1 ? '':'s' ) + ", "
        message += hours + " hour" + ( hours==1 ? '':'s' ) + ", "
        message += minutes + " minute" + ( minutes==1 ? '':'s' ) + " and "
        message += seconds + " second" + ( seconds==1 ? '':'s' ) + " <br />"
  })

