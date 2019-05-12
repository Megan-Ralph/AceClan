 class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  #before_action :configure_account_update_params, only: [:update]

  def new
    super
  end

  def create
    super
  end

  def edit
    super
  end

  def update
    super
  end

  def destroy
    super
  end

  private

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username,  :game_id, :email, :password_confirmation, :password, :dob, :location, :discord_username, :mic, :what_game_why, :console_gaming, :hear_ace, :referring_member, :admin_interest, :clan_before, :vpn_connection])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

end
