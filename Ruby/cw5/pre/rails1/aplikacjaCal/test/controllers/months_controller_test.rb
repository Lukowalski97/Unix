require 'test_helper'

class MonthsControllerTest < ActionDispatch::IntegrationTest
   test "the truth" do
    assert true
   end

  test "should render index " do 

    get months_url
  assert_template "index"
  end 

  test "should index have such list " do

    get months_url
  assert_select '#lista', html: '<ul>
  <li><a href="/months/1">Styczeń</a></li>
  <li><a href="/months/2">Luty</a></li>
  <li><a href="/months/3">Marzec</a></li>
  <li><a href="/months/4">Kwiecień</a></li>
  <li><a href="/months/5">Maj</a></li>
  <li><a href="/months/6">Czerwiec</a></li>
  <li><a href="/months/7">Lipiec</a></li>
  <li><a href="/months/8">Sierpien</a></li>
  <li><a href="/months/9">Wrzesień</a></li>
  <li><a href="/months/10">Październik</a></li>
  <li><a href="/months/11">Listopad</a></li>
  <li><a href="/months/12">Grudzień</a></li>
</ul>'
  end


test "should year update  @@year value " do

  put month_path(:year), params: {"NewYear" => "2020"}


  

  assert_equal  2020, @controller.send(:year)
end

end
