
require 'minitest/autorun'

require 'minitest/expectations'
load 'program.rb'
    class TestZad < MiniTest::Test

        describe Calculator do
            before do
                @kalkulator = Calculator.new()
                @opt1 =["--add","3"]
                @opt2 = ["--add","3","--reverse"]
                
        end
    
        describe "Add() " do
            it "will sum 1 nad 3 to 4" do
                @kalkulator.add(1,2).must_equal(3)
            end
        end
    
        describe "Subtract() " do
            it " wil subtract 3 from 4 and give 1 " do
                @kalkulator.subtract(4,3).must_equal(1)
            end
        end

        describe "Multiply() " do
            it "wil multiply 3 by 4 and give 12" do
                @kalkulator.multiply(3,4).must_equal(12)
            end
        end

        describe "Divide() " do
            it "will divide 12 by 4 and give 3 " do
                @kalkulator.divide(12,4).must_equal(3)
            end
            it "will divide 13 by 4 and give 3" do
                @kalkulator.divide(13,4).must_equal(3)
            end
        end

        describe "Reverse() " do
            it "will reverse String test to tset " do
                @kalkulator.reverse("test").must_equal("tset")
            end
            it "will reverse String kayak to kayak" do
                @kalkulator.reverse("kayak").must_equal("kayak")
            end
        end

        describe "swapCase() " do
            it "will swap cases of String AbC to aBc " do
                @kalkulator.swapCase("AbC").must_equal("aBc")
            end
        end

        describe "stringConvert() " do
            it "will not allow to convert 123 into String " do
                proc { @kalkulator.stringConvert("123")}.must_raise ArgumentError
            end

            it "will return String \"abc\" from input \"abc\" " do
                @kalkulator.stringConvert("abc").must_equal("abc")
            end
        end

        describe "intConvert() " do
            it "will not allow to convert 1.5 to Integer " do
                proc { @kalkulator.intConvert("1.5")}.must_raise ArgumentError
            end
            
            it "will not allow to convert \"abc\" to Integer " do
                proc { @kalkulator.intConvert("abc")}.must_raise ArgumentError
            end

            it "will return Integer 123 from input \"123\" " do
                @kalkulator.intConvert("123").must_equal(123)
            end
        end

        describe "options() " do
            it "will not allow to use options with too few arguments " do
                @kalkulator.options= @opt1
                proc { @kalkulator.parse_options}.must_raise ArgumentError
            end
            
            it "will not allow to use options with too few arguments " do
                @kalkulator.options= @opt2
                proc { @kalkulator.parse_options}.must_raise ArgumentError
            end

          
        end
    
    
    end
    end