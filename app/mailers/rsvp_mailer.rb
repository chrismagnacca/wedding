class RsvpMailer < ActionMailer::Base
  default from: "Chris Magnacca <chrismagnacca@gmail.com>, Lauren Sapharas <lsapharas@gmail.com>"

  def guest_email(names, email)
    @names = names
    @email = email
    mail(to: @email, subject: 'RSVP Recieved')
  end

  def notice_email(names, meal_order)
    @names = names
    @meal_order = meal_order
    @recipients = ['Chris Magnacca <chrismagnacca@gmail.com>', 'Lauren Sapharas <lsapharas@gmail.com>']
    mail(to: @recipients, subject: "#{@names} - RSVP")
  end

  def list_email(guests)
    @guests = guests
    @recipients = ['Chris Magnacca <chrismagnacca@gmail.com>', 'Lauren Sapharas <lsapharas@gmail.com>']
    mail(to: @recipients, subject: "Current RSVP Status")
  end

end
