module ApplicationHelper
  def logo_link_to_root(klass = nil)
    link_to image_tag('hobbes_logo_only.png', :class => klass), root_path
  end

  def nav_link(link_text, link_path, method = :get)
    class_name = current_page?(link_path) ? 'active' : nil

    content_tag(:li) do
      link_to link_text, link_path, :class => class_name.to_s + " waves-effect", :method => method
    end
  end

  def nav_link_member
    if user_signed_in?
      return (nav_link "Profil", "#!") +
        (nav_link "Se déconnecter", destroy_user_session_path, :delete)
    else
      return (nav_link "Se connecter", new_user_session_path) +
        (nav_link "S'inscrire", new_user_registration_path)
    end
  end
end
