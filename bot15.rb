require "twitter"

def get_friend (client, friend_ids)
 friend_ids.each_slice(100).to_a.inject([]) do |users, ids|
   users.concat(client.users(ids))
  end
end


client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "SlmKrSWUKWVA87YSLM1Wbh5o5"
  config.consumer_secret     = "c4v39QeRlzPvOat19G9HMdXB33TbOTg9hITqYxEN3ctzijGjS3"
  config.access_token        = "786474592550256640-scVZi3y8HoGOq63bRKFM6LK8hazvqBw"
  config.access_token_secret = "8N80oY7bwdRjat4ZtX9Qwj1Df8cZQ021LNfg4t1EhNDMB"
end

begin
friends_list = client.friend_ids("kurakore_index").to_a
#p followers_list #user object
rescue Twitter::Error::TooManyRequests => error
  sleep error.rate_limit.reset_in
  retry
end
friends = get_friend(client, friends_list)


friends.each{|friend|
  puts "＊＊＊＊＊ followers ＊＊＊＊＊"
  
begin
  f_friends_list = client.friend_ids(friend.screen_name).to_a

  p f_friends_list
rescue Twitter::Error::Unauthorized
rescue Twitter::Error::TooManyRequests => error
  sleep error.rate_limit.reset_in
  retry

p 'please wait for 15 minutes'
end
  #puts "＊＊＊＊＊ name ＊＊＊＊＊"
  #puts follower.name
  #puts "＊＊＊＊＊ description ＊＊＊＊＊"
  #puts follower.description
}
