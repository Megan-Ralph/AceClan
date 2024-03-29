class SessionsController < Devise::SessionsController
  def new
    super
  end

  def create
    if params[:user][:email].present?
      @user = User.find_by(email: params[:user][:email])
      grab = ForumEnrollment.new(@user.id)
      grab.get_games_and_groups
    end
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    if !session[:return_to].blank?
      redirect_to session[:return_to]
      session[:return_to] = nil
    else
      respond_with resource, :location => after_sign_in_path_for(resource)
    end
  end
end
