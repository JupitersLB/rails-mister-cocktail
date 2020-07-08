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
  end

  # def new
  #   @cocktail = Cocktail.new
  #   respond_to do |format|
  #     format.html
  #     format.js
  #   end
  # end

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
    @ingredient = Ingredient.find_by_name(@keyword.downcase)
    @dose = Dose.where(ingredient: @ingredient)

    # @ingredient = Ingredient.where('name LIKE ?', "%#{@keyword}%")
    # @dose = Dose.where(ingredient_id: @ingredient.ids)
    @cocktails = Cocktail.find(@dose.ids)
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
