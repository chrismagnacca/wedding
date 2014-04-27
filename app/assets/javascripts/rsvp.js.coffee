window.String = class String
	constructor: () ->
	@IsBlank: (str) ->
		(!str || /^\s*$/.test(str))

window.Form = class Form
	constructor: (@valid = true) ->
	ValidateField: ($field) ->
		if window.String.IsBlank($field.val())
			@valid = false
			$field.addClass("error")
			$(".rsvp-errors").css("height", "40px")
			$(".rsvp-errors").css("display", "inline")

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
					form = new window.Form

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

					form.ValidateField($("#guest_names"))
					form.ValidateField($("#email_addr"))
					form.ValidateField($("#number_attending"))

					
					if form.valid
						$.ajax '/rsvp/create',
							type: 'POST',
							dataType: 'json',
							data: data,
							error: (jqXHR, textStatus, error) ->

							success: (data, textStatus, jqXHR) ->
								$('#rsvp-content').html(data.html)
					)
		)
