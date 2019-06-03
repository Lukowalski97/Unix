

require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader' if development?
require 'rom-repository'
require 'rom'


#initialize:

rom= ROM.container(:sql, 'sqlite://db-file.db') do |config|
  config.relation(:students) do 
    schema(infer: true)
  
  end

  config.relation(:universities) do 
    schema(infer: true)
   
  end

  config.relation(:marks) do 
    schema(infer: true)
    
  end

  config.relation(:teachers) do 
    schema(infer: true)
  
  end
  load 'mark.rb'
  load 'student.rb'
  load 'university.rb'
  load 'teacher.rb'

end

def get_univer_students(university,all_students)
  

  outp = []
  all_students.each do |student|
    if (student[:university_name]==university)
      outp.push(student)
      
  end
  
end
return outp
end

def get_student_marks(student_id,all_marks)

  outp=[]
  all_marks.each do |mark|
    if(mark[:student_id]==student_id)
      outp.push(mark)
  end
end
return outp
end

def authenticate_student(student)

  if($logged_user !=nil && ($logged_user["isteacher"] || ($logged_user["id"]!=nil &&$logged_user["id"]== student.id ) ) )
    return true 
  else 
    return false
  end

end

def authenticate_mark(mark)

  if($logged_user !=nil && ($logged_user["isteacher"] && $logged_user["id"]==mark.teacher_id  ) )
    return true 
  else 
    return false
  end

end

def parse_university()

  @universities= {}
  @universities_hash.each do |hash|

    tmp = University.new(hash[:name])
    students= get_univer_students(tmp.name,@students_hash)
    students.each do |tmp_student_hash|
      if(tmp_student_hash[:is_full]==1)
        tmp_student= Full_time_student.new(tmp_student_hash[:first_name],tmp_student_hash[:last_name],tmp_student_hash[:id])
      else
        tmp_student= Part_time_student.new(tmp_student_hash[:first_name],tmp_student_hash[:last_name],tmp_student_hash[:id])
      end

      marks= get_student_marks(tmp_student.id,@marks_hash)

      marks.each do |mark|
        tmp_mark = Mark.new(mark[:val].to_f,mark[:type],mark[:teacher_id],mark[:id].to_i)
        tmp_student.add_score(tmp_mark)
      end

      tmp.append(tmp_student)
    end
    @universities[tmp.name]=tmp
  end
  

end

def prepare(rom)
  @universities_hash = rom.relations[:universities]
  @students_hash = rom.relations[:students]
  @marks_hash = rom.relations[:marks]
    parse_university
end




#init_End


$wrong_logged=false

def logged?
  $logged_user!=nil
end

def login (login,passwd,rom)
  students_hash = rom.relations[:students]
  teachers_hash = rom.relations[:teachers]

  students_hash.each do |student| 
    if (student[:id].to_s==passwd.to_s && student[:first_name]==login ) 
   
      $logged_user={"isteacher"=>false,"id"=>passwd.to_i}
      
      return true
      
    end
   
  end

  teachers_hash.each do |teacher| 
    if (teacher[:id].to_s==passwd.to_s && teacher[:name]==login ) 
      $logged_user={"isteacher"=>true,"id"=>passwd.to_i}
     
      return true
    end
    
  end
  return false
end

post '/universities/logout' do
  $logged_user=nil
  redirect '/universities'
end

get '/' do

  redirect '/universities'
end

post '/universities' do
if (!login(params['login'].strip,params['passwd'].strip,rom))

$wrong_logged=true
end

redirect '/universities'
end

get '/universities' do 
 prepare(rom)

  erb :index               # Renderuj widok 'index'

end

get '/universities/:univer_name' do 

  prepare(rom)
    
  university= @universities[params['univer_name']]
  if(university == nil)
    redirect '/universities/error'
  end
  @students=university.students
  

  

erb :univer
end

get '/universities/error' do

  erb :univer_error
end

get '/universities/students/error' do

  erb :univer_students_error
end

get '/universities/:univer_name/:student_id' do 

  prepare(rom)
    
  university= @universities[params['univer_name']]
  if(university == nil)
    redirect '/universities/error'
  end

  students=university.students
  
  @student = students[params['student_id'].to_i]
 

  if(@student ==nil || !authenticate_student(@student))
    redirect "/universities/students/error"
  end
  

erb :univer_student
end

get '/universities/students/marks/error' do 


  erb :marks_error
end

get '/universities/:univer_name/:student_id/:mark_id' do 

  prepare(rom)

  university= @universities[params['univer_name']]
  if(university == nil)
    redirect '/universities/error'
  end

  students=university.students
  
  student = students[params['student_id'].to_i]

  if(student ==nil || !authenticate_student(student))
    redirect "/universities/students/error"
  end

  @mark =nil
  student.scores.each do |score|
    if(score.id==params['mark_id'].to_i)
      @mark=score
    end

  end

  if(@mark ==nil || !authenticate_mark(@mark))
    redirect "/universities/students/marks/error"
  end

  $mark_id=@mark.id
  $student_id=student.id
  $univer_name= university.name
  erb :univer_mark

end

post '/universities/marks' do

  prepare(rom)

  university= @universities[$univer_name]
  students=university.students
  student = students[$student_id]
  student.scores.each do |score|
    if(score.id ==$mark_id)
      
      score= Mark.new(params['value'].to_f,params['type'].to_s,score.teacher_id,score.id)
      

      @marks_hash.by_pk($mark_id).changeset(:update, type: params['type'].to_s, val: params['value'].to_f).commit


    end
  end
redirect "/universities"
end