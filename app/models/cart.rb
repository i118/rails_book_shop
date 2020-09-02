class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy # множество связей c товарными позициями
  # говорит о том что дальнейшее существование товарных позиций в cart нет если корзина удаленна

  def add_product(product_id)
    current_item = line_items.find_by_product_id(product_id)  # рельсы настолько мощные что читают первые 2 слова он опредляет первым словам
    # что нужно искать по индификатору продукта и даем ему параметр id продукта
    if current_item # если значение уже меется то он будет к ниму добавлять 1
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id) # если этого значения нет то он будет создавать это значение
    end
    current_item
  end
  def total_price
    line_items.to_a.sum do
    |item| item.total_price
    end
  end
end
