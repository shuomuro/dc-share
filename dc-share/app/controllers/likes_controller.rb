class LikesController < ApplicationController
  before_action :logged_in_user

  def create
    current_user.like(@portfolio)
  end

  def destroy
    current_user.unlike(@portfolio)
  end

end
