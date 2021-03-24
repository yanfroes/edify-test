module Api
  module V1

class PetsController < ApplicationController
  before_action :authorize_access_request!
  before_action :set_pet, only: [:show, :update, :destroy]

  # GET /pets
  def index
    @pets = current_user.pets.all

    render json: @pets
  end

  # GET /pets/1
  def show
    render json: @pet
  end

  # POST /pets
  def create
    @pet = current_user.pets.build(pet_params)

    if @pet.save
      render json: @pet, status: :created
    else
      render json: @pet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pets/1
  def destroy
    @pet.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = current_user.pets.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pet_params
      params.require(:pet).permit(:name, :user_id)
    end
end

end
end
