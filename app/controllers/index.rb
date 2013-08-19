

get '/' do
  erb :index
end

get '/:username' do
  unless TwitterUser.find_by_username(params[:username])
    TwitterUser.create(username: params[:username])
  end

  @user = TwitterUser.find_by_username(params[:username])
  

  @tweets = @user.tweets.last(10)

  if @user.tweets_stale?
    @tweets << 0
  else
    @tweets << 1
  end
  
   if request.xhr?
    erb :show_tweets, layout: false
   else 
    erb :show_tweets
  end
  
end

post '/' do
  # redirect "/#{params[:user]}"
end

post '/secondtry/:username' do
  user = TwitterUser.find_by_username(params[:username])
  user.fetch_tweets!

  puts user.username
  puts user.tweets



  @tweets = user.tweets.limit(10) 
  @tweets << 5

  puts @tweets

  if request.xhr?
    erb :show_tweets, layout: false
  end
end

