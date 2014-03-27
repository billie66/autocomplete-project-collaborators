class ProjectsController < ApplicationController
  autocomplete :user, :name

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find_by_id(params[:id])
  end
end
