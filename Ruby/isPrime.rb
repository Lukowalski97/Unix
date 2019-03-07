def isPrime?(number)
  return false if number.class == Float.class
  return false if number == 0 || number == 1
  return true if number == 2
  return false if number.even?
  i = 3
  while i * i <= number
    return false if number % i == 0
    i += 2
  end
  true
end

for number in ARGV
  puts number if ((number.to_f - number.to_i) == 0) && (isPrime? number.to_i)
end
