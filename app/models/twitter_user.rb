class TwitterUser < ActiveRecord::Base
  has_many :tweets

  def tweets_stale?
    self.fetch_tweets! if self.tweets.length < 1
    most_recent_tweet = self.tweets.last
    return true if (Time.now - most_recent_tweet.updated_at) > (0 * 60)
    return false
  end

  def fetch_tweets!
    client = twitter_client
    recent_tweets = client.user_timeline(self.username,{count: 10})

    recent_tweets.each do |tweet|
      self.tweets.create(text: tweet.text)
    end
  end
end
