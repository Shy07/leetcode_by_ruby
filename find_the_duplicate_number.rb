def find_duplicate(nums)
  nums.sort.chunk{|x|x}.map(&:last).each {|s| return s[0] if s.size > 1 }
end
