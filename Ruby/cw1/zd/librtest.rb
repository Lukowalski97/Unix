require 'json'
require 'minitest/autorun'
load 'library.rb'

def tests_init
  library = { 'library' => [
    { 'title' => 'book1', 'authors' => ['john doe 1', 'john doe 2'], 'groups' => %w[group1 group2] },
    { 'title' => 'book2', 'authors' => ['johny doe 1', 'johny doe 2'], 'groups' => %w[groupz1 groupz2] }
  ] }

  puts library

  js = library.to_json

  puts js

  # File.open('testjs.json','w') { |file| file.write(js)}

  tmp = library['library']
  puts tmp
  book1 = tmp[0]
  puts book1
  booktitle = tmp[0]['title']
  puts booktitle
end

# Tests
class TestSum < MiniTest::Test
   

    def test_remove_title
        @test_rem = [
            { 'title' => 'book2', 'authors' => ['johny doe 1', 'johny doe 2'], 'groups' => %w[groupz1 groupz2] }
          ]
        @librhash = [
          { 'title' => 'book1', 'authors' => ['john doe 1', 'john doe 2'], 'groups' => %w[group1 group2] },
          { 'title' => 'book2', 'authors' => ['johny doe 1', 'johny doe 2'], 'groups' => %w[groupz1 groupz2] }
        ]
    
        remove_title('book2')
    
        assert_equal(@librhash, @test_rem)
      end
    
      def test_remove_author_single
        @test_rem = [
            { 'title' => 'book2', 'authors' => ['johny doe 1', 'johny doe 2'], 'groups' => %w[groupz1 groupz2] }
          ]
        @librhash = [
          { 'title' => 'book1', 'authors' => ['john doe 1', 'john doe 2'], 'groups' => %w[group1 group2] },
          { 'title' => 'book2', 'authors' => ['johny doe 1', 'johny doe 2'], 'groups' => %w[groupz1 groupz2] }
        ]
    
        remove_authors(['johny doe 1'])
    
        assert_equal(@librhash, @test_rem)
      end
  

  def test_remove_author_multi
    @test_rem_auth_multi = [
        { 'title' => 'book1', 'authors' => ['johny doe 1', 'johny doe 2'], 'groups' => %w[] },
        { 'title' => 'book2', 'authors' => ['john doe 31', 'john doe 32'], 'groups' => %w[] },
      { 'title' => 'book3', 'authors' => ['john doe 41', 'john doe 42'], 'groups' => %w[] },
      ]
    @librhash = [
      { 'title' => 'book5', 'authors' => ['john doe 11', 'john doe 12'], 'groups' => %w[] },
      { 'title' => 'book4', 'authors' => ['john CO JEST', 'john doecholipka'], 'groups' => %w[] },
      { 'title' => 'book1', 'authors' => ['johny doe 1', 'johny doe 2'], 'groups' => %w[] },
      { 'title' => 'book2', 'authors' => ['john doe 31', 'john doe 32'], 'groups' => %w[] },
      { 'title' => 'book3', 'authors' => ['john doe 41', 'john doe 42'], 'groups' => %w[] }
     
    ]

    remove_authors(['johny doe 2','john doe 31','john doe 42'])

    assert_equal(@librhash, @test_rem_auth_multi)
  end

  def test_remove_group
    @test_rem = [
        { 'title' => 'book2', 'authors' => ['johny doe 1', 'johny doe 2'], 'groups' => %w[groupz1 groupz2] }
      ]
    @librhash = [
      { 'title' => 'book1', 'authors' => ['john doe 1', 'john doe 2'], 'groups' => %w[group1 group2] },
      { 'title' => 'book2', 'authors' => ['johny doe 1', 'johny doe 2'], 'groups' => %w[groupz1 groupz2] }
    ]

    remove_groups(['groupz1'])

    assert_equal(@librhash, @test_rem)
  end


def test_remove_group_multi
@test_rem_group_multi = [
    { 'title' => 'book1', 'authors' => ['johny doe 1', 'johny doe 2'], 'groups' => %w[kawa java] },
    { 'title' => 'book2', 'authors' => ['john doe 31', 'john doe 32'], 'groups' => %w[inf math] },
  { 'title' => 'book3', 'authors' => ['john doe 41', 'john doe 42'], 'groups' => %w[cpp rabi] },
  ]
@librhash = [
  { 'title' => 'book5', 'authors' => ['john doe 11', 'john doe 12'], 'groups' => %w[whatte eva] },
  { 'title' => 'book4', 'authors' => ['john CO JEST', 'john doecholipka'], 'groups' => %w[whateva] },
  { 'title' => 'book1', 'authors' => ['johny doe 1', 'johny doe 2'], 'groups' => %w[kawa java] },
  { 'title' => 'book2', 'authors' => ['john doe 31', 'john doe 32'], 'groups' => %w[inf math] },
  { 'title' => 'book3', 'authors' => ['john doe 41', 'john doe 42'], 'groups' => %w[cpp rabi] }
 
]

remove_groups(['java','math','rabi'])

assert_equal(@librhash, @test_rem_group_multi)
end

def test_split_args
    assert_equal(["a","b","c","d"],parse_argument("a\\b\\c\\d"))

end
end
