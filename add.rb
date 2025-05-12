# https://osherove.com/tdd-kata-1/

def add(str)
  # Check if the string is empty
  return 0 if str.empty?

  delimiter = /,|\n/

  # Check if the string starts with a custom delimiter
  if str.start_with?("//")
    delimiter, str = str.split("\n", 2)

    # Remove the leading "//" and split the delimiter string
    delimiters = delimiter.gsub("//", "").split(/[\[\]]+/).reject(&:empty?)
    delimiter = Regexp.union(delimiters)
  end

  # Split the string using the delimiter
  # Convert the string to an array of integers
  # Reject numbers greater than 1000
  nums = str.split(delimiter).map(&:to_i).reject { |num| num > 1000 }

  # Check for negative numbers
  negatives = nums.select { |num| num < 0 }

  raise "negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?

  nums.reduce(0, :+)
end
