class OrdersController < ApplicationController
  def express_checkout
    @order = Order.new
    if @order.save
      redirect_to @order.paypal_url(root_path, root_path)
    else
      render "show"
    end
  end

  def registration_params
    #params.require(:order).permit(:course_id, :full_name, :company, :email, :telephone)
  end
end
