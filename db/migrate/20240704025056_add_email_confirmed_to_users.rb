class AddEmailConfirmedToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :email_confirmed, :boolean
    add_column :users, :confirmation_token, :string
  end
end
