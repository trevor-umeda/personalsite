module UsersHelper
  def admin?
    if current_user && current_user.email == "froggyp@gmail.com"
      return true
    else
      return false
    end
  end
end
