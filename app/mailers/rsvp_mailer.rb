class RsvpMailer < ActionMailer::Base
  default from: "chrismagnacca@gmail.com"

  def guest_email(names, email)
    @names = names

    mail(to: email, subject: 'RSVP Recieved')
  end

  def notice_email(names)
    @names = names

    mail(to: 'chrismagnacca@gmail.com, lsapharas@gmail.com', subject: "#{names} - RSVP")
  end

  def list_email(guests)
    @guests = guests

    mail(to: 'chrismagnacca@gmail.com', subject: "RSVP Status")
  end

end
