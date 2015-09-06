# H-Index
def h_index(citations)
  return 0 if citations.empty?
  citations.sort.reverse.each_with_index {|c, i| i += 1; return i - 1 if i > c }
  return citations.size
end

# H-Index II
def h_index(citations)
  return 0 if citations.empty?
  citations.reverse.each_with_index {|c, i| i += 1; return i - 1 if i > c }
  return citations.size
end