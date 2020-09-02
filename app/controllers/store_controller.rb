class StoreController < ApplicationController
  def index
    @products = Product.order(:title) # записывает Product.order(:title )
    @cart = current_cart # илициализируем глобальную переменную  в экшен store что бы могли отобразить  его в index
  end
end
