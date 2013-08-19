class Tweet < ActiveRecord::Base
  belongs_to :twitter_user

  validate :text, uniqueness: :true
end
