class AddStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :status, :string, :default => 'guest'
    drop_column :users, :admin
  end
end
