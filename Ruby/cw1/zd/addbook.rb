
require 'json'

def load_library
  file = File.read('test.json')
  librhashtmp = JSON.parse(file)

  @librhash = librhashtmp['library']
end

def parse_argument(argument)
    return argument.split("\\")
end

def add_book()
    title= ARGV[0]
    authors= parse_argument(ARGV[1])
    groups= parse_argument(ARGV[2])
  
    @librhash.concat( [{'title' => title, 'authors' => authors, 'groups' => groups }])
    new_libr = {'library'=> @librhash}
    js=new_libr.to_json
    File.open('test.json','w') { |file| file.write(js)}
end

load_library
add_book 

puts @librhash