class SushisController < ApplicationController
  # layout "custom"
  # layout :false

  before_action :set_sushi, only: [:show, :edit, :update, :destroy]

  def index
    # byebug
    @sushis = Sushi.all
    render layout: "custom"
  end

  def show
    if @sushi
      render :show
    else
      flash[:notice] = "Sushi not Found!"
      redirect_to sushis_path
    end
  end

  def new
    @sushi = Sushi.new
    @name = "Alex"
    5.times { @sushi.ingredients.build }
  end

  def create
    @sushi = Sushi.new(sushi_params)
    # @sushi = Sushi.create(sushi_params)
    # byebug
    if @sushi.save
      # redirect_to sushi_path(@sushi)
      redirect_to @sushi
    else
      flash[:notice] = @sushi.errors.full_messages.to_sentence
      render :new
      # redirect_to new_sushi_path
    end
  end

  def edit
    # @sushi = Sushi.find_by(id: params[:id])
  end

  def update
    # @sushi = Sushi.find_by(id: params[:id])
    @sushi.update(sushi_params)
    if @sushi.errors.empty?
      redirect_to @sushi
    else
      flash[:notice] = @sushi.errors.full_messages.join(" ")
      redirect_to edit_sushi_path(@sushi)
    end
  end

  def destroy
    # @sushi = Sushi.find_by(id: params[:id])
    if @sushi.destroy
      redirect_to sushis_path
    else
      flash[:notice] = "Was unable to delete sushi!"
      redirect_to @sushi
    end
  end

  def search

  end

  def results
    @sushis = Sushi.search(params[:q])
    render :index
  end

  private

  def set_sushi
    @sushi = Sushi.find_by(id: params[:id])
  end

  def sushi_params
    params.require(:sushi).permit(:name, ingredients_attributes:[:id, :name, :calories, :ss_grams])
  end

end
