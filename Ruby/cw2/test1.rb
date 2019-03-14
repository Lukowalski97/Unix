

require 'minitest/autorun'
load 'zad.rb'

class TestZad < MiniTest::Test
    def test_count
        $count_tab=[]
        counter("a bc def")
        counter("ghij klmn")

        assert_equal($count_tab[0],nil)
        assert_equal($count_tab[1],1)
        assert_equal($count_tab[2],1)
        assert_equal($count_tab[3],1)
        assert_equal($count_tab[4],2)
    end
end
