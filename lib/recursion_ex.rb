def range(start, ending)
  if start == ending || start + 1 == ending
    []
  else
    [start + 1] + range(start + 1, ending)
  end
end

class Array
  def sum
    if self.length == 0
      0
    elsif self.length == 1
      self.first
    else
      self.pop + self.sum
    end
  end
end

def exp(base, n)
  if n == 0
    1
  elsif n == 1
    base
  else
    prev_exp = exp(base, n/2)
    if n % 2 == 0
      (prev_exp ** 2) 
    else
      (prev_exp ** 2) * base
    end
  end
end

class Object
  def deep_dup
    if !self.is_a?(Array)
      self
    else
      self.map(&:deep_dup)
    end
  end
end



def fibs(count)
  if count == 1
    [0]
  elsif count == 2
    [0, 1]
  else
    prev_fibs = fibs(count - 1)
    prev_fibs << prev_fibs[-1] + prev_fibs[-2]
  end
end


# TODO 1) refactor this code 2) make it work for arbitrary coin combinations like [10, 7, 1]
def make_change(amount, coins = [25, 10, 5, 1])
  return [] if amount == 0
  largest_coin = []
  coins.each do |coin|
    if coin <= amount
      largest_coin = coin
      break
    end
  end
  [largest_coin] + make_change(amount - largest_coin)
end

def bsearch(arr, target)
  return nil if arr.length == 1 && arr.first != target
  mid = arr.length/2
  if arr[mid] == target
    mid
  elsif arr[mid] <= target
    sub_search_result = bsearch(arr[mid..-1], target)
    (sub_search_result.nil?) ? nil : mid + sub_search_result
  else
    sub_search_result = bsearch(arr[0..mid - 1], target)
    (sub_search_result.nil?) ? nil : sub_search_result
  end
end


# TODO think about edge cases with mid point
def merge_sort(arr)
  if arr.length == 1
    arr
  else
    mid = arr.length / 2
    sorted_left = merge_sort(arr[0..mid - 1])
    sorted_right = merge_sort(arr[mid..-1])
    merge(sorted_left, sorted_right)
  end
end

def merge(left, right)
  return right if left.empty?
  return left if right.empty?
  
  if left[0] < right[0]
    first_el = left.shift
    [first_el] + merge(left, right)
  else
    first_el = right.shift
    [first_el] + merge(left, right)
  end
end


# TODO improve and fix the uniqueness problem
def subsets(arr)
    current_level = [arr]
    arr.each do |el|
      reduced_arr = arr - [el]
      current_level += [[el], reduced_arr]
      current_level += subsets(reduced_arr)
    end
    current_level.uniq
end



