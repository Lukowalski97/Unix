# Calculates 'arg1' + 'arg2'.
#
# @param arg1 [Integer, Float, String, Rational, Complex]
#        the first component of the sum
# @param arg2 [Integer, Float, String, Rational, Complex]
#        the second component of the sum
# @return [Integer, Float, Rational, Complex]
#        sum of     two numbers

def sum(arg1, arg2)
  if arg1.class == 'string'.class
    narg1 = arg1
    arg1 = Float(arg1)

  

  end

  if arg2.class == 'string'.class
    narg2 = arg2
    arg2 = Float(arg2)

   
  end

  # print arg1, '   ', arg2, '  ', narg1, '   ', narg2

  arg1 + arg2
end

print 'suma= ', sum(4, 6), "\n" if __FILE__ == $PROGRAM_NAME
