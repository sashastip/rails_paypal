class OrdersController < ApplicationController
  def express_checkout
    response = EXPRESS_GETEWAY.setup_purchase()
    redirect_to EXPRESS_GETEWAY.redirect_url_for(response.token)
  end

  def new
    @order = Order.new(:express_token => params[:token])
  end

  def create
    @order = @cart.build_order(order_params)
    @order.ip = request.remote_ip

    if @order.save
      if @order.purchase 
        redirect_to order_url(@order)
      else
        render action:  "failure"
      end
    else
      render action: "new"
    end
  end
end
