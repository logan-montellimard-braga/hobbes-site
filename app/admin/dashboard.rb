ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span "Bienvenue dans le panneau d'administration de Hobbes !"
    #     # small ""
    #   end
    # end

    columns do
      column do
        panel "Derniers membres" do
          ul do
            User.last(5).reverse.map do |user|
              t = user.name || user.email
              li link_to(t, admin_user_path(user))
            end
          end
        end
      end

      column do
        panel "Messages" do
          ul do
            ContactMessage.last(5).reverse.map do |m|
              li link_to(m.author.upcase + " : " + m.title.truncate(50) + " ( " + m.created_at.to_s + " )", admin_contact_message_path(m))
            end
          end
        end
      end
    end
  end # content
end
