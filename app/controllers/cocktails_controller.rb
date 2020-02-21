class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    find
    @doses = @cocktail.doses
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to new_cocktail_dose_path(@cocktail)
    else
      render :new
    end
  end

  def edit
    find
  end

  def update
    find
    if @cocktail.update(cocktail_params)
      redirect_to cocktail_path(@cocktail)
    else
      redner :edit
    end
  end

  def destroy
    find
    @cocktail.destroy
    redirect_to root_path
  end

  private

  def find
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
