class RemoveCategoryFromTransaction < ActiveRecord::Migration[5.2]
  def change
    remove_column :transactions, :category, :string
  end
end
