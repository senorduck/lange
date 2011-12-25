class ProjectsController < ApplicationController
  layout "application"
  before_filter :set_title_prefix

  def index
    @projects = signed_in? ? Project.visible.all : Project.active.all
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
      redirect_to(crop_project_path(@project))
    else
      render "new"
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      @project.update_attribute(:status, "pending")
      @project.crop(params[:project]) if image_cropped?
      if image_updated?
        redirect_to(crop_project_path(@project))
      else
        redirect_to(@project)
      end
    else
      render "edit"
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.update_attribute(:status, "deleted")
    flash[:success] = "Project ##{params[:id]} Deleted"
    redirect_to(projects_url)
  end

  def crop
    @project = Project.find(params[:id])
  end

  def publish
    project = Project.find(params[:id])
    project.update_attribute(:status, "active")
    flash[:success] = "Project ##{params[:id]} Now Live!"
    redirect_to(projects_url)
  end

  def activate
    project = Project.find(params[:id])
    project.update_attribute(:status, "pending")
    flash[:success] = "Project ##{params[:id]} now pending publication"
    redirect_to(deleted_projects_path)
  end

  def deleted
    @projects = Project.deleted.all
  end

  private

  def image_updated?
    !(params[:project][:artwork].nil?)
  end

  def image_cropped?
    [params[:project][:x1],params[:project][:y1],params[:project][:width],params[:project][:height]].index(nil).nil?
  end

  def set_title_prefix
    @prefix = "work"
    @title = "Work"
  end
end
