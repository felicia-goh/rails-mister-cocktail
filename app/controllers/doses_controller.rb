class DosesController < ApplicationController
  def index
    @cocktail = Cocktail.find(params[:cocktail_id])
    @doses = Dose.where(cocktail: @cocktail)
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(strong_params)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_doses_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_doses_path(@dose.cocktail)
  end

  private

  def strong_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
