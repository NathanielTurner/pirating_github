require 'httparty'
require 'action_view'
class LootGrabber

  include ActionView::Helpers::DateHelper
  def initialize(user_name)
    @user_name = user_name
    @repo_data = get_data
    @user_data = get_user
  end

  def get_data
    @repo_data = HTTParty.get("https://api.github.com/users/#{@user_name}/repos?access_token=#{ENV['GITHUB_KEY']}")
  end

  def get_user
    @user_data = HTTParty.get("https://api.github.com/users/#{@user_name}/access_token=#{ENV['GITHUB_KEY']}")
  end

  def get_name
    @user_data.login
  end

  def this_name
    @repo_data[0]["full_name"]
  end

  def get_picture
    @repo_data[0]["owner"]["avatar_url"]
  end



  def get_repo_update(x)
    t = @repo_data[x]["updated_at"]
    past = DateTime.strptime(t, '%Y-%m-%dT%H:%M:%S%z')
    present = DateTime.now
    distance_of_time_in_words(past, present)
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
