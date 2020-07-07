class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
    @animated_ingredients = Ingredient.all.pluck(:name).sample(10)
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = @cocktail.doses
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def search
    @keyword = params[:q]
    @ingredient = Ingredient.where('name LIKE ?', "%#{@keyword}%")
    @cocktails = @ingredient.doses.cocktails
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
