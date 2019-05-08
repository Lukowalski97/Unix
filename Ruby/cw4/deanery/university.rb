

  class University
    attr_accessor :size
    attr_reader :part_time
    attr_reader :full_time
    attr_reader :name 
    attr_accessor :students


    class UniversityMapper < ROM::Mapper
      relation :universities
      register_as :entity
    
      model University
    
      attribute :size
      attribute :name

      attribute :part_time
      attribute :full_time
    end

    class CreateUniversity< ROM::Commands::Create[:sql]
      register_as :create
      relation :universities
      result :one
    end
      

   
    def initialize(name)
      @size = 0
      @students = {}
      @part_time=0
      @full_time=0
      @name = name
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
      arr = "Uniwersytet " + @name + "\n" + "Zaocznych: " + @part_time.to_s + 
      ", dziennych: " + @full_time.to_s + "\n"



      arr
    end

  end
