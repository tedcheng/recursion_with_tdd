#Recursion Practices with TDD
Including common recursion problems (implementation in Ruby):

1. range
```ruby
range(5, 10) 
#=> [6, 7, 8, 9]
```

2. sum
```ruby
[1, 2, 3].sum
#=> 6
```

3. exponent
```ruby
exp(2, 9)
#=> 512
exp(2, 7)
#=> 128
```

4. Deep dup that handles arrays inside an array
```ruby
test_arr = [[0, 1], [2, 3]]
test_arr.deep_dup
#=> [[0, 1], [2, 3]]
test_arr.object_id == test_arr.deep_dup.object_id
#=> false
```

5. Fibonacci Sequence
```ruby
fibs(6)
#=> [0, 1, 1, 2, 3, 5]
```

6. Make Change
```ruby
make_change(14)
#=> [10, 1, 1, 1, 1]
```

7. Binary Search
```ruby
bsearch([0, 1, 2, 3, 4, 5], 3)
#=> 3
bsearch([0, 1, 2, 3, 4, 5], 0)
#=> 0
bsearch([0, 1, 2, 3, 4, 5], 5)
#=> 5
bsearch([0, 1, 2, 3, 4, 5], 6)
#=> nil
```

8. Merge Sort
```ruby
merge_sort([2, 3, 1, 5, 2, 8, 9])
#=> [1, 2, 2, 3, 5, 8, 9]
# merge_sort runs in O (n log n) time
```

9. Subsets
```ruby
subsets([1, 2, 3])
#=> [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
```

