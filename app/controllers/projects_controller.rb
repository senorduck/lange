class ProjectsController < ApplicationController
  layout "application"
  attr_accessor :status
  before_filter :set_title_prefix

  def index
    @projects = Project.active.all
  end
  
  def show
    @project = Project.find(params[:id])
  end
  
  def new
    @project = Project.new
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = 'Project was successfully created.'
      redirect_to(@project)
    else
      render "new"
    end
  end
  
  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      flash[:notice] = 'Project was successfully updated.'
      redirect_to(@project)
    else
      render "edit"
    end
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.update_attribute(:status, "deleted")
    flash[:success] = "Project Deleted"
    redirect_to(projects_url)
  end
  
  private
  
  def set_title_prefix
    @prefix = "work"
    @title = "Work"
  end
end
