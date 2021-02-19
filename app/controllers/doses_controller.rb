class DosesController < ApplicationController
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(strong_params)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      @doses = Dose.where(cocktail: @cocktail)
      render 'cocktails/show'
    end
  end

  def destroy
    dose = Dose.find(params[:id])
    dose.destroy
    @doses = Dose.where(cocktail: dose.cocktail)
    redirect_to cocktail_path(dose.cocktail)
  end

  private

  def strong_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
