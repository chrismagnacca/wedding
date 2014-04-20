class RsvpMailer < ActionMailer::Base
  default from: "chrismagnacca@gmail.com"

  def guest_email(name, email)
    @name = name

    mail(to: email, subject: 'Thank You!')
  end

  def notice_email(name)
    @name = name

    mail(to: 'chrismagnacca@gmail.com, lsapharas@gmail.com', subject: "#{name} - RSVP")
  end

  def list_email
  end


end
