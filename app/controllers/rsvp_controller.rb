class RsvpController < ApplicationController
  def index

  end

  def new
    # todo: verify params[:code] has not been redeemed
    # success = Guest.code_redeemed?(params[:code]) || true

    partial = render_to_string(template: 'shared/_rsvp', layout: false )

    respond_to do |format|
      format.json { render json: { success: true, html: partial } }
      format.html { }
    end
  end

  def rsvp
    # todo: thank person for RSVP'ing & email rsvp 
    # @user = 'username'
    # mail(to: @user.email, subject: 'Thanks for RSVP')
  end

end
