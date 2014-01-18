class BridalPartyController < ApplicationController
  def index
    partial = render_to_string(partial: 'shared/bridal_party')
    respond_to do |format|
      format.json { render json: { success:true, html: partial, layout: !request.xhr?} }
      format.html { }
    end
  end
end
