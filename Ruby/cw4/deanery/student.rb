class Student
    attr_accessor :first_name
    attr_accessor :last_name
    attr_accessor :id
    attr_reader :scores
   
    @@next_id = 0

    def initialize(first_name, last_name,id=0)
      @first_name = first_name.capitalize
      @last_name = last_name.capitalize
      if(id==0)
        @id = @@next_id
        @@next_id += 1
      else
        @id=id
      end
      @scores = []
      
    end




    def add_score(score)
      @scores.push(score)
    end

    def mean
      sum=0
     @scores.each do |score| 
      sum += score.VAL.to_f
     end

     if(@scores.size==0)
      return 0
     else 
      return sum / @scores.size
     end
    end

    def scores_to_s
      arr="||"
      @scores.each do |score|
        arr= arr + score.VAL.to_s + " |"
      end
      arr=arr+ "|"

      if (@scores.length==0)
      arr=""
      end
      arr
    end


    def to_s
      scholar = if has_scholarship?
                  'ma stypendium'
                else
                  'nie ma stypendium'
                end
      @first_name.to_s + ' ' + @last_name.to_s + ' ' + scores_to_s + ' ' + scholar
    end

    def has_scholarship?
      mean >= 4.5
    end
  end

  class Full_time_student < Student

    def to_s
      scholar = if has_scholarship?
        'ma_stypendium'
      else
        'nie_ma_stypendium'
      end
      @first_name.to_s + ' ' + @last_name.to_s + ' ' + scores_to_s + ' ' + scholar + ' :stacjonarny'
    end

  end

  class Part_time_student < Student

    def to_s
      scholar = if has_scholarship?
        'ma_stypendium'
      else
        'nie_ma_stypendium'
      end

      @first_name.to_s + ' ' + @last_name.to_s + ' ' + scores_to_s + ' ' + scholar + ' :niestacjonarny'
    end

  end