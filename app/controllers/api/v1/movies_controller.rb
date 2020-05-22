# frozen_string_literal: true

class Api::V1::MoviesController < Api::V1::ApiController
  before_action :set_movie, only: %i[show update destroy]

  def index
    @movies = Movie.all

    render json: @movies
  end

  def show
    render json: MovieSerializer.new(@movie).serializable_hash.to_json
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      render json: MovieSerializer.new(@movie).serializable_hash.to_json, status: :created
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  def update
    if @movie.update(movie_params)
      render json: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :plot, :release_date)
  end
end
