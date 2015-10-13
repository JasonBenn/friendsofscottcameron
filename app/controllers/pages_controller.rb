class PagesController < ApplicationController
  def vision
    @active = 'vision'
  end

  def bio
    @active = 'bio'
  end

  def platform
    @active = 'platform'
  end

  def issues
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {})
    @issues = Dir.glob(File.join(Rails.root, 'app/assets/issues/*')).sort.map { |issue| markdown.render(File.read(issue)) }
    @active = 'issues'
  end

  def donate
    @active = 'donate'
  end

  def share
    @active = 'share'
  end
end
