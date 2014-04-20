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
