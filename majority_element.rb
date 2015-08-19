# simple but Time Limit Exceeded
def majority_element(nums)
  nums.each {|e| return e if nums.count(e) > nums.size / 2 }
end

# fast and simple and cheat
def majority_element(nums)
  nums.sort!
  half = nums.size / 2
  left, right = nums[0..half], nums[half..-1]
  left.uniq.size < right.uniq.size ? left[-1] : right[0]
end