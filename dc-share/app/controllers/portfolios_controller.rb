class PortfoliosController < ApplicationController
  before_action :logged_in_user
  before_action :set_portfolio, only: [:show]
 

  def index
    
  end

  def new
    @portfolio = Portfolio.new
  end
  
  def constituent
    @portfolio = Portfolio.new
    @portfolio.constituents.build #階層化で追加

    @security = Security.find_by(security_code: portfolio_params[:security_id]) #前ページで指定した証券会社のインスタンス

    @lineup = @security.lineups #証券会社のラインナップのインスタンス

    @line = []
    @lineup.each do |l|
     @line.push(l.product_id)
    end
  end
  
  
  def create
    @portfolio = Portfolio.new(portfolio_params)

    if @portfolio.save #DBに保存
      #product_idを降順でソートして連結させた文字列の作成、セパレーター":"
      #先にsaveしておかないとwhere句の"@portfolio.id"が発行されていないため先に実行が必要
      Constituent.where(portfolio_id: @portfolio.id).order("product_id ASC").each do |c|
        if @portfolio.unique_constituent.nil? #nilへの代入が不可のため
          @portfolio.unique_constituent = c.product_id.to_s #to_sは数値型を文字列型へ変換
        else
          @portfolio.unique_constituent += ":"
          @portfolio.unique_constituent += c.product_id.to_s
        end
      end
      #ここまでで生成したproduct_idの連結文字列をDBに保存
      #念のためここでもfalseの場合はnewへ
      if @portfolio.save
        redirect_to @portfolio, notice: "ポートフォリオの作成が完了しました"
      else
        render 'new'
      end
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
        :product_id,
        :_destroy #nest用で追加
      ]
    )
  end

  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
  end

end
