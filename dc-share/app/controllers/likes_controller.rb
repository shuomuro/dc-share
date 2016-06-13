class LikesController < ApplicationController
  before_action :logged_in_user

  def create
    @portfolio = Portfolio.find(params[:portfolio_id])
    current_user.like(@portfolio)
  end

  def destroy
    @portfolio = Portfolio.find(params[:portfolio_id])
    current_user.unlike(@portfolio)
  end

end
