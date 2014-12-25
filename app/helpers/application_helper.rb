module ApplicationHelper
  def logo_link_to_root(klass = nil)
    link_to image_tag('hobbes_logo_only.png', :class => klass), root_path
  end

  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : nil

    content_tag(:li) do
      link_to link_text, link_path, :class => class_name
    end
  end

  def dropdown_button(link_text, link_path, classes, children_paths)
    klass = nil

    children_paths.each do |p|
      if current_page?(p)
        klass = 'active'
        break
      end
    end

    content_tag(:li) do
      link_to link_text, link_path, :class => klass.to_s + " " + classes, :'data-activates' => 'main_drop'
    end
  end
end
