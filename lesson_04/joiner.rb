def joinor(nums, sep=", ", word="or")
  last = nums.pop.to_s
  nums.join(sep) + "#{sep}#{word} " + last
end

p joinor([1, 2, 3, 4, 5], '; ')
p joinor([1, 2, 3], '; ')
p joinor([1, 2, 3])

p joinor([1, 2, 3])                # => "1, 2, or 3"
p joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"


def joinor2(arr, delimiter, word='or')
  arr[-1] = "#{word} #{arr.last}" if arr.size > 1
  arr.join(delimiter)
end

joinor2([1, 2, 3])                # => "1, 2, or 3"
joinor2([1, 2, 3], '; ')          # => "1; 2; or 3"
joinor2([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"
