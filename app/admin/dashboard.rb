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
            User.last(5).map do |user|
              t = user.name || user.email
              li link_to(t, admin_user_path(user))
            end
          end
        end
      end

      column do
        panel "Info" do
          para "Welcome to ActiveAdmin."
        end
      end
    end
  end # content
end
