class HomeController < ApplicationController
  def index
    @pets = Pets.all
    rendes json: @pets
  end
end
