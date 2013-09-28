def range(min, max)
  return [min] if min == max
  
  range(min, max - 1) << max
end


def sum(nums)
  return 0 if nums.empty?

  return nums.pop + sum(nums)
end


def exp(base, power)
  case power
  when 0
    1
  when 1    
    base
  else
    prev_exp = exp(base, power/2)
    (power % 2 == 0) ? (prev_exp ** 2) : (prev_exp ** 2) * base
  end
end

class Array
  def deep_dup
    self.map { |el| (el.is_a?(Array)) ? el.deep_dup : el }
  end
end



def fibs(count)
  case count
  when 1
    [0]
  when 2
    [0, 1]
  else
    prev_fibs = fibs(count - 1)
    prev_fibs << prev_fibs[-1] + prev_fibs[-2]
  end
end



def bsearch(arr, target)
  return nil if arr.empty?
  
  mid = arr.length/2
  if arr[mid] == target
    mid
  elsif arr[mid] <= target
    sub_answer = bsearch(arr[mid + 1..-1], target)
    (sub_answer.nil?) ? nil : (mid + 1) + sub_answer
  else
    bsearch(arr[0..mid - 1], target)
  end
end


def make_change(amount, coins = [25, 10, 5, 1])
  return [] if target == 0

  coins = coins.sort.reverse

  best_change = nil
  coins.each_with_index do |coin, index|
    next if coin > target

    remainder = target - coin

    best_remainder = make_change(remainder, coins[index..-1])

    this_change = [coin] + best_remainder

    if (best_change.nil? || (this_change.count < best_change.count))
      best_change = this_change
    end
  end

  best_change
end


def merge_sort(arr)
  return arr if arr.length < 2

  mid = arr.length / 2
  sorted_left = merge_sort(arr.take(mid))
  sorted_right = merge_sort(arr.drop(mid))
  merge(sorted_left, sorted_right)
end


def merge(left, right)
  merged_arr = []
  until left.empty? || right.empty?
    merged_arr << ((left.first < right.first) ? left.shift : right.shift)
  end
  
  merged_arr + left + right
end


def subsets(arr)
  return [[]] if arr.empty?
  
  val = arr.first
  subs = subsets(arr.drop(1))
  subs += subs.map { |sub| [val] + sub }

  subs
end



