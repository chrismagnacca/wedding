class Guest < ActiveRecord::Base

	def self.redeemed?(code)
		@guest = Guest.find_by_invitation_code(code)

		if @guest
			@guest.rsvp
		else
			false
		end
	end
	
end
