class NotNullName < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :name, :string
    add_column :users, :name, :string, null: false
    remove_column :users, :reset_password_sent_at
    remove_column :users, :reset_password_token
  end
end
