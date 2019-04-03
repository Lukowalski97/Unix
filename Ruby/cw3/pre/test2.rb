
require 'minitest/autorun'

require 'minitest/expectations'
load 'zad2.rb'



class TestZad < MiniTest::Test

    describe Odbiorca do
        before do
            @odbtest = Odbiorca.new([1,1])
    end

    describe "utworzona tablica losowa" do
        it "bedzie poprawna" do
            @odbtest.utworz_tablice(1,1).must_equal([0])
        end
    end

    describe "ilosc parzysciakow jest rowna" do
        it "pewnie szostce" do
            @odbtest.tab= ["zad1inp.txt","zad1inp2.txt"]
            @odbtest.ilosc_liczb_parzystych().must_equal(6)
        end
    end

end
end