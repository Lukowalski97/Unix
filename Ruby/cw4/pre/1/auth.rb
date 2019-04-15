require './aplikacja_rack'
require './blank'

class Auth

def initialize(app, arr)
 @imie= arr[0]
@nazwisko=arr[1]
@app= app
end

def call(env)
    
    request = Rack::Request.new(env)
    name = request.params["Imie"]
    surname = request.params["Nazwisko"]

    if(name== @imie && surname == @nazwisko)

        use HelloWorld.new

    else 

        use Blank.new
    end

end

end