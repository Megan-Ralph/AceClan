class PagesController < ApplicationController
  def index
    #index stuff
  end

  def show
    render template: "pages/#{params[:page]}"
  end
end
