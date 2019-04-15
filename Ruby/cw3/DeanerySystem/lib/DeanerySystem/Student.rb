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