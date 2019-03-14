require "rdoc"
def counter(line)
    
    tab = line.split(" ")
    
    for word in tab
      
       
        if $count_tab[word.length] == nil 
            $count_tab[word.length] = 1
        
        else 
            $count_tab[word.length]+=1
        end
    end
end



def write_output()
    puts "Długośc napisu    Krotność wystąpienia"
    i=0
    while i< $count_tab.length
        if($count_tab[i]!=nil)
            print i ,'               ', $count_tab[i],"\n"
        end
            i+=1
    end
end


if __FILE__ == $PROGRAM_NAME
    if ARGV[0]=="-h"
        h = RDoc::Markup::ToHtml.new(RDoc::Options.new)

        DATA.each_line do |str|
            puts h.convert(str)
        end
    else
        $count_tab=[]
        while(true)
            inp= gets
           if(inp!= nil)
               counter(inp)
          else
              write_output
              exit#
           end
        end
    end
    #at_exit {write_output}
end

__END__

Program odczytuje 