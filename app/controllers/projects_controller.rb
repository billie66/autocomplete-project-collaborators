class ProjectsController < ApplicationController
  before_action :find_project, :only => [:show, :add_collaborator, :delete_collaborator]
  autocomplete :user, :name

  def index
    @projects = Project.all
  end

  def show
    @collaborators = @project.collaborators
  end

  def add_collaborator
    @collaborator = User.find_by_name(params[:collab])
    return false if @collaborator.blank?
    if @project.collaborators.include?(@collaborator)
      @token = true
      return
    end
    @project.collaborators << @collaborator
    respond_to do |format|
      format.js
    end
  end

  def delete_collaborator
    @collaborator = User.find_by_name(params[:collab])
    @project.collaborators.delete(@collaborator)
    respond_to do |format|
      format.js
    end
  end

  private
  def find_project
    @project = Project.find_by_id(params[:id])
  end
end
