if ARGV[0]==nil 
    exit
else 
    file= File.open(ARGV[0])
end
while (line = file.gets)
    tab = line.split(' ')
    puts tab
end