class BillboardsController < ApplicationController
  before_action :set_billboard, only: [:show, :edit, :update, :destroy]

  def index
    @billboards = current_user.billboards
  end

  def show
  end

  def new
    @billboard = current_user.billboards.new
  end

  def create
    @billboard = current_user.billboards.new(billboard_params)
    if @billboard.save
      flash[:success] = "Billboard Created"
      redirect_to billboards_path
    else
      flash[:error] = "Error #{@billboard.errors.full_messages.join("\n")}"
      render :new
    end
  end

  def edit
  end

  def update
    if @billboard.update(billboard_params)
      flash[:success] =  "Billboard: #{@billboard.name} Updated"
      redirect_to billboards_path
    else
      flash[:error] = "Error #{@billboard.errors.full_messages.join("\n")}"
      render :edit
    end
  end

  def destroy
    @billboard.destroy
    flash[:success] =  "Billboard: #{@billboard.name} Deleted"
    redirect_to billboards_path
  end

  private 
    def set_billboard
      @billboard = current_user.billboards.find(params[:id])
    end

    def billboard_params
      params.require(:billboard).permit(:name)
    end
end
