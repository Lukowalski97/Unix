require 'sinatra'

get '/' do
  

  erb :form
end

post '/save_image' do
  @filename = params[:file][:filename]
  file = params[:file][:tempfile]
  @name = params[:name]
  @surname = params[:surname]

  File.open("./public/#{@filename}", 'wb') do |f|
    f.write(file.read)

  end

  open('list', 'a') do |f|
    f << @name + ';' + @surname + ';' + @filename + "\n"
  end

  erb :form
end
