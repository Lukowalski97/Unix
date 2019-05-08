# Nazwa gema: 'deanery'
ENV['RACK_ENV'] = 'test'
load 'dean_system.rb'
require 'rack/test'

RSpec.describe Student do
    before(:each) do
      @student1 = Student.new('JOANNA', 'KOWALSKA')
      @mark1= Mark.new(4.0,"partial")
      @mark2=Mark.new(5.0,"partial")
      @student1.add_score(@mark1)
      @student1.add_score(@mark2)
      ######################
      @student2 = Student.new('Jerzy', 'Nowak')
      @student2.add_score(@mark1)
      @student2.add_score(@mark1)
    end
   
    it 'has capitalized name' do
      expect(@student1.first_name).to eq('Joanna')
      expect(@student1.last_name).to eq('Kowalska')
    end
   
    it 'has unique id' do
      expect(@student1.id).not_to eq @student2.id
    end
  
   
    it 'can displays full information' do
      expect { puts @student1 }.to output("Joanna Kowalska ||4.0 |5.0 || ma stypendium\n").to_stdout
      expect { puts @student2 }.to output("Jerzy Nowak ||4.0 |4.0 || nie ma stypendium\n").to_stdout
    end
   
    it 'can modify personal data' do
      @student1.first_name = 'Joanna Urszula'
      @student1.last_name = 'Nowak'
      expect(@student1.first_name).to eq 'Joanna Urszula'
      expect(@student1.last_name).to eq 'Nowak'
    end
   
   
   
    it 'correctly calculates the scholarship possession' do
      expect(@student1.has_scholarship?).to be_truthy
      expect(@student2.has_scholarship?).to be_falsy
    end
  end
   
  RSpec.describe University do
    before(:each) do
      @university = University.new("AGH")
      @student1 = Student.new('JOANNA', 'KOWALSKA')
      @student2 = Student.new('Jerzy', 'Nowak')
    end
   
    it 'is empty at the beginning' do
      expect(@university.size).to eq(0)
    end
   
    it 'properly adds students' do
      @university.append(@student1)
      @university.append(@student2)
      expect(@university.size).to eq(2)
    end
   
    it 'properly implements the "[]" method' do
      @university.append(@student1)
      @university.append(@student2)
     
      expect(@university[@student1.id].first_name).to eq(@student1.first_name)
  
      expect(@university[@student2.id].first_name).to eq(@student2.first_name)
    end
   
   
  
    it 'properly monitor amount of student types' do
      studentp1 = Part_time_student.new('JOANNA', 'KOWALSKA')
      studentp2 = Part_time_student.new('JOANNA', 'KOWALSKA')
  
      studentf1 = Full_time_student.new('JOANNA', 'KOWALSKA')
  
      @university.append(studentf1)
      @university.append(studentp1)
      @university.append(studentp2)
  
      expect(@university.full_time).to eq (1)
      expect(@university.part_time).to eq (2)
  
    end
  
  end
  
  RSpec.describe Mark do
    before(:each) do
      @marke= Mark.new(3.0,"exam")
      @markp=Mark.new(5.0,"partial")
      @markf=Mark.new(4.0,"final")
  
    end
  
    it 'properly displays mark info' do 
      expect {puts @marke}.to output("3.0(exam)\n").to_stdout
      expect {puts @markf}.to output("4.0(final)\n").to_stdout
  
      expect {puts @markp}.to output("5.0(partial)\n").to_stdout
  
      
    end
  
  
  
  end
  
  RSpec.describe Full_time_student do
    before(:each) do
      @student1 = Full_time_student.new('JOANNA', 'KOWALSKA')
      @student1.add_score(4.0)
      @student1.add_score(5)
    end
  
   
  
  
  end
  
  RSpec.describe Part_time_student do
    before(:each) do
      @student1 =Part_time_student.new('JOANNA', 'KOWALSKA')
      @student1.add_score(4.0)
      @student1.add_score(5)
    end
  
    
  
  end