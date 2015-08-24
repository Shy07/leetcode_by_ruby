# dev fast
def is_happy(n)
  seen_hash = {4=>16, 16=>37, 37=>58, 58=>89, 89=>145, 145=>42, 42=>20, 20=>4}
  while seen_hash[n].nil?
    n = seen_hash[n] = n.to_s.chars.inject(0) { |m, s| m + s.to_i * s.to_i }
    return true if n == 1
  end
  n == 1
end