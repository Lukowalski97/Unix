def am_of_even 
     ARGV.map {|path| File.read(path)}.map{ |text| text.split() }.map { |arr| arr.select {|num| (num.to_i % 2).zero?  }}.map {|arr| arr.length() }.sum()
end

if $PROGRAM_NAME == __FILE__
    print  (am_of_even()), "\n"
end