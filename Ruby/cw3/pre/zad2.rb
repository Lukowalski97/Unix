
#Klasa testowa odbiorca
#@author Lukowalski97
#@attr [Array] tablica odbiorcy
class Odbiorca
    
    attr_accessor :tab

    @tab=[1,2,3]
#Konwertuje obiekt do [String]
# @return [String] oznaczajacy wywolanie tej metody, uzywany przy puts itp.
    def to_s
      "Wywołano metodę 'to_s()'"
    end
 #Konwertuje obiekt do [String]
# @return [String] oznaczajacy wywolanie tej metody, uzywane przy p itp.
    def inspect
      "Wywołano metodę 'inspect()'"
    end
#Tworzy nowy obiekt Odbiorca oraz inicjalizuje jego @tab 
# @param value [Array] tablica ktora ma zostac przypisana obiektowi
    def initialize(value)
      puts "Wywołano metodę 'initialize()'"
      @tab= value
    end
#Wyswietla komunikat metody instancyjnej oraz tablice
    def komunikat
      print "Wywołano metodę instancyjną 'komunikat()'  ", @tab,"\n"
    end
 #Wyswietla komunikat metody klsowej oraz tablice
    def self.komunikat
      print "Wywołano metodę klasową 'komunikat()'",@tab,"\n"
    end
#Tworzy tablice losowych liczb o dlugosci n w zakresie 0:m
# @param n [Integer] dlugosc tablicy
# @param m [Integer] max. mozliwa liczba do wylosowania
# @return [String] oznaczajacy wywolanie tej metody
    def utworz_tablice(n, m)
        tabtmp = n.times.map { rand(m)}
        tabtmp
    end
#Tworzy tablice losowych liczb o dlugosci n w zakresie 0:m, dodatkowo ustawi @tab obiektu na tablice losowa
# @param n [Integer] dlugosc tablicy
# @param m [Integer] max. mozliwa liczba do wylosowania
# @return [String] oznaczajacy wywolanie tej metody
    def utworz_tablice!(n, m)
        tabtmp = n.times.map { rand(m)}
        @tab=tabtmp
        tabtmp
    end
#Zwraca ilosc liczb parzystych w plikach o nazwach zawartych w @tab
# @return [Integer] ilosc liczb parzystych w plikach
    def ilosc_liczb_parzystych()
        am_of_even = @tab.map {|path| File.read(path)}.map{ |text| text.split() }.map{ |arr| arr.select {|num| (num.to_i % 2).zero?  }}.map {|arr| arr.length() }.sum()
         am_of_even
    end
  end

  #########################
  if __FILE__ == $PROGRAM_NAME
  value=[3,2,1]
  Odbiorca.komunikat
  Odbiorca.send(:komunikat) #Nawiasy są opcjonalne
  odbiorca = Odbiorca.new(value)
  odbiorca.komunikat
  odbiorca.send :komunikat
  puts odbiorca
  p odbiorca
   ##########################
  # Przykładowy test 'RSpec'
  ##########################
  RSpec.describe Odbiorca do
    before(:each) { @odbiorca = Odbiorca.new }
 
    it 'displays a message' do
      expect { @odbiorca.komunikat }.to output(/Wywołano metodę instancyjną/).to_stdout
    end
  end # RSpec.describe
  end
  #print (odbiorca.utworz_tablice(30,1000) )