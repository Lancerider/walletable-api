class AddInitialBalanceToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :initial_balance, :integer, default: 0
  end
end
