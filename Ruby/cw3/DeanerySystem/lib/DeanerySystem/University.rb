
  class University
    attr_accessor :size
    attr_reader :part_time
    attr_reader :full_time
    attr_reader :name 

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
      arr = ''

      @students.each_value do |student|
        arr = arr + student.first_name + ' ' + student.last_name + "\n"
      end

      arr
    end

  end
