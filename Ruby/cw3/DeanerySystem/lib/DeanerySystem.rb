require 'DeanerySystem/version'
require 'DeanerySystem/Mark'
require 'DeanerySystem/Student'
require 'DeanerySystem/University'
require 'getoptlong'

require 'sqlite3'


# stypendium od 4.5
module DeanerySystem
 

  def createUniversity(name){

  }
end

  def print_help
    help =  "Program mozna wlaczyc z nastepujacy opcjami:\n 
          --help -h : wlacza pomoc,\n
          --library -l : wypisuje wszystkie ksiazki w bibliotece\n
          --title -t \"tytul1\\tytul2\\tytul3...\" :wypisuje ksiazki o podanych tytulach\n
          --author -a \"autor1\\autor2\\autor3...\" : wypisuje ksiazki podanych autorow\n
          --group -g \"grupa1\\grupa2\\grupa3...\" : wypisuje ksiazki nalezace do podanych grup\n"
  end

  

 
end
