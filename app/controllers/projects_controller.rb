class ProjectsController < ApplicationController
  layout "application"
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
      set_image_crop(@project)
    else
      render "new"
    end
  end

  def update
    @project = Project.find(params[:id])
    image_updated = [params[:project][:x1],params[:project][:y1],params[:project][:width],params[:project][:height]].index(nil).nil?

    if @project.update_attributes(params[:project])
      @project.crop(params[:project]) if image_updated
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

  def crop
    @project = Project.find(params[:id])
  end

  private

  def set_image_crop(project)
    redirect_to(crop_image_url(project))
  end

  def set_title_prefix
    @prefix = "work"
    @title = "Work"
  end
end
