class ClientsController < ApplicationController

    def index


    end
  
    def show
    
      id = params[:id].to_i
      @client = Client.all.find(id)
  
    end
  
    def edit 
  
     
      @client = Client.find(params[:id])
    end
  
    def update 
       
     
      @client = Client.find(params[:id])

      if (@client.update(params.require(:client).permit(:name, :surname, :city, :mail) ))
        redirect_to clients_path
      else
        render "edit"
      end
  
      
    end
  
    def new 
       @client= Client.new
    end
  
    def create
  
      @client= Client.new( params.require(:client).permit(:name, :surname, :city, :mail) )

       if @client.save
      redirect_to clients_path
       else
        render "new"
       end
    end
  
    def destroy 
      id = params[:id].to_i
      Client.all.find(id).destroy
      redirect_to action: "index"
    end

end
