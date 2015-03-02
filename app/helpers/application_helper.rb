module ApplicationHelper
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
