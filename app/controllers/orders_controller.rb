class OrdersController < ApplicationController
  def create
    token = Token.find(params[:token_id])
    order = Order.create!(token: token, token_bundle: token.bundle, amount: token.price, state: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: token.bundle,
        amount: token.price_cents,
        currency: 'gbp',
        quantity: 1
      }],
      success_url: package_url,
      cancel_url: package_url
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end
end
