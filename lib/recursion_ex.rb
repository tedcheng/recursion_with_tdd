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



