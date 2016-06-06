class AddImageToTemplates < ActiveRecord::Migration
  def change
    add_column :templates, :image, :string
  end
end
