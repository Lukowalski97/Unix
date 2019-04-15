class WelcomesController < ApplicationController
  def index
    @quantity=3
    @message="Siemanko witam"
    @array=["Panstwa",16,'c',"Bardzo serdecznie"]
    @hash={"Nazywam" => "Sie Piotr PArafiniuk"}

    puts  @quantity 
    puts @message
    puts @array
    puts @hash

    console()
   

  end


end
