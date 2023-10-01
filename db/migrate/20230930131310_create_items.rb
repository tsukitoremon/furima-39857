class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string     :item,                 null: false
      t.references :user,                 null: false, foreign_key: true
      t.integer    :price,                null: false
      t.text       :content,              null: false
      t.integer    :category_id,          null: false
      t.integer    :conditon_id,          null: false
      t.integer    :delivery_from,        null: false
      t.integer    :delivery_date,        null: false
      t.integer    :delivery_cost,        null: false

      t.timestamps
    end
  end
end
