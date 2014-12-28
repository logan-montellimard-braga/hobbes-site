module UsersHelper
  def authorized?
    current_user == @user
  end
end
