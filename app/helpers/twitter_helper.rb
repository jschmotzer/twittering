
def twitter_client
  client = Twitter::REST::Client.new do |config|
    config.consumer_key = 'kgjsxL7GK9ybHyYBj1ePqw'
    config.consumer_secret = '5UyvlcLXuIf3D3iMNlcW1xC4I1SqOsWmOGGhTMw0R0'
    config.access_token = '848488560-6XIxE6D8uRFvlfU8oVUzCx99oiQicy1TaHJzJhfG'
    config.access_token_secret = '468JBNNxaYpJyAsk88eILDth6mBnlyfo3odzhonAM'
  end
  client
end

def my_twitter
client = Twitter.configure do |config|
  config.consumer_key = ENV['CONSUMER_KEY']
  config.consumer_secret = ENV['CONSUMER_SECRET']
end


def prepare_access_token
  consumer = OAuth::Consumer.new('CONSUMER_KEY', 'CONSUMER_SECRET' ,
    { :site => "http://api.twitter.com",
      :scheme => :header
    })
  # now create the access token object from passed values
  token_hash = { :oauth_token => '848488560-jy6JJBF0jZKQrlu3oRCEPBmRCa65f0kjhgEePer4',
                 :oauth_token_secret => 'Pm0Mzv9yJa7Kf158O9D05gCNnEntVCzv24sPtfWl7g'
               }
  access_token = OAuth::AccessToken.from_hash(consumer, token_hash )
  return access_token
end
end
