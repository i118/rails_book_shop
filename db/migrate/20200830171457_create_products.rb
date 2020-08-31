class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :price, precision: 8, scale: 2 # говорим нашей базе данных что у нас может быть максмум 2 знака после запятой и максимальное значение 8


      t.timestamps
    end
  end
end
