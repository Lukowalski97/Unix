require 'test_helper'

class WelcomesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get welcomes_index_url
    assert_response :success
  end

  test "should show content of product page correctly" do
  
    get welcomes_index_url
    assert_response :success
    #check that the content matches
    assert_select '#main', html: '<p>Zmienna ilość: 3</p>
<p></p>
Wiadomość: Siemanko witam <br>
Wiadomość: Siemanko witam <br>
Wiadomość: Siemanko witam <br>
<p></p>
@tablica[0] = Panstwa<br>
@tablica[1] = 16<br>
@tablica[2] = c<br>
@tablica[3] = Bardzo serdecznie<br>
<p></p>
@hash[Nazywam] = Sie Piotr PArafiniuk<br>'

end
end