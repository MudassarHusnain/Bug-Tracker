class ProjectsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @projects = Project.all
  end

  def new
    debugger
    @project = current_user.projects.new
  end

  def create
    # debugger
    @project = current_user.projects.new(project_params)
    if @project.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(:second_frame,partial: "project",locals: {project: @project})
        end
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  private

   def project_params
    params.require(:project).permit(:name, :user_id)
   end
end
