class StylesController < ApplicationController

  before_action :set_style_search_query

  def index
    @style = Style.all.order("created_at DESC")
    @styles = Style.all
    # search_style
  end

  def show
    @style = Style.find(params[:id])
  end

  def search
    @results = @p.result.order("created_at DESC") # 検索条件にマッチした商品の情報を取得
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

    def search_product
      @p = Style.ransack(params[:q])  # 検索オブジェクトを生成
    end

    # def search_style
    #   @type          = Type.where.not(id: 1)  # 検索オブジェクトを生成
    #   @season        = Season.where.not(id: 1)
    #   @age           = Age.where.not(id: 1)
    #   @height        = Height.where.not(id: 1)
    #   @body_figure   = BodyFigure.where.not(id: 1)
    #   @shipping_date = ShippingDate.where.not(id: 1)
    # end

end