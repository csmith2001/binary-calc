def max_power_two(decimal):
  i=1
  while i < decimal:
    max_power=i
    i*=2
  return max_power

def convert_to_binary(decimal):
  max_power = max_power_two(decimal)
  new_num = decimal
  binary = ""

  while new_num >= 1:
    if max_power <= new_num:
      new_num = new_num - max_power
      binary += "1"
    else:
      binary += "0"
    max_power/=2
  return binary

print(convert_to_binary(345))