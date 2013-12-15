class HomeController < ApplicationController
  def index
    partial = render_to_string(partial: 'shared/carousel')
    respond_to do |format|
      format.json { render json: { success:true, html: partial, layout: !request.xhr?} }
      format.html { }
    end
  end
  def hidden
  end
end
