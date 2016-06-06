ActiveAdmin.register Template do

  index do
    id_column
    column :name do |f|
      f.name.force_encoding('UTF-8')
    end
    column :description do |f|
      f.description.force_encoding('UTF-8')
    end
    column :attachment do |f|
      link_to f.attachment_url.force_encoding('UTF-8')
    end
    actions
  end

  show do |tpl|
    attributes_table do
      row :name do
        tpl.name.force_encoding('UTF-8')
      end
      row :description do
        tpl.description.force_encoding('UTF-8')
      end
      row :created_at
      row :updated_at
      row :attachment do
        link_to tpl.attachment_url.force_encoding('UTF-8')
      end
      row :image do
        image_tag tpl.image_url.force_encoding('UTF-8'), class: 'responsive-img'
      end
    end
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
