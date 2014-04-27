$ ->
	$('#submit-code').on('click', (event) ->
		code = $('#invitation_code').val()
		
		$.ajax '/rsvp/new',
			type: 'POST',
			dataType: 'json',
			data: {code: code},
			error: (jqXHR, textStatus, error) ->

			success: (data, textStatus, jqXHR) ->
				$('#rsvp-content').html(data.html)
				$('#invitation_code').val(code)
				$('#submit-rsvp').on('click', (event) ->
					guest_names = $('#guest_names').val()
					email = $('#email_addr').val()
					invitation_code = $('#invitation_code').val()
					number_attending = $('#number_attending').val()
					meal_one = $('#meal_one').val()
					meal_two = $('#meal_two').val()
					meal_three = $('#meal_three').val()

					data =
						guest_names: guest_names
						email_addr: email
						invitation_code: invitation_code
						number_attending: number_attending
						meal_order: "Chicken & Steak: #{meal_one} | Vegetarian Meal: #{meal_two} | Childrens Meal: #{meal_three}"

					$.ajax '/rsvp/create',
						type: 'POST',
						dataType: 'json',
						data: data,
						error: (jqXHR, textStatus, error) ->

						success: (data, textStatus, jqXHR) ->
							$('#rsvp-content').html(data.html)
					)
		)
