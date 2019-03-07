
$maintab = {}
$maintab.default = nil

def add_person(tab)
 
  #ind = tab[0] + tab[1]
  if $maintab[tab[0]].nil?
    $maintab[tab[0]] = {}
    $maintab[tab[0]].default = nil
  end

  if !$maintab[tab[0]].nil? && !$maintab[tab[0]][tab[1]].nil?
   # print 'Osoba ', tab[1], 'jest juz w ', tab[0], "\n"
    raise ArgumentError, 'duplikat'
  elsif($maintab [tab[0]].length > 1)
    #print 'W jedynm przedmiocie mogą być tylko 2 osoby ', "\n"
    raise ArgumentError, 'przepelnienie'
  else
    
    $maintab[tab[0]][tab[1]] = []
    #print 'Dodano osobe ', tab[1], "\n"
  end
end

def add_mark(tab)
  if($maintab[tab[0]].nil? || $maintab[tab[0]][tab[1]].nil?)
     add_person(tab[0,2])
    
     
  end
 
  
  $maintab[tab[0]][tab[1]].append(tab[2])
  
  
end

def write
  $maintab.each do |subj,students|
  
    write_subject(subj)
  end
end

def write_subject(subj)
 
 print subj, ":\n"
  $maintab[subj].each do |pers,marks|
    print pers
    print marks, "\n"
  end
end

def parse_option(option_tab)
  $maintab = {}
  option_tab.each do |opt|
    tab = opt.split(':')
    case tab.length
    when 1
      write if tab[0] == '--wypisz'
    when 2
      if tab[0] == '--wypisz'
        write_subject(tab[1])
      else

     
        add_person(tab)
     end
    when 3
      add_mark(tab)
    end
  end
end

# parse_option ARGV

if $PROGRAM_NAME == __FILE__

  #add_person %w[Ruby Andrzej]
  #add_person %w[Ruby Andrzej]
  #add_person %w[Ruby Adam]
 # add_person %w[Ruby Michal]

 add_mark %w[Ruby Andrzej 5.0]
 add_mark %w[Ruby Andrzej 6.0]
 add_mark %w[Ruby Pawel 3.0]
 add_mark %w[JS Adam 1.5 ]
  write


end
