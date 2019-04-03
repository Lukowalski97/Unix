

class Calculator
    attr_accessor :options

    @options= []

    def add(num1, num2)
        num1 + num2
    end

    def subtract(minuend, subtrahend)
        minuend - subtrahend
    end

    def multiply(num1, num2)
        num1 * num2
    end

    def divide(dividend, divider)
        dividend/ divider
    end

    def reverse(word)

        outp=word.reverse!
        outp
    end

    def swapCase(word)
        outp=word.swapcase
        outp
    end

    def stringConvert(input)
        if (input.to_f.to_s == input.to_s || input.to_i.to_s == input.to_s)
            raise ArgumentError ,"Nie mozna uzywac funkcji tekstowych na liczbach"
        else
            input
        end 
    end

    def intConvert(input)
        if (input.include? ".") 
            raise ArgumentError ,"Nie mozna dodawac liczb zmiennoprzecinkowych!"
        end
        Integer(input) 
    end

    def print_help
        puts "Program mozna wlaczyc z nastepujacy opcjami:\n
              --help -h :wypisuje te tresc \n
              --add -a num1 num2: dodaje liczby num1 i num2 \n
              --subtract -s num1 num2  : odejmuje liczbe num2 od num1\n
              --multiply -m num1 num2 :mnozy liczby num1 i num2\n
              --divide -d num1 num2: dzieli liczbe num1 przez num2\n
              --reverse -r \"tresc\" : odwraca tresc \n
              --caseswap -c \"TreSc\": zamienia duze litery z malymi i na odwrot w tresci\n "
      end

    def parse_options()
       
        i=0
        while (i < @options.length)
            case @options[i]   
            when '--help', '-h'
              print_help
              exit
            when '--add', '-a'
                if (i+2 >= @options.length)
                    raise ArgumentError ,"za malo arguemntow!"
                end
                 num1= intConvert(@options[i+1])
                num2= intConvert(@options[i+2])
                i+=2
                 print( add(num1,num2),"\n")
            when '--subtract', "-s"
                if (i+2 >= @options.length)
                    raise ArgumentError, "za malo arguemntow!"
                end
                num1= intConvert(@options[i+1])
                num2= intConvert(@options[i+2])
                i+=2
                 print( subtract(num1,num2),"\n")
            when '--multiply','-m'
                if (i+2 >= @options.length)
                    raise ArgumentError ,"za malo arguemntow!"
                end
                 num1= intConvert(@options[i+1])
                num2= intConvert(@options[i+2])
                i+=2
                 print( multiply(num1,num2),"\n")
            when '--divide', '-d'
                if (i+2 >= @options.length)
                    raise ArgumentError ,"za malo arguemntow!"
                end
                 num1= intConvert(@options[i+1])
                num2= intConvert(@options[i+2])
                i+=2
                 print( divide(num1,num2),"\n")
            when '--reverse', '-r'
                if (i+1 >= @options.length)
                    raise ArgumentError ,"za malo arguemntow!"
                end
                word = @options[i+1].dup
                word= stringConvert(word)
                i+=1
                print( reverse(word),"\n")
            when '--caseswap', '-c'
                if (i+1 >= @options.length)
                    raise ArgumentError ,"za malo arguemntow!"
                end
                word = @options[i+1].dup
                word= stringConvert(word)
                i+=1
                print( swapCase(word),"\n")
           end
           i+=1
          end
    end
end


if __FILE__ == $PROGRAM_NAME
    kalkulator = Calculator.new()
    kalkulator.options= ARGV.dup
    kalkulator.parse_options
end
