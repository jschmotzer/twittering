

get '/' do
  erb :index
end

get '/:username' do
  unless TwitterUser.find_by_username(params[:username])
    TwitterUser.create(username: params[:username])
  end

  @user = TwitterUser.find_by_username(params[:username])
  if @user.tweets_stale?
    @user.fetch_tweets!
  end

  @tweets = @user.tweets.last(10)
  
   if request.xhr?
    erb :show_tweets, layout: false
   else 
    erb :show_tweets
  end
  
end

post '/' do
  # redirect "/#{params[:user]}"
end

