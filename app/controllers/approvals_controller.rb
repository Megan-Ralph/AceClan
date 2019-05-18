class ApprovalsController < ApplicationController
  def new

  end

  def show
    @approval = Approval.find(params[:id])
    @user = @approval.user
  end

  def create

  end
end
