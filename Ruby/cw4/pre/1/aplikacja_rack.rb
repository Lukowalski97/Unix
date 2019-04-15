require 'pp' if RUBY_VERSION < '2.5'
################################
# Klasa z treścią aplikacji Rack
################################
class HelloWorld


  def initialize(name,surname)
    @name=name
    @surname=surname
  end
  # Metoda będąca 'sercem' aplikacji Rack
  #
  # @param env [Hash] treść żądania
  # @return [Array] odpowiedź dla przeglądarki WWW
  def call(env)
    #############################################
    # Utwórz obiekt reprezentujący odpowiedź HTTP
    #############################################
    response = Rack::Response.new
 
    ##############################################
    # Obsługa żądania pobrania pliku 'favicon.ico'
    ##############################################
    if env['REQUEST_URI'] =~ /favicon.ico/
      ########################
      # Generowanie odpowiedzi
      ########################
      response.status = Rack::Utils::SYMBOL_TO_STATUS_CODE[:not_found] # Ustaw kod statusu (odpowiedzi) na 404
      response.header['Content-Type'] = 'text/plain'                   # Umieść, w nagłówku odpowiedzi, informację, że wysyłane dane będą zwykłym tekstem
      response.write 'The requested resource does not exist'           # Umieść, w ciele odpowiedzi, podany tekst
      response.write "\n"                                              # Metodę 'write()' można uruchamiać wielokrotnie, ... dopóki nie wywołasz 'finish()'
      return response.finish                                           # Nagłówki oraz ciało odpowiedzi są gotowe - wyślij odpowiedź
    end
 
    # To co powyżej, można zapisać następująco:
    # return [404, {'Content-Type' => 'text/plain'}, ["The requested resource does not exist\n"]] if env['REQUEST_URI'] =~ /favicon.ico/
 
    ##########################################################
    # Obsługa żądania pobrania plików innych niż 'favicon.ico'
    ##########################################################
 
    puts '*' * 25
    puts "* \e[31mZawartość hasza 'env'\e[0m *"
    puts '*' * 25
 
    ###########################################################################
    # Wyświetl, w konsoli, surową treść żądania otrzymanego od przeglądarki WWW
    ###########################################################################
    pp env.dup.tap { |key| key.delete('puma.config') }                        
    ###########################################################
 
    ###########################################################################
    # Utwórz, w oparciu o tę (surową) treść, obiekt reprezentujący żądanie HTTP
    ###########################################################################
    request = Rack::Request.new(env)
    ################################
 
    puts '*' * 36
    puts "* \e[31mZawartość hasza 'request.params'\e[0m *"
    puts '*' * 36
 
    ##########################################
    # Wypisz dane pochodzące z formularza HTML
    ##########################################
    p request.params
    ################
    name = request.params["Imie"]
    surname = request.params["Nazwisko"]
    puts '*' * 80
 
    ########################
    # Generowanie odpowiedzi
    ########################
    response.status = Rack::Utils::SYMBOL_TO_STATUS_CODE[:ok] # Ustaw kod statusu na 200. Zbędne, gdyż 200, to wartość domyślna własności 'status'; potrzebne do celów edukacyjnych ;-)
    response.header['Content-Type'] = 'text/html'             # Umieść, w nagłówku odpowiedzi, informację, że wysyłane dane będą HTML-em
    response.write %Q(<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Aplikacja Rack</title>
  </head>
  <body>
    <h1>Aplikacja Rack</h1>
    )
    if(name==@name && surname==@surname)
      response.write name.upcase + ' ' + surname.upcase
    else
      response.write "BRAK DOSTEPU"
    end
    
    response.write %Q(</body>
  
</html>)            # Umieść, w ciele odpowiedzi, podany dokument HTML
    response.finish # Wyślij odpowiedź
  end # def call(env)
end   # class HelloWorld