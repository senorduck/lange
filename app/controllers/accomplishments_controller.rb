class AccomplishmentsController < ApplicationController

  layout "application"
  before_filter :set_title_prefix
  
  def index
    @accomplishments = Accomplishment.all
  end

  def show
    @accomplishment = Accomplishment.find(params[:id])
  end

  def new
    @accomplishment = Accomplishment.new
  end

  def edit
    @accomplishment = Accomplishment.find(params[:id])
  end

  def create
    @accomplishment = Accomplishment.new(params[:accomplishment])

    if @accomplishment.save
      flash.now[:notice] = 'Accomplishment was successfully created.'
      redirect_to(@accomplishment)
    else
      flash.now[:error] = 'Error with the record'
    end
  end

  def update
    @accomplishment = Accomplishment.find(params[:id])

    if @accomplishment.update_attributes(params[:accomplishment])
      flash[:notice] = 'Accomplishment was successfully updated.'
      redirect_to(@accomplishment)
    end
  end

  def destroy
    @accomplishment = Accomplishment.find(params[:id])
    @accomplishment.destroy

    redirect_to(accomplishments_url)
  end
  
  private
  
  def set_title_prefix
    @prefix = "accomplish"
    @title = "Accomplishments"
  end
end
