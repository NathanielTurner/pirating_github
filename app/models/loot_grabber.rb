require 'httparty'

class LootGrabber

  include ActionView::Helpers::DateHelper
  def initialize(user_name)
    @user_name = user_name
    @page_data = get_data

  end

  def get_data
    @page_data = HTTParty.get("https://api.github.com/users/#{@user_name}/repos?access_token=#{ENV['GITHUB_KEY']}")
  end

  def page
    @page_data
  end

end

#Today is <%= Time.now.strftime('%A') %>.
#require 'erb'
#
#def initialize(user_name)
#  @user_name = user_name
#  @data = get_data
#end
#
#def get_data
#  data = HTTParty.get("https://api.github.com/users/#{@user_name}/repos?access_token=#{ENV['GITHUB_KEY']}")
#end

#weekday = Time.now.strftime('%A')
#simple_template = "Today is <%= weekday %>."
#
#renderer = ERB.new(simple_template)
#puts output = renderer.result()
