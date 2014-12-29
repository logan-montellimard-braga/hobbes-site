class RegistrationsController < Devise::RegistrationsController

  protected

  def after_update_path_for(resource)
    user_path(resource)
  end

  def update_resource(resource, params)
    if params[:password].blank?
      params.delete("password")
      params.delete("password_confirmation")
    end
    params.delete("current_password")
    resource.update_attributes(params)
    # if current_user.oauthed
    #   if params[:password].blank?
    #     params.delete("password")
    #     params.delete("password_confirmation")
    #   end
    #   params.delete("current_password")
    #   resource.update_attributes(params)
    # else
    #   resource.update_with_password(params)
    # end
  end
end
