class WelcomesController < ApplicationController
  def index
    @quantity=3
    @message=" witam"
    @array=["Panstwa",16,'c',"Bardzo serdecznie"]
    @hash={"kluczyk" => "Wartosc"}

    puts  @quantity 
    puts @message
    puts @array
    puts @hash

    #console()
   

  end


end
