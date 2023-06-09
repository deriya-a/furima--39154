class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      ## Database authenticatable
      t.string     :name,               null: false
      t.string     :detail,             null: false
      t.integer    :category_id,        null: false
      t.integer    :condition_id,       null: false
      t.integer    :delivery_fee_id,    null: false
      t.integer    :region_id,          null: false
      t.integer    :delivery_within_id, null: false
      t.integer    :price ,             null: false
      t.references :user ,              null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
