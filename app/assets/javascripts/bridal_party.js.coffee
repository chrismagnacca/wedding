# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('a#bridal_party').on('click', (e) ->
    e.preventDefault()
    $.get '/bridal_party', (data) ->
      $('#main-content').html(data.html)
  )
