class PortfoliosController < ApplicationController
  before_action :logged_in_user

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

    @portfolio.unique_constituent = portfolio_params ###product_idを降順でソートして連結させた文字列の作成（未実装）
    
    
  end


  def portfolio_params
    params.require(:portfolio).permit(:name, :user_id, :security_id, :purpose)
  end

end
