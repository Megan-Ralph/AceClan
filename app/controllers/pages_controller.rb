class PagesController < ApplicationController
  def index
    if user_signed_in? && current_user.present?
      @user = current_user
    end
  end

  def brand

  end

  def show
    render template: "pages/#{params[:page]}"
  end
end
