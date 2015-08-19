# fast and simple
def majority_element(nums)
  nums.sort.chunk{|x|x}.map(&:last).inject([]){|m,v| m << v[0] if v.size > nums.size / 3;m}
end