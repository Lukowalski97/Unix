require File.expand_path 'dean_system.rb', File.dirname(__FILE__)

app = Rack::Auth::Digest::MD5.new(Sinatra::Application) do |username|
 
  {'john' => 'johnsecret'}[username]
end

app.realm = 'DeanerySystem'
app.opaque = 'secretkey'

use app
run MyApp