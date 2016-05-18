class Order < ActiveRecord::Base
  #belongs_to :cart

  def paypal_url(return_url, cancel_return_url)
    values = {
      cmd: "_xclick",
      charset: 'utf-8',
      business: "trololo@ya.ru",
      upload: 1,
      return: return_url,
      cancel_return: cancel_return_url,
      item_number: 1,
      item_name: "name", 
      currency_code: 'USD',
      amount: 50
    }
    "https://www.sandbox.paypal.com/cgi-bin/webscr?#{values.to_query}"
  end
end
