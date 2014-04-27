class RsvpMailer < ActionMailer::Base
  default from: "Chris Magnacca <chrismagnacca@gmail.com>, Lauren Sapharas <lsapharas@gmail.com>"

  def guest_email(names, email)
    @names = names
    @email = email
    mail(to: @email, subject: 'RSVP Recieved, Thank You!')
  end

  def notice_email(names, invitation_code, meal_order)
    @names = names
    @invitation_code = invitation_code
    @meal_order = meal_order
    @recipients = ['Chris Magnacca <chrismagnacca@gmail.com>', 'Lauren Sapharas <lsapharas@gmail.com>']
    mail(to: @recipients, subject: "Wedding RSVP Recieved")
  end

  def list_email(guests)
    @guests = guests
    @recipients = ['Chris Magnacca <chrismagnacca@gmail.com>', 'Lauren Sapharas <lsapharas@gmail.com>']
    mail(to: @recipients, subject: "Current RSVP Status")
  end

end
