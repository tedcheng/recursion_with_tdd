require 'rspec'
require 'recursion_ex'


describe "#range" do
  it "returns an empty array when start equals end" do
    range(1, 1) == []
  end

  it "returns an empty array when the difference between start and end is 1" do
    range(1, 2) == []
  end
  
  it "solves a simple case by returning an array of one element" do
    range(1, 3) == [2]
  end
  
  it "solves longer range of numbers too" do
    range(5, 10) == [6, 7, 8, 9]
  end
  
  it "calls itself recursively" do
    should_receive(:range).at_least(:twice).and_call_original
    range(10, 15)
  end
end


describe "#sum" do
  # write a `Array#sum` method (an instance method on array)
  it "returns 0 if the array is empty" do
    [].sum.should == 0
  end

  it "returns the value of the element if only one element present" do
    [1].sum.should == 1
  end
  
  it "otherwise return the sum of all elements in the array" do
    [1, 2, 3].sum.should == 6
  end
  
  it "calls itself recursively" do
    test_arr = [4, 5, 6, 7]
    test_arr.should_receive(:sum).at_least(:twice).and_call_original
    test_arr.sum
  end
end

describe "#exp" do
  it "for any base returns 1 if n is 0" do
    exp(1, 0).should == 1
    exp(2, 0).should == 1
    exp(3, 0).should == 1
  end

  it "for any base returns the value of the base if n is 1" do
    exp(1, 1).should == 1
    exp(2, 1).should == 2
    exp(3, 1).should == 3
  end

  it "otherwise calculates exponentials (it works with even n)" do
    exp(2, 10).should == 1024
    exp(2, 8).should == 256
  end
    
  it "it works with odd n" do
    exp(2, 9).should == 512
    exp(2, 7).should == 128
  end  
    
  it "calls itself recursively" do
    should_receive(:exp).at_least(:twice).and_call_original
    exp(2, 6)
  end
end

describe "#deep_dup" do
  # write a deep_dup instance method on arrays
  it "duplicates a flattened array" do
    test_arr = [0, 1, 2, 3]
    test_arr.deep_dup.should == test_arr
  end

  it "duplicates a nested array" do
    test_arr = [[0, 1], [2, 3]]
    test_arr.deep_dup.should == test_arr
  end

  it "the duplicated array is a new object" do
    test_arr = [[0, 1], [2, 3]]
    (test_arr.object_id == test_arr.deep_dup.object_id).should == false
  end
    
  it "works with a mixed array" do
    test_arr = [[0, 1], [2, 3], 4, 5]
    (test_arr == test_arr.deep_dup).should == true
  end  
    
  it "change on a nested element in the dup array should not affect the original" do
    test_arr = [[0, 1], [2, 3], 4, 5]
    test_arr_copy = test_arr.deep_dup
    test_arr_copy.first << 999
    (test_arr_copy == test_arr).should == false
  end  
    
  it "calls itself recursively" do
    # TODO need to fix this test
    # test_arr = [[0, [1, [2]]], [3, 4]]
    # test_arr.should_receive(:deep_dup).at_least(:twice).and_call_original
    # test_arr.deep_dup
  end
end

describe "#fibs" do
  it "returns first fibonacci number" do
    fibs(1).should == [0]
  end

  it "returns first two fib numbers" do
    fibs(2).should == [0, 1]
  end

  it "returns many fibonacci numbers" do
    fibs(6).should == [0, 1, 1, 2, 3, 5]
  end

  it "calls itself recursively" do
    should_receive(:fibs).at_least(:twice).and_call_original
    fibs(6)
  end
end

describe "#make_change" do
  # with default coins=[25, 10, 5, 1]
  it "returns the coins to be changed for a given amount" do
    make_change(14).should == [10, 1, 1, 1, 1]
    make_change(25).should == [25]
  end
  
  it "returns an empty array if the amount is 0" do
    make_change(0).should == []
  end
end

describe "#subsets" do
  it "for an empty array returns only an array of a empty array" do
    subsets([]).sort.should == [[]]
  end
  
  it "for an array of one element returns an array of an empty array and an array of that single element" do
    subsets([1]).sort.should == [[], [1]].sort
  end
  
  it "returns all possible subsets" do
    subsets([1, 2]).sort.should == [[], [1], [2], [1, 2]].sort
    subsets([1, 2, 3]).sort.should == [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]].sort
  end
end


