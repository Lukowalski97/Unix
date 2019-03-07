require 'getoptlong'
require 'json'

def load_library
  file = File.read('test.json')
  librhashtmp = JSON.parse(file)

  @librhash = librhashtmp['library']
end

def print_libr
  for book in @librhash
    title = book['title']
    authors = book['authors']
    groups = book['groups']
    print 'Book title:', title, "\n"
    print 'Authors:', authors, "\n"
    print 'Groups', groups, "\n\n\n"
  end
end

def remove_title(title) #removes books which don't meet title given as argument
  i = 0
  while i < @librhash.length do
    book = @librhash[i]
   
    @librhash.delete_at(i) if book['title'] != title
    i += 1
        end

end

def remove_authors(authors) #removes books which don't meet authors given as arguments
    i = 0
    while i < @librhash.length do
      book = @librhash[i]
     
      toRem=true
      for authori in authors
        for authorj in book['authors']
            toRem=false if authorj==authori
            
       
        end
      end
    
    if toRem 
        @librhash.delete_at(i) 
        i-=1
    end 
      i += 1
     end

end

def remove_groups(groups) #removes books which don't meet groups given as arguments
    i = 0
    while i < @librhash.length do
      book = @librhash[i]
     
      toRem=true
      for groupi in groups
        for groupj in book['groups']
            toRem=false if groupi==groupj
            
        end
      end
   
    if toRem 
        @librhash.delete_at(i) 
        i-=1
    end 
      i += 1
     end

end

def parse_argument(argument)
    return argument.split("\\")
end
def print_help
  puts "Program mozna wlaczyc z nastepujacy opcjami:\n
        --help -h : wlacza pomoc,\n
        --library -l : wypisuje wszystkie ksiazki w bibliotece\n
        --title -t \"tytul1\\tytul2\\tytul3...\" :wypisuje ksiazki o podanych tytulach\n
        --author -a \"autor1\\autor2\\autor3...\" : wypisuje ksiazki podanych autorow\n
        --group -g \"grupa1\\grupa2\\grupa3...\" : wypisuje ksiazki nalezace do podanych grup\n
        Podane argumenty mozna laczyc, np -a \"autorzy\" -g\"grupy\" aby wypisac ksiazki spelniajace oba kryteria"
end

def options
  opts = GetoptLong.new(
    ['--help', '-h', GetoptLong::NO_ARGUMENT],
    ['--library', '-l', GetoptLong::NO_ARGUMENT],
    ['--title', '-t', GetoptLong::REQUIRED_ARGUMENT],
    ['--author', '-a', GetoptLong::REQUIRED_ARGUMENT],
    ['--group', '-g', GetoptLong::REQUIRED_ARGUMENT]
  )

  opts.each do |opt, arg|
    case opt
    when '--help'
      print_help
      exit
    when '--all'
      print_libr
      exit
    when '--title'
        remove_title(arg )
    when '--author'
        remove_authors(parse_argument(arg))
    when '--group'
        remove_groups(parse_argument(arg))
   end
  end

  print_libr
end

if $PROGRAM_NAME == __FILE__

    load_library
    options
end

