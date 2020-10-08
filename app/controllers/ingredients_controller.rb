class IngredientsController < ApplicationController

  def index
    if params[:sushi_id]
      @sushi = Sushi.find_by_id(params[:sushi_id])
      # also verify that sushi exists
      @ingredients = @sushi.ingredients
    else 
      @ingredients = Ingredient.all
    end
  end

  def show
    if params[:sushi_id]
      @sushi = Sushi.find_by_id(params[:sushi_id])
      
      set_ingredient
      if @sushi.ingredients.include?(@ingredient)
        # render :show
      else
        flash[:notice] = "Ingredient doesn't belong to sushi."
        redirect_to sushis_path
      end
    else 
      set_ingredient
    end
  end

  def new
    if params[:sushi_id]
      @sushi = Sushi.find_by_id(params[:sushi_id])
      @ingredient = @sushi.ingredients.build
    else 
      @ingredient = Ingredient.new
    end
  end

  def create
    if params[:sushi_id]
      @sushi = Sushi.find_by_id(params[:sushi_id])
      @ingredient = @sushi.ingredients.build(ingr_params)
    else 
      @ingredient = Ingredient.new(ingr_params)
    end

    if @ingredient.save
      redirect_to @ingredient
    else
      render :new, alert: "Could not create that for you!"
    end
  end


  private

  def ingr_params
    params.require(:ingredient).permit(:name, :ss_grams, :calories)
  end

  def set_ingredient
    @ingredient = Ingredient.find_by_id(params[:id])
  end
end
