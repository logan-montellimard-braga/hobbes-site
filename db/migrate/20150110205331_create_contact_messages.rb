class CreateContactMessages < ActiveRecord::Migration
  def change
    create_table :contact_messages do |t|
      t.string :author
      t.string :title
      t.string :text

      t.timestamps
    end
  end
end
