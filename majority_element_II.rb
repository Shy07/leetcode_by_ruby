# fast and simple
def majority_element(nums)
  a = nums.sort.chunk{ |x| x }.map &:last
  a.inject([]) {|mem, var| mem << var[0] if var.size > nums.size / 3; mem }
end