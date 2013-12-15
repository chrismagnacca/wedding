class HomeController < ApplicationController
  def index
  end
  def hidden
  end

  def countdown
    @date = Time.new(2014, 06, 28, 16, 30).to_date
    respond_to { |format| format.json { render json: @date } }
  end
end
