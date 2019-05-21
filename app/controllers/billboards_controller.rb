class BillboardsController < ApplicationController
  before_action :set_billboard, only: [:show, :update, :edit, :destroy]
  
  def index
    #@billboards = Billboard.all
    @billboards = current_user.billboards 
  end

  def show
  end

  def new
    # @billboard = Billboard.new
    @billboard = Billboard.new
    render partial: "form"
  end

  def edit
     render partial: "form"
  end

  def create
    # @billboard = Billboard.new(billboard_params)

    #   if @billboard.save
    #     redirect_to billboards_path
    #   else
    #     render :new
    #   end
    @billboard = current_user.billboards.new(billboard_params)
    if @billboard.save
      flash[:success] = "Chart: #{@billboard.chart_name} Created"
      redirect_to billboards_path
    else
      flash[:error] = "Error #{@billboard.errors.full_messages.join('\n')}"
      render :new
    end
  end

  def update
    # if @billboard.update(billboard_params)
    #   redirect_to @billboard
    # else
    #   render :edit
    # end 
    if @billboard.update(billboard_params)
      redirect_to billboards_path
    else
      render :edit
    end
  end

  def destroy
    @billboard.destroy
    redirect_to billboards_path
  end

  private

  def set_billboard
    # @billboard = Billboard.find(params[:id])
    @billboard = current_user.billboards.find(params[:id])
  end

  def billboard_params
    params.require(:billboard).permit(:chart_name)
  end

    
end