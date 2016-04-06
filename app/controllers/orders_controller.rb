class OrdersController < ApplicationController
  def express_checkout
    @violation = Violation.find([params[:violation_id]])
    @amount = @violation.amount.to_i
    response = EXPRESS_GETEWAY.setup_purchase(@amount,
                                              ip: request.remote_ip,
                                              return_url: violations_url,
                                              currency: "USD",
                                              allow_quest_checkout: true,
                                              items: [{notice_no: "Donate",
                                                        desctription: "Paying to"
                                                        @violation.notice_no,
                                                        quantity: "1",
                                                        amount: @amoutn}]
                                              )
    redirect_to EXPRESS_GETEWAY.redirect_url_for(response.token)
  end

  def new
    @order = Order.new(:express_token => params[:token])
    @violation = Violation.find(params[:violation_id])
  end
end
