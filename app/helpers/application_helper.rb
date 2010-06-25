# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title(page_title, show_title = true)
    @content_for_title = page_title.to_s
    @show_title = show_title
  end
  def show_title?
    @show_title
  end
  
  def tweet_url(status)
    "http://twitter.com/#{app_user.login}/statuses/#{status.tweet_id}"
  end
  
end
