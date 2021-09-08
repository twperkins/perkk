class UserTokensController < ApplicationController
  def create
    @token = Token.find(params[:token_id])
    @user_token = UserToken.new
    @user_token.token_id = @token.id
    @user_token.user_id = current_user.id
    if @user_token.save
      redirect_to package_path
    else
      redirect_to profile_path
    end
  end
end
