class AddOauthedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :oauthed, :boolean, :null => true
  end
end
