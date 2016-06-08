class PortfoliosController < ApplicationController
  before_action :logged_in_user
  before_action :set_portfolio, only: [:show]
 

  def new
    @portfolio = Portfolio.new
  end
  
  def constituent
    @portfolio = Portfolio.new
    @portfolio.constituents.build #階層化で追加

    @security = Security.find_by(security_code: portfolio_params[:security_id]) #前ページで指定した証券会社のインスタンス

    @lineup = @security.lineups #証券会社のラインナップのインスタンス

  end
  
  
  def create
    @portfolio = Portfolio.new(portfolio_params)
    @portfolio.unique_constituent = portfolio_params[:constituents_attributes]['0'][:product_id] ###product_idを降順でソートして連結させた文字列の作成（未実装）、セパレーターも要決定


    if @portfolio.save
      redirect_to @portfolio, notice: "ポートフォリオの作成が完了しました"
    else
      render 'new'
    end
  end

  def show
    
  end


#  ネスト前に使用
#  def portfolio_params
#    params.require(:portfolio).permit(:name, :user_id, :security_id, :purpose)
#  end

  def portfolio_params
    params.require(:portfolio).permit(
      :name,
      :user_id,
      :security_id,
      :purpose,
      constituents_attributes: [
        :id,
        :percent,
        :product_id
      ]
    )
  end

  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
  end

end
