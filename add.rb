# https://osherove.com/tdd-kata-1/

def add(str)
  # Check if the string is empty
  return 0 if str.empty?

  # Split the string by commas and convert each part to an integer
  # Check if the string starts with a custom delimiter
  if str.start_with?("//")
    delimiter, str = str.split("\n", 2)
    delimiter = delimiter.gsub("//", "")
  else
    delimiter = /[,\n]/
  end

  nums = str.split(delimiter).map(&:to_i).reject { |num| num > 1000 }
  negatives = nums.select { |num| num < 0 }

  raise "negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?

  nums.reduce(0, :+)
end