require 'minitest/autorun'
load 'dziekanat.rb'

# Tests
class TestSum < MiniTest::Test 

  def setup
    @set1 = %w[Ruby Andrzej]
    @set2 = %w[Ruby Michal]
    @set3 = %w[JS Andrzej]
    @set4 = %w[Ruby Adam]
    @hash1= {"Ruby"=> {"Andrzej"=> ["5.0","6.0"]} }
    @marks1= %w[Ruby Andrzej 5.0]
    @marks2= %w[Ruby Andrzej 6.0]
  end

  
  def test_check_duplicates
    $maintab = {}
    assert_raises (ArgumentError) do
      add_person(@set1)
      add_person(@set1)
    end
  end

  def test_check_max
    $maintab = {}
    assert_raises(ArgumentError) do
        add_person(@set1)
        add_person(@set2)
        add_person(@set4)
    end
  end

  def test_marks
    $maintab= {}
    add_mark(@marks1)
    add_mark(@marks2)
    assert_equal($maintab,@hash1)
  end
end
