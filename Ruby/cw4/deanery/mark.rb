
class Mark 

    attr_reader :TYPE
    attr_reader :VAL
    attr_reader :teacher_id
    attr_reader :id

    

    def initialize(val,type,teacher_id,id )
      if(type != "exam" && type !="partial" && type !="final")
        raise ArgumentError, "Wrong type of mark!! should be exam/partial/final"
      end
      @TYPE=type 
      @VAL= val
      @teacher_id=teacher_id
    end

    

    def to_s
      @VAL.to_s + '(' + @TYPE +')'
    end

  end
