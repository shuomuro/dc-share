class PortfolioController < ApplicationController
  before_action :logged_in_user

  def new
    @portfolio = Portfolio.new
  end  
  
  def create
    @portfolio = Portfolio.new(portfolio_params)

    @portfolio.unique_constituent = portfolio_params ###product_idを降順でソートして連結させた文字列の作成（未実装）
    
    
  end


  def portfolio_params
    params.require(:portfolio).permit(:name, :user_id, :security_id, :purpose)
  end

end
