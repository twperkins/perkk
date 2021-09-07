class TokensController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @tokens = Token.all
  end

  def show
    @token = Token.find(params[:id])
  end
end
