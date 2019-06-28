class UsersController < ApplicationController

  before_action :authenticate_user!

  def edit
    @user = current_user
    f = ForumEnrollment.new(@user.id)
    f.get_forum_groups
  end

  def update_user_groups
    @user = current_user

    if @user.update(user_params)
      redirect_to request.referer

      f = ForumEnrollment.new(@user.id)
      f.change_groups(params[:forum_primary_group_id], params[:forum_secondary_groups])
    else
      render "edit"
    end
  end

  def update_user
    @user = current_user
    if @user.update(user_params)
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@user)
      redirect_to root_path
      Approval.create(user_id: @user.id, game_id: params[:user][:game_id])
      flash[:alert] = "Thanks for applying! Please wait for approval from a member of the admissions team!"
    else
      render "edit"
    end
  end

  private

  def user_params
    # NOTE: Using `strong_parameters` gem
    params.require(:user).permit(:forum_primary_group_id, :forum_secondary_groups, :username, :email, :game_id, :dob, :location, :discord_username, :mic, :what_game_why, :console_gaming, :hear_ace, :referring_member, :admin_interest, :clan_before, :vpn_connection)
  end
end
