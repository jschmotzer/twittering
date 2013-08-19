

get '/' do
  erb :index
end

get '/:username' do
  client = twitter_client
  @tweets = client.user_timeline(params[:username],{count: 10})

  erb :show_tweets
end

post '/' do
  redirect "/#{params[:user]}"
end

