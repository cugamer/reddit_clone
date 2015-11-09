module SessionsHelper
  
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # Calls the remember method on the input user object to generate a new token
  # and save the token as a hash in the db.  Creates two new cookies, one signed
  # which holds the user.id, the other which holds the generated token.
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
  
  # Method finds the current user using the session user_id.  This makes retreval
  # of the user possible on pages after login.  If there is already an @current_user
  # variable it's returned, else find_by finds the user ID and that's returned.
  # The current_user variable is a "magic" Rails variable, don't need to worry
  # about where it comes from or how it's managed at this level.
  
  # Reworked to allow for persistant sessions through browser close.  The conditional
  # looks for a session cookie to start and proceeds if it finds one.  If no session
  # cookie, then it looks for a cookie....cookie and gets the user_id from that, which
  # is used to create a user object.  This object is then sent to log_in (to create
  # the session, then the @ current_user variable is set to the user as well.)
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: session[:user_id])
    elsif(user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end
  
  # Used to check if the user is logged in.  If the user has a valid session 
  # user id as returned by the current_user method above, the user is logged in.
  # Method returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end
  
  # Removes the user id from session and sets the @current_user variable to nil.
  # This destroys the session.
  
  # Added call to forget taking the current_user variable.
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
  
  # Calls user.forget (sets remember_digest to nil in db) and deletes cookies.
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
end
