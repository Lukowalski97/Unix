
require 'minitest/autorun'
load 'zad2.rb'

class TestZad < MiniTest::Test
    def test_parsing
        parse_line("test123test321test123")
        assert_equal($tab,["test","123","test","321","test","123"])
        
    end
end
