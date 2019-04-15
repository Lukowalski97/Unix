
class MonthsController < ApplicationController
@@year=2019
@@pl_week_days={1=>"PN",2=>"WT",3=>"ŚR",4=>"CZ",5=>"PT",6=>"SO",7=>"ND"}
@@months_hash= {1=>"Styczeń", 2=>"Luty",3=>"Marzec",4=>"Kwiecień",5=>"Maj",6=>"Czerwiec",
    7=>"Lipiec",8=>"Sierpien",9=>"Wrzesień",10=>"Październik",11=>"Listopad",12=>"Grudzień"}


def index 
@months_hash= {1=>"Styczeń", 2=>"Luty",3=>"Marzec",4=>"Kwiecień",5=>"Maj",6=>"Czerwiec",
        7=>"Lipiec",8=>"Sierpien",9=>"Wrzesień",10=>"Październik",11=>"Listopad",12=>"Grudzień"}

end

def show

    @month_calendar= {}
    @month = params[:id]
   

    i=1 
    while (Date.valid_date?(@@year,@month.to_i,i) && i<=31 ) do

        tmp_date=Date.new(@@year,@month.to_i,i)

        if(tmp_date.monday?)
            @month_calendar[i]="PN"
        elsif(tmp_date.tuesday?)
            @month_calendar[i]="WT"
        elsif(tmp_date.wednesday?)
            @month_calendar[i]="ŚR"
        elsif(tmp_date.thursday?)
            @month_calendar[i]="CZ"
        elsif(tmp_date.friday?)
            @month_calendar[i]="PT"
        elsif(tmp_date.saturday?)
            @month_calendar[i]="SB"
        elsif(tmp_date.sunday?)
            @month_calendar[i]="ND"
        end
        i=i+1
    end
end

helper_method :months_hash
helper_method :check_day
helper_method :year
helper_method :pl_week_days

def months_hash
    @@months_hash
end

def check_day(i,j)
if ( @@pl_week_days[j]==@month_calendar[i])
    i+=i+1
    i.to_s
else
    "-"
end

end

def pl_week_days
    @@pl_week_days
end

def year
    @@year
end

end
