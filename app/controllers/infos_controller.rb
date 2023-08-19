class InfosController < ApplicationController
  before_action :set_info, only: %i[ show edit update ]
  
  def index
    @infos = Info.all
  end

  def show
  end

  def new
    @info = Info.new
  end

  def edit
  end

  def create
    @info = Info.new(info_params)
    if params[:back]
      render :new
    else
      if @info.save
        redirect_to infos_path
      else
        render :new
      end
    end
  end

  def update
    if @info.update(info_params)
      redirect_to infos_path
    else
      render :edit
    end
  end

  private

  def set_info
    @info = Info.find(params[:id])
  end

  def info_params
    params.require(:info).permit(:title, :content, :viewer_type)
  end
end
