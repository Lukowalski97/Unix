class Mark 

    attr_reader :TYPE
    attr_reader :VAL


    def initialize(val,type)
      if(type != "exam" && type !="partial" && type !="final")
        raise ArgumentError, "Wrong type of mark!! should be exam/partial/final"
      end
      @TYPE=type 
      @VAL= val
    end

    def to_s
      @VAL.to_s + '(' + @TYPE +')'
    end

  end
