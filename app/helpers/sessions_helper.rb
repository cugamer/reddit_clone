module SessionsHelper
  
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # Method finds the current user using the session user_id.  This makes retreval
  # of the user possible on pages after login.  If there is already an @current_user
  # variable it's returned, else find_by finds the user ID and that's returned.
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  # Used to check if the user is logged in.  If the user has a valid session 
  # user id as returned by the current_user method above, the user is logged in.
  # Method returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end
end
