class Product < ApplicationRecord

  has_many :line_items # множество связей c товарными позициями
  # говорит о том что дальнейшее существование товарных позиций в cart нет если product удаленна
  has_many :orders, through: :line_items
  before_destroy :ensure_not_referenced_by_any_line_item # здесь мы  обьявляем метод
  # тоесть перед уничтожением будет вызыватся метод

  validates :title, :description, :price, presence: true # означает что значение должно быть обязательным
  validates :price, numericality: {greater_than_or_equal_to: 0.01}  # провера ценны на то что бы оно было положтельным
  validates :title, uniqueness: true # задаем проверку на уникальное значене :title
  # validates :image_url, format: {with: /\.(png|jpg)\Z/i} # будет допускать ток файлы .png \ .jpg

  private


  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      true
    else
      errors.add(:base, 'существует товарная позиция')
      false
    end
  end
end
