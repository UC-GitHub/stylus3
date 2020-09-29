class StylesController < ApplicationController
  def index
    @style = Style.all.order("created_at DESC")
  end

  def new
    @style = Style.new
  end

  def create
    @style = Style.new(style_params)
    if @style.save
      redirect_to root_path
    else
      render :new
    end
  end

    private

    def style_params
      params.require(:style).permit(
        :image, :name, :type_id, :season_id, :age_id, :height_id, :body_figure_id, 
        :shipping_date_id, :description, :tops1_price, :tops2_price, 
        :tops3_price, :tops4_price, :tops5_price, :bottoms1_price, :bottoms2_price,
        :shoes_price, :accessories1_price, :accessories2_price, :accessories3_price,
        :total_price).merge(supplier_id: current_supplier.id)
    end
end