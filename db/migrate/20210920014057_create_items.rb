class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :explanatory_text
      t.integer :category_id
      t.integer :status_id
      t.integer :price
      t.integer :shipping_fee_id
      t.integer :area_id
      t.integer :delivery_days_id
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
