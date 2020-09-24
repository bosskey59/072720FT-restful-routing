class SushisController < ApplicationController

  def index
    @sushis = Sushi.all
  end

  def show
    @sushi = Sushi.find_by(id: params[:id])
    if @sushi
      render :show
    else
      flash[:notice] = "Sushi not Found!"
      redirect_to sushis_path
    end
  end

  def new
    @sushi = Sushi.new
  end

  def create
    @sushi = Sushi.new(sushi_params)
    # @sushi = Sushi.create(sushi_params)

    if @sushi.save
      # redirect_to sushi_path(@sushi)
      redirect_to @sushi
    else
      flash[:notice] = @sushi.errors.full_messages.join(" ")
      redirect_to sushis_new_path
    end
  end

  def edit
    @sushi = Sushi.find_by(id: params[:id])
  end

  def update
    @sushi = Sushi.find_by(id: params[:id])
    @sushi.update(sushi_params)
    if @sushi.errors.empty?
      redirect_to @sushi
    else
      flash[:notice] = @sushi.errors.full_messages.join(" ")
      redirect_to edit_sushi_path(@sushi)
    end
  end

  def destroy
    @sushi = Sushi.find_by(id: params[:id])
    if @sushi.destroy
      redirect_to sushis_path
    else
      flash[:notice] = "Was unable to delete sushi!"
      redirect_to @sushi
    end
  end

  private

  def sushi_params
    params.require(:sushi).permit(:name)
  end

end
