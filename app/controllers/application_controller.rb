class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def email(options)
    defaults = {
      to: 'jasoncbenn@gmail.com', 
      from: 'bugs@friendsofscottcameron.com',
      subject: 'Notification: friendsofscottcameron',
      body: 'Check friendsofscottcameron.com Heroku logs!'
    }

    Pony.mail(defaults.merge(options))
  end
end
