# first answer, run fast version has not found 
def max_points(points)
  return points.size if points.size < 2
  result = {:slope=>{}, :same=>{}}
  points.size.times do
    p1 = points.pop
    points.each do |p2|
      k, b = 1, p1.x
      if p1.x != p2.x
        k = (p2.y - p1.y) * 1.0 / (p2.x - p1.x)
        b = k * p2.x - p2.y
      end
      result[:slope][[k, b]] ||= []
      result[:slope][[k, b]] += [[p1.x, p1.y], [p2.x, p2.y]]
    end
    result[:same][[p1.x, p1.y]] ||= 0
    result[:same][[p1.x, p1.y]] += 1
  end
  result[:slope].values.inject(0) do |max, var|
    count = var.uniq.inject(0) { |mem, p| mem + result[:same][p] }
    count > max ? count : max
  end
end