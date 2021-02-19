class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = Dose.where(cocktail: @cocktail)
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(strong_params)

    if @cocktail.save
      redirect_to cocktails_path
    else
      render :new
    end
  end

  private

  def strong_params
    params.require(:cocktail).permit(:name)
  end
end
