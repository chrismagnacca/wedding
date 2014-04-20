class RsvpController < ApplicationController
  def index
  end

  def new
    partial = nil

    if Guest.redeemed?(params[:code])
      partial = render_to_string(template: 'shared/_rsvp_used', layout: false)
    else
      partial = render_to_string(template: 'shared/_rsvp', layout: false )
    end

    respond_to do |format|
      format.json { render json: { success: true, html: partial } }
      format.html { }
    end
  end

  def rsvp
    # RsvpMailer.guest_email(name).deliver
    # RsvpMailer.notice_email(name).deliver
  end

end
