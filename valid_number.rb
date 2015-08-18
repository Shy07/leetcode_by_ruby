# simple
def is_number(s)
  /^(\+|-)?(\d+(\.\d+)?|\d+\.|\.\d+)(e(\+|-)?\d+)?$/ =~ s.strip ? true : false
end

# complex
def is_number(s)
  s = s.strip.chars.inject([]) do |mem, var|
    var = var.ord
    var.between?(48, 57) || [43,45,46,101].include?(var) ? (mem << var) : (return false)
    mem
  end
  return false if s.empty?
  if s.include? 101
    return false if s.count(101) > 1
    index = s.index 101
    return false if index == 0 || index == s.size - 1
    return false unless s[index-1].between?(48, 57) || s[index - 1] == 46
    return false unless s[index+1].between?(48, 57) || s[index+1] == 43 || s[index+1] == 45
  end
  if s.include? 46
    return false if s.size < 2
    return false if s.count(46) > 1
    index = s.index 46
    return false if index == s.size - 1 && !s[index - 1].between?(48, 57)
    return false if index == 0 && s[index + 1] == 101
    return false if s.include?(101) && s.index(101) < index
  end
  s.shift if s[0] == 43 || s[0] == 45
  [43, 45].each do |op|
    if s.include? op
      return false if s.count(op) > 1
      index = s.index op
      return false if index == s.size - 1
      if index != 0
        return false unless s[index - 1] == 101
        return false unless s[index + 1].between?(48, 57)
      end
    end
  end
  true
end