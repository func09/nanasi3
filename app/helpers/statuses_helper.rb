module StatusesHelper
  
  def tweet_extention(status)
    "http://#{APP_CONFIG[:domain]}/#{status.uuid} #{APP_CONFIG[:twitter]['hashtag']}"
  end
  
end
