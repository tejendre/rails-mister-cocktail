class DosesController < ApplicationController
before_action :set_cocktail, only: [:new, :create]

def new
  @dose = Dose.new
  # @cocktail = Cocktail.find(params[:cocktail_id])
  @ingredients = Ingredient.all
end

def create
  @dose = Dose.new(dose_params)
  @dose.cocktail_id = @cocktail.id

  @dose.save
      redirect_to cocktail_path(@cocktail)
    # else
    #   render :new
    # end
end

def destroy
  @dose = Dose.find(params[:id])
  @dose.destroy
  redirect_to cocktail_path(@dose.cocktail)
  # redirect_to
end

private
def dose_params
  params.require(:dose).permit(:description, :ingredient_id)
end

def set_cocktail
  @cocktail = Cocktail.find(params[:cocktail_id])
end

end
