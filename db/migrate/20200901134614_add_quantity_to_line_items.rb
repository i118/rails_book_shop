class AddQuantityToLineItems < ActiveRecord::Migration[5.2]
  def change
    add_column :line_items, :quantity, :integer, default: 1 #
    # эта миграция будет добавлять в колонку в таблицу line_items строку значение в эта колонка со значение по умолчанию равно 1
  end
end
