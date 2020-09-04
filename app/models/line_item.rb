class LineItem < ApplicationRecord
  # belongs_to :order # определяем связь заказа с товарной позицией если позиця не найдена заказа не будет
  belongs_to :product # дочерняя связь с обьектами product
  belongs_to :cart # дочерняя свять с обьектами cart


  def total_price
    product.price * quantity
  end

end
