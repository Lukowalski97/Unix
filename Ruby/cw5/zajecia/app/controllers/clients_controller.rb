##
# Klasa Controllera do klienta
class ClientsController < ApplicationController
  
  ##
  #metoda sluzaca do autentykacji
  #nalezy podac imie i haslo
  # nie trzeba autentykowac strony index

  http_basic_authenticate_with name: "John", password: "Doe", except: :index

  ##
  # zmienna klasowa,tablica hashy, hash przechowuje dane o kliencie
  # atrybuty klienta to "imie" "nazwisko" "mail"  "miasto"
  # 

  @@clients =[{"imie"=>"Lukasz","nazwisko"=>"Kowalski","mail"=>"luk@gmail.com","miasto"=>"Krakow"},
    {"imie"=>"Jan","nazwisko"=>"Nowak","mail"=>"janek@gmail.com","miasto"=>"Warszawa"},
    {"imie"=>"Andrzej","nazwisko"=>"Testowy","mail"=>"stal@gmail.com","miasto"=>"Mielec"}]

    ##
    # metoda pomocnicza get_clients zwraca tablice @@clients przechowujacy klientow

  helper_method :get_clients 

  def get_clients
    @@clients
  end

  ##
  # metoda kontrolera do obslugi strony glownej

  def index


  end

  ## 
  #metoda kontrolera do obslugi wyswietlania pojedynczego klienta

  def show
  
    @id = params[:id].to_i
    @client = get_clients[@id]

  end

  ## 
  #metoda kontrolera do obslugi edycji pojdycznego klienta


  def edit 

    @id = params[:id].to_i
    @client = get_clients[@id]
  end

  ##
  #metoda kontrolera ktora wykonuje edycje klienta w tablicy, przekierowuje z pworotem do /index
  # wywolana dzieki formularzowi w widoku /edit

  def update 
    id= params[:id].to_i
    @client= get_clients[id]
    @client["imie"]=params[:name]
    @client["nazwisko"]=params[:surname]
    @client["mail"]=params[:mail]
    @client["miasto"]=params[:city]

    redirect_to action: "index"
  end
  
  ##
  # metoda kontrolera ktora  odpowiada za obsluge tworzenia nowego klienta 
  def new 
  end

  ##
  #metoda kontrolera ktora wykonuje stworzenie nowego klienta i dodanie do tablicy, przekierowuje z powrotem do /index
  #wywolana dzieki formularzowi w widoku /new

  def create

    client= {}
    client["imie"]=params[:name]
    client["nazwisko"]=params[:surname]
    client["mail"]=params[:mail]
    client["miasto"]=params[:city]
    get_clients.push(client)

    redirect_to action: "index"

  end

  ##
  #metoda ktora usuwa klienta z tablicy, usuwa klienta o indeksie przekazanym jako id w params
  

  def destroy 
    id = params[:id].to_i
    get_clients.delete_at(id)
    redirect_to action: "index"
  end
end
