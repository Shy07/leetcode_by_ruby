# => Tips: Lagrange's four-square theorem
def num_squares(n)
  n /= 4 while n % 4 == 0
  return 4 if n % 8 == 7
  i = Math.sqrt(n).to_i
  return 1 if i ** 2 == n
  square = (1..i).to_a.inject([]) {|m,s| m.push s ** 2}
  square.each {|x| square.each {|y| return 2 if x + y == n }}
  3
end
