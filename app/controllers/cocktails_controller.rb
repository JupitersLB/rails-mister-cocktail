class CocktailsController < ApplicationController
  def index
    @cocktail = Cocktail.new
    @cocktails = Cocktail.all
    @animated_ingredients = Ingredient.all.pluck(:name).sample(10)
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = @cocktail.doses
    @dose = Dose.new
    @ingredients = Ingredient.find(@doses.pluck(:ingredient_id))
    @similar_doses = Dose.where(ingredient_id: @ingredients.pluck(:id))
    @cocktails = Cocktail.find(@similar_doses.pluck(:cocktail_id))
  end

  def cubes
    @cocktails = Cocktail.all
    @cocktail = Cocktail.find(params[:cocktail_id])
    @cocktail.update(cubes: params[:new_count])
    @cocktail.save
    render :index
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
    @cocktail = Cocktail.new
    @keyword = params[:q]
    @ingredient = Ingredient.where('name ILIKE ?', "%#{@keyword}%")
    @doses = Dose.where(ingredient_id: @ingredient.ids)
    @cocktails = Cocktail.find(@doses.pluck(:cocktail_id))
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo, :cubes)
  end
end
