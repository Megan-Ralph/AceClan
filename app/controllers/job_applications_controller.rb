class JobApplicationsController < ApplicationController

  def index
    @job_applications = JobApplication.all
  end

  def show
    @job_application = JobApplication.find(params[:id])
    @user = User.find(@job_application.user_id)
  end

  def new
    @job_application = JobApplication.new
  end

  def create
    @job_application = JobApplication.new(job_application_params)
    @job_application.user_id = current_user.id
    @job_application.listing_id = @listing_id
    @job_application.status = "pending"

    respond_to do |format|
      if @job_application.save
        format.html { redirect_to root_path, notice: 'Job Application was successfully created.' }
      else
        format.html { render action: 'new' }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def job_application_params
    params.require(:job_application).permit(:name, :description, :user_id, :listing_id)
  end
end
