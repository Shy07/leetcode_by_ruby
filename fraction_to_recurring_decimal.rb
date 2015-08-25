def fraction_to_decimal(numerator, denominator)
  return 'NaN' if denominator == 0
  num, den = numerator.abs, denominator.abs
  result = (num / den).to_s
  remainder = num % den
  if remainder != 0
    result += '.'
    hash = {}
    loop do
      if !hash[remainder].nil?
        result.insert hash[remainder], '('
        result += ')'
        break
      end
      hash[remainder] = result.length
      remainder *= 10
      result += (remainder / den).to_s
      remainder = remainder % den
      break if remainder == 0
    end
  end
  result = "-#{result}" if (numerator * 1.0 / denominator < 0) && result != '0'
  result
end