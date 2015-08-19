# recursion but stack level too deep
def max_depth(root)
  length = -> node {
    return 0 if node.nil?
    left = length.call node.left
    right = length.call node.right
    left > right ? left+1 : right+1
  }
  length.call root
end

# priority
def max_depth(root)
  return 0 if root.nil?
  stack = [[root, 1]]
  depth = 0
  loop do
    break if stack.empty?
    cur = stack.pop
    depth = cur[1] if cur[1] > depth
    stack << [cur[0].right, cur[1] + 1] if cur[0].right
    stack << [cur[0].left, cur[1] + 1] if cur[0].left
  end
  depth
end