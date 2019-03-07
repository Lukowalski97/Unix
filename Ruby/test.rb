require 'minitest/autorun'
load 'main.rb'

# Tests
class TestSum < MiniTest::Test
  def setup
    @result1 = sum(2, 2)
    @result2 = sum(2, 1.5)
    @result3 = sum(2, '2')
    @result4 = sum('2.1', '2.0')
    @result5 = sum(Rational(2, 3), Rational(2, 3))
    @result6 = sum(Rational(2, 3), 1)
    @result7 = sum(2 + 1i, 3 + 3i)
    @result8 = sum(2 + 3i, 1)
  end

  def test_sum_integer_integer
    assert_equal(@result1, 4)
  end

  def test_sum_integer_float
    assert_equal(@result2, 3.5)
  end

  def test_sum_integer_string
    assert_equal(@result3, 4)
  end

  def test_sum_string_string
    assert_equal(@result4, 4.1)
  end

  def test_sum_integer_wrong_number_in_string
    assert_raises(ArgumentError) { sum(2, 'Ala ma kota123') }
  end

  def test_sum_rational_rational
    assert_equal(@result5, Rational(4, 3))
  end

  def test_sum_rational_integer
    assert_equal(@result6, Rational(5, 3))
  end

  def test_sum_complex_complex
    assert_equal(@result7, 5 + 4i)
  end

  def test_sum_complex_integer
    assert_equal(@result8, 3 + 3i)
  end

  def test_sum_not_number_not_string
    assert_raises(TypeError) { sum(1, [2, 3]) }
  end

  
end
