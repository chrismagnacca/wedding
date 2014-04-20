class Guest < ActiveRecord::Base

	def self.redeemed?(code)
		guest = Guest.find_by_invitation_code(code)
		return false unless guest
		guest.rsvp
	end
end
