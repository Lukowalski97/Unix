
class Mark 

    attr_reader :TYPE
    attr_reader :VAL
    attr_reader :teacher_id
    attr_reader :id

    

    def initialize(val,type,teacher_id=0,id=0 )
      if(type != "exam" && type !="partial" && type !="final")
        raise ArgumentError, "Wrong type of mark!! should be exam/partial/final"
      end
      @TYPE=type 
      @VAL= val
      @teacher_id=teacher_id
      @id=id
    end

    

    def to_s
      @VAL.to_s + '(' + @TYPE +')'
    end

  end
