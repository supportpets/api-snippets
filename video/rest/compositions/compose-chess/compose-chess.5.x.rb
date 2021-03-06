# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'

# Find your credentials at twilio.com/console
api_key_sid = 'SKXXXX'
api_key_secret = 'your_api_key_secret'

@client = Twilio::REST::Client.new(api_key_sid, api_key_secret)

composition = @client.video.compositions.create(
  room_sid: 'RMXXXX',
  audio_sources: '*',
  video_layout: {
    chess_table: {
      x_pos: 10,
      y_pos: 0,
      width: 1260,
      height: 720,
      max_rows: 3,
      max_columns: 3,
      reuse: 'show_newest',
      cells_excluded: [1,3,5,7],
      video_sources: ['*']
    }
  },
  status_callback: 'http://my.server.org/callbacks',
  resolution: '1280x720',
  format: 'mp4'
)

puts composition.sid
