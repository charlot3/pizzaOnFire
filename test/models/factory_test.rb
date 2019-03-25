require 'test_helper'

class FactoryTest < ActiveSupport::TestCase
  def setup
    @factory = Factory.new(name:"金沙江路店", address:"上海市普陀区中山北路3663号华东师范大学")
  end

  test "factory name should be present" do
    @factory.name = " "
    assert_not @factory.valid?
  end

  test "factory address should be present" do
    @factory.address = " "
    assert_not @factory.valid?
  end

  test "factory id should be present" do
    @factory.id = " "
    assert_not @factory.valid?
  end

  test "id should be number" do
    @factory.id = "yyyy"
    assert_not @factory.valid?
  end


end
