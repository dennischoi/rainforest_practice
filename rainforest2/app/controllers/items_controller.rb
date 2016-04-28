class ItemsController < ApplicationController
  def index
    @items = if params[:search]
      Item.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%")
    else
    Item.all
    end
    # For the AJAX and JS GET method
    # if request.xhr?
    #   render @items
    # end


    # Better way of implementing format for all the necessary code variations
    respond_to do |format|
      format.html
      format.js
    end

  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_url
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update_attributes(item_params)
      redirect_to item_path(@item)
    else
      render :exit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price_in_cents)
  end



end
