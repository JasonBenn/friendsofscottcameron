class PagesController < ApplicationController
  def bio
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
