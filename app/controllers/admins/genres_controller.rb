class Admins::GenresController < ApplicationController
  before_action :set_genre, only: %i[ edit update destroy ]

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_admins_genres_path(current_admin)
    else
      render :index
    end
  end

  def edit
  end

  def update
    if @genre.update(genre_params)
      redirect_to admin_admins_genres_path(current_admin)
    else
      render :index
    end
  end

  def destroy
    @genre.destroy
    redirect_to admin_admins_genres_path(current_admin)
  end

  private

  def set_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name, :flag_active)
  end
end
