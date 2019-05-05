class UsersController < ApplicationController

  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update_user
    @user = current_user
    if @user.update(user_params)
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@user)
      redirect_to root_path
    else
      render "edit"
    end
  end

  private

  def user_params
    # NOTE: Using `strong_parameters` gem
    params.require(:user).permit(:username, :email, :game_id, :dob, :location, :discord_username, :mic, :what_game_why, :console_gaming, :hear_ace, :referring_member, :admin_interest, :clan_before, :vpn_connection)
  end
end
