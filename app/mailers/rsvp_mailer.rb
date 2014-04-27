class RsvpMailer < ActionMailer::Base
  default from: "Chris Magnacca <chrismagnacca@gmail.com>, Lauren Sapharas <lsapharas@gmail.com>"

  def guest_email(names, email)
    @names = names

    mail(to: email, subject: 'RSVP Recieved')
  end

  def notice_email(names)
    @names = names

    mail(to: 'Chris Magnacca <chrismagnacca@gmail.com>, Lauren Sapharas <lsapharas@gmail.com>', subject: "#{names} - RSVP")
  end

  def list_email(guests)
    @guests = guests

    mail(to: 'Chris Magnacca <chrismagnacca@gmail.com>, Lauren Sapharas <lsapharas@gmail.com>', subject: "Current RSVP Status")
  end

end
