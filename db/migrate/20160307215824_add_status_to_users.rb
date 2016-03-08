class AddStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :status, :string, :default => 'member'
    remove_column :users, :admin
  end
end
