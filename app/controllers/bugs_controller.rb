class BugsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @bugs = Bug.all
  end

  def new
    debugger
    @bug = current_user.bugs.new
  end

  def create
    # debugger
    @bug = current_user.bugs.new(bug_params)
    debugger
    if @bug.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(:second_frame,partial: "bug",locals: {bug: @bug})
        end
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  private

  def bug_params
    params.require(:bug).permit(:title, :user_id,:developer_id,:project_id,:bug_status,:dead_line,:bug_type,:description)
  end


end
