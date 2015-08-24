# dev fast
def add_digits(num)
  loop do
    return num if num.to_s.length == 1
    num = num.to_s.split('').inject(0) { |m, s| m + s.to_i }
  end
end