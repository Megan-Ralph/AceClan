class ApprovalsController < ApplicationController
  def new

  end

  def show
    @approval = Approval.find(params[:id])
    @user = @approval.user
  end

  def create

  end

  def update
    @approval = Approval.find(params[:id])
    @user = @approval.user
    if params[:approvals][:approved_by] && params[:approvals][:approved_at]
      @approval.approved_by = params[:approvals][:approved_by]
      @approval.approved_at = params[:approvals][:approved_at]
    elsif params[:approvals][:denied]
      @approval.denied = params[:approvals][:denied]
    end
    if @approval.save
      redirect_to root_path
      flash[:notice] = "Applicant approved"
    end
  end
end
