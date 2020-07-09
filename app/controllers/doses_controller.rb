class DosesController < ApplicationController
  # def new
  #   @cocktail = Cocktail.find(params[:cocktail_id])
  #   @dose = Dose.new
  # end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      @doses = Dose.where(cocktail_id: params[:cocktail_id])
      @ingredients = Ingredient.find(@doses.pluck(:ingredient_id))
      @similar_doses = Dose.where(ingredient_id: @ingredients.pluck(:id))
      @cocktails = Cocktail.find(@similar_doses.pluck(:cocktail_id))
      render template: 'cocktails/show'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
