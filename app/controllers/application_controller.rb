class ApplicationController < ActionController::Base
  protect_from_forgery

  private # сделаем этот метод закрытым для остальных и откытым только для контройлеров (тоесть он другие контройлеры смогут спокойно ним пользоватся)

  def current_cart
    Cart.find(session[:cart_id]) # метод получается с получения обьекта из обьекта Cart
  rescue ActiveRecord::RecordNotFound # если это не произойдет (а это не должно произойти)
    cart = Cart.create # пойдет созадние этого обьекта
    session[:cart_id] = cart.id # и из того что мы создали мы запишем это в сессию для пользователя
    cart # обратная связь
  end
  # мы обращаемя к сессии потому что можем это делать безпомощи JS window.storegelocal
end
