# dev fast
def calculate(s)
  s.gsub! ' ', ''
  s.gsub! '-', '+-'
  calc = -> str do
    rt = str.chars.inject({:left=>0, :right=>[0]}) do |mem, var|
      if var == '+'
        mem[:left] += mem[:right].join.to_i
        mem[:right] = [0]
      elsif var == '-'
        if mem[:right][0] == '-'
          mem[:right][0] = 0
        else
          mem[:right] = [ '-', 0]
        end
      else
        mem[:right] << var
      end
      mem
    end
    rt[:left] + rt[:right].join.to_i
  end
  while s.include? '('
    s.sub!(/\([^()]*\)/) do |match|
      calc.call match[1, match.length - 2]
    end
  end
  calc.call s
end

# run fast
def calculate(s)
  data = s.chars.inject({:result=>[], :tmp=>nil}) do |mem, var|
    if /\d/ =~ var
      mem[:tmp] = 0 if mem[:tmp].nil?
      mem[:tmp] = mem[:tmp] * 10 + var.to_i
    elsif /[\(|\)|+|-]/ =~ var
      mem[:result] << mem[:tmp] if mem[:tmp] != nil
      mem[:result] << var
      mem[:tmp] = nil
    end
    mem
  end
  data[:result] << data[:tmp] if !data[:tmp].nil?

  calc = -> arr do
    arr.inject({:left=>0, :plus=>true}) do |mem, var|
      case var
      when '+'; mem[:plus] = true
      when '-'; mem[:plus] = false
      else mem[:left] += mem[:plus] ? var : 0 - var
      end
      mem
    end[:left]
  end

  calc.call(data[:result].inject({:out=>[], :last=>[]}) do |mem, var|
    if var == '('
      mem[:out] << var
      mem[:last] << mem[:out].size
    elsif var == ')'
      last = mem[:last].pop
      mem[:out] = mem[:out][0...last-1] + [calc.call(mem[:out][last..-1])]
    else
      mem[:out] << var
    end
    mem
  end[:out])
end