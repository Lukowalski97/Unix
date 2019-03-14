
def parse_line(input)
    $tab = input.scan /\p{Alpha}+|\p{Digit}+/u
    for word in $tab 
        case word
        when /\p{Alpha}+$/
            print "Wyraz: ", word,"\n"
        when /\p{Digit}+$/
            print "Liczba: ", word,"\n"
        end
     end
end


if __FILE__ == $PROGRAM_NAME

while true
   input= gets
    if(input==nil)
        exit
    end
   parse_line(input)
    
end

end