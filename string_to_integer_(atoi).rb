# yeah, I know, it's cheat =_=b
def my_atoi(str)
  str = str.to_i
  str > 2147483647 ? 2147483647 : str < -2147483648 ? -2147483648 : str
end