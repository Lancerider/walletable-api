class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.datetime :date
      t.string :payee
      t.string :category
      t.string :description
      t.decimal :amount

      t.timestamps
    end
  end
end
