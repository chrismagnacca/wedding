# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('#submit-code').on('click', (event) ->
		code = $('#invitation_code').val()
		console.log code
		$.ajax '/rsvp/new',
			type: 'POST',
			dataType: 'json',
			data: {code: code},
			error: (jqXHR, textStatus, error) ->

			success: (data, textStatus, jqXHR) ->
				$('#rsvp-content').html(data.html)
		)
