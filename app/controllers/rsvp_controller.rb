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

  def create
    partial = nil

    guest_names = params[:guest_names]
    email_addr = params[:email_addr]
    invitation_code = params[:invitation_code]
    number_attending = params[:number_attending]
    meal_order = params[:meal_order]

    attributes = {
      guest_names: guest_names,
      email_address: email_addr,
      meal_order: meal_order,
      number_attending: number_attending,
      rsvp: true
    }

    @guest = Guest.find_by_invitation_code(invitation_code)

    if  (!@guest) || (@guest.rsvp)
      partial = render_to_string(template: 'shared/_rsvp_used', layout: false)
    elsif @guest.update_attributes(attributes)
      RsvpMailer.guest_email(guest_names, email).deliver
      RsvpMailer.notice_email(guest_names, meal_order).deliver
      patial = render_to_string(template: 'shared/_rsvp_success', layout: false)
    else
      partial = render_to_string(template: 'shared/_rsvp_error', layout: false)
    end

    respond_to do |format|
      format.json { render json: { success: true, html: partial } }
      format.html { }
    end
  end

end
