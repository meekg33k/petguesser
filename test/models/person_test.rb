require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  
  test "should save person without name" do
    person = Person.new(height:5.7, weight:150)
    assert person.save
  end
  
  test "should not save person without height" do
    person = Person.new(name:'TestUser', weight:150)
    assert_not person.save
  end
  
  test "should not save person without weight" do
    person = Person.new(name:'TestUser', height:4.5)
    assert_not person.save
  end

  test "should save person without pet initially" do
    person = Person.new(name:'TestUser', height:5.7, weight:150)
    assert person.save
  end
  
  test "should not save person with height less than 3 feet" do
    person = Person.new(name:'TestUser', height:1.7, weight:150)
    assert_not person.save
  end
  
  test "should not save person with height greater than 8 feet" do
    person = Person.new(name:'TestUser', height:9.2, weight:150)
    assert_not person.save
  end
  
  test "should not save person with weight less than 70 lb" do
    person = Person.new(name:'TestUser', height:1.7, weight:55)
    assert_not person.save
  end
    
  test "should not save person with weight greater than 300 lb" do
    person = Person.new(name:'TestUser', height:5.7, weight:300.55)
    assert_not person.save
  end
end