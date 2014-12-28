module UsersHelper
  DEFAULT_STR = "Non renseigné"

  def authorized?
    current_user == @user
  end

  def name_or(str = DEFAULT_STR)
    @user.name.blank? ? str : @user.name
  end

  def location_or(str = DEFAULT_STR)
    @user.location.blank? ? str : @user.location
  end

  def website_or(str = DEFAULT_STR)
    @user.website.blank? ? str : @user.website
  end

  def get_domain(url)
    return url if url == "N/A"
    URI.parse(url).host
  end
end
