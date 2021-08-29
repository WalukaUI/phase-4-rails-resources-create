class BirdsController < ApplicationController

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  #post
  def create
    newbird=Bird.create(name: params[:name], species: params[:species])
    render json: newbird, status: :created 

  end
 
  private

  def image_params
    params.require(:bird).permit(:name, :species)
  end

end