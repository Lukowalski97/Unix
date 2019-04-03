
require 'minitest/autorun'
load 'zad2.rb'

class TestZad < MiniTest::Test
    def test_parsing
        parse_line("test123tęst321teśt123")
        assert_equal($tab,["test","123","tęst","321","teśt","123"])
        
    end
end
