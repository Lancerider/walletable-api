class AddCategoryToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :category, :integer
  end
end
