def find_person(name, array)
  array.select {|n| n.match(/\b#{name}\b/i)}
end

# Other regular expressions from class
#
# /^-?\d+\.?\d*$/
# /^(\d{1,3}\.){3}\d{1,3}$/
# /\bclinton\b/i
