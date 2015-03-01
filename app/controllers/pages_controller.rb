class PagesController < ApplicationController
  def bio
    # TODO: make this work, using code from Jasmine's tool on home computer.
    Pony.mail(:to => 'jasoncbenn@gmail.com', :from => 'bugs@friendsofscottcameron.com', :subject => 'Bug incident!', :body => 'Check friendsofscottcameron.com Heroku logs!')
    @active = 'bio'
  end

  def platform
    @active = 'platform'
  end

  def issues
    @active = 'issues'
  end

  def donate
    @active = 'donate'
  end

  def share
    @active = 'share'
  end
end
