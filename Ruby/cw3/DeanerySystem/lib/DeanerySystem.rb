require 'DeanerySystem/version'

# stypendium od 4.5
module DeanerySystem
  class Student
    attr_accessor :first_name
    attr_accessor :last_name
    attr_reader :id
    attr_reader :scores
   
    @@next_id = 0

    def initialize(first_name, last_name)
      @first_name = first_name.capitalize
      @last_name = last_name.capitalize
      @id = @@next_id
      @@next_id += 1
      @scores = []
      
    end

    def add_score(score)
      @scores.push(score.to_f)
    end

    def mean
      @scores.inject { |sum, el| sum + el }.to_f / @scores.size
    end

    def to_s
      scholar = if has_scholarship?
                  'ma_stypendium'
                else
                  'nie_ma_stypendium'
                end
      @first_name.to_s + ' ' + @last_name.to_s + ' ' + @scores.to_s + ' ' + scholar
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
      @first_name.to_s + ' ' + @last_name.to_s + ' ' + @scores.to_s + ' ' + scholar + ' stacjonarny'
    end

  end

  class Part_time_student < Student

    def to_s
      scholar = if has_scholarship?
        'ma_stypendium'
      else
        'nie_ma_stypendium'
      end

      @first_name.to_s + ' ' + @last_name.to_s + ' ' + @scores.to_s + ' ' + scholar + ' niestacjonarny'
    end

  end

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

  class University
    attr_accessor :size
    attr_reader :part_time
    attr_reader :full_time

    def initialize
      @size = 0
      @students = {}
      @part_time=0
      @full_time=0
    end

    def append(student)
      @part_time+=1 if student.class.equal? Part_time_student 
      @full_time+=1 if student.class.equal? Full_time_student 
      @students[student.id] = student
      @size += 1
    end

    def [](id)
      @students[id]
    end

    def to_s
      arr = ''

      @students.each_value do |student|
        arr = arr + student.first_name + ' ' + student.last_name + "\n"
      end

      arr
    end

  end

end
