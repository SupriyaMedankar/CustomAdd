# https://osherove.com/tdd-kata-1/

def add(str)
  # Check if the string is empty
  return 0 if str.empty?

  # Split the string by commas and convert each part to an integer
  if str.start_with?("//")
    delimiter, num_str = str.split("\n", 2)
    delimiter = delimiter.gsub("//", "")
    num_str.split(delimiter).map(&:to_i).reduce(0, :+)
  else
    str.split(/[,\n]/).map(&:to_i).reduce(0, :+)
  end
end