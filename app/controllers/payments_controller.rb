class PaymentsController < ApplicationController
  def new
    @order = current_user.orders.where(state: 'confirmed').find(params[:order_id])
  end
end
