# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'

# Find your credentials at twilio.com/console
api_key_sid = 'SKXXXX'
api_key_secret = 'your_api_key_secret'

@client = Twilio::REST::Client.new(api_key_sid, api_key_secret)

composition = @client.video.compositions.create(
  room_sid: 'RMXXXX',
  audio_sources: 'PAXXXX',
  video_layout: {
    single: {
      video_sources: ['PAXXXX']
    }
  },
  status_callback: 'http://my.server.org/callbacks',
  format: 'mp4'
)

puts composition.sid
