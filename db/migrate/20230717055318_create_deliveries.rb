class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string     :post_code, null: false
      t.integer    :region_id, null: false
      t.string     :address1,  null: false
      t.string     :address2,  null: false
      t.string     :address3
      t.string     :phone,     null: false
      t.references :record,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
