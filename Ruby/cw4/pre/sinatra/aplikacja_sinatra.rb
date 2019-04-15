require 'sinatra'
require 'sinatra/reloader' if development?
 
use Rack::Auth::Basic, "auth" do |username, password| 
  username == 'Lukasz' && password == 'bar'
end

get '/' do
  @name_given = params["Imie"]
  @surname_given = params["Nazwisko"]
  @welcome = 'Hello World' # Dane dla widoku
  erb :index               # Renderuj widok 'index'

end
__END__



 
@@ layout
<!DOCTYPE html>
<meta charset="UTF-8">
<html>
  <head>
    <title>Aplikacja Sinatra</title>
  </head>
  <body>
    <h1>Aplikacja Sinatra</h1>
    <%= yield %>
  </body>
</html>
 
@@ index
<%= @welcome %>!