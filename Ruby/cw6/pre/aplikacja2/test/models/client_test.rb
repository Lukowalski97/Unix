require 'test_helper'

class ClientTest < ActiveSupport::TestCase
   test "the truth" do
   assert true
   end

   test "empty client" do

    client = Client.new
    assert_not client.save

   end

   test "should report error" do

    assert_raises(NameError) do
      undefined_var
    end
  end

  test "yaml testing" do
    testy =clients(:two)
    assert_not testy.save
    end

  test "valid model can be saved" do
    testy =clients(:valid)
  
    assert testy.save
    assert  testy.errors.details.length==0
   
  end

  test "mail must be unique" do
    testy2 =clients(:valid2)
    testy3 =clients(:valid3)
    
    assert_not testy2.save
    assert_not testy3.save
 
    assert testy2.errors.details[:mail].length >0
    assert testy3.errors.details[:mail].length >0
  end

  test "Blank name is not valid" do
    testy =clients(:bname)
    assert_not testy.save
    assert testy.errors.details[:name].length >0
  end

  test "Blank surname is not valid" do
    testy =clients(:bsname)
    assert_not testy.save
    assert testy.errors.details[:surname].length >0
  end

  test "Blank city is not valid" do
    testy =clients(:bcity)
    assert_not testy.save
    assert testy.errors.details[:city].length >0
  end

  test "Blank mail is not valid" do
    testy =clients(:bmail)
    assert_not testy.save
    assert testy.errors.details[:mail].length >0
  end

  test "short name is not valid" do
    testy =clients(:sname)
    assert_not testy.save
    assert testy.errors.details[:name].length >0
 
  end

  test "short surname is not valid" do
    testy =clients(:ssname)
    assert_not testy.save
    assert testy.errors.details[:surname].length >0
  end

  test "short city is not valid" do
    testy =clients(:scity)
    assert_not testy.save
    assert testy.errors.details[:city].length >0
  end

  test " kok@com is not a valid mail" do
    testy =clients(:wmail1)
    assert_not testy.save
    assert testy.errors.details[:mail].length >0
  end

  test " kok.com is not a valid mail" do
    testy =clients(:wmail2)
    assert_not testy.save
    assert testy.errors.details[:mail].length >0
  end

  test " kok is not a valid name" do
    testy =clients(:wmail3)
    assert_not testy.save
    assert testy.errors.details[:mail].length >0
  end



end
