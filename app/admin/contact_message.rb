ActiveAdmin.register ContactMessage do

  show do |ad|
    attributes_table do
      row :title
      row :author
      row :text
      row :created_at
    end
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  permit_params do
    permitted = [:title, :author, :text]
    permitted
  end
end
