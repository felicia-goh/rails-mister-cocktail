class CocktailsController < ApplicationController
  def index
    @cocktails = params[:query].present? ? Cocktail.where("lower(name) LIKE ?", "%#{params[:query].downcase}%") : Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = Dose.where(cocktail: @cocktail)
    @dose = Dose.new
    @reviews = Review.where(cocktail: @cocktail)
    @review = Review.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(strong_params)

    if @cocktail.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def strong_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
