class CreateStyles < ActiveRecord::Migration[6.0]
  def change
    create_table :styles do |t|
      t.string  :name,               null: false
      t.integer :type_id,            null: false
      t.integer :season_id,          null: false
      t.integer :height_id,          null: false
      t.integer :body_figure_id,     null: false
      t.integer :shipping_date_id,   null: false
      t.text    :description,        null: false
      t.integer :tops1_price,        null: false
      t.integer :tops2_price,        null: true
      t.integer :tops3_price,        null: true
      t.integer :tops4_price,        null: true
      t.integer :tops5_price,        null: true
      t.integer :bottoms1_price,     null: false
      t.integer :bottoms2_price,     null: true
      t.integer :shoes_price,        null: true
      t.integer :accessories1_price, null: true
      t.integer :accessories2_price, null: true
      t.integer :accessories3_price, null: true
      t.integer :total_price,        null: false
      t.references :supplier,        foreign_key: true
      t.timestamps
    end
  end
end