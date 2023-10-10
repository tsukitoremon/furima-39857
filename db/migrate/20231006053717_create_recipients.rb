class CreateRecipients < ActiveRecord::Migration[7.0]
  def change
    create_table :recipients do |t|
      t.integer    :post_code,                null: false
      t.string     :tel_number,               null: false
      t.integer    :delivery_from_id,         null: false
      t.string     :address_city,              null: false
      t.string     :address_street,            null: false
      t.string     :address_building
      t.references :order,                    null: false, foreign_key: true
      t.timestamps
    end
  end
end
