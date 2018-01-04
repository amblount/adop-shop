class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :status
      t.string :address
      t.references :user, foreign_key: true
      t.string :purchaser

      t.timestamps
    end
  end
end
