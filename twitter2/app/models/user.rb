class User < ActiveRecord::Base
  has_many :tweets

  def tweet(body)
    tweet = tweets.create!(:body => body)
    TweetWorker.perform_async(tweet.id)
  end

  def tweet_in(num, body)
    tweet = tweets.create!(:body => body)
    TweetWorker.perform_in(num.minutes, tweet.id)
  end

end
