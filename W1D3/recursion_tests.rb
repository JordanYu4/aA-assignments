require_relative 'HW_W1D3_Jordan_Yu'

# puts "sum_to test cases: \n"
#
# p sum_to(5)  # => returns 15
# p sum_to(1)  # => returns 1
# p sum_to(9)  # => returns 45
# p sum_to(-8)  # => returns nil
#
# #################################
#
# puts "add_numbers test cases: \n"
#
# p add_numbers([1,2,3,4]) # => returns 10
# p add_numbers([3]) # => returns 3
# p add_numbers([-80,34,7]) # => returns -39
# p add_numbers([]) # => returns nil
#
# #################################
#
puts "gamma function test cases: \n"

p gamma_fnc(0)  # => returns nil
p gamma_fnc(1)  # => returns 1
p gamma_fnc(4)  # => returns 6
p gamma_fnc(8)  # => returns 5040


#################################

# puts "ice cream shop test cases: \n"
#
# p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')
#                 # => returns false
# p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'],
#                 'green tea')  # => returns true
# p ice_cream_shop(['cookies n cream', 'blue moon', 'superman',
#                 'honey lavender', 'sea salt caramel'], 'pistachio')
#                 # => returns false
# p ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
# p ice_cream_shop([], 'honey lavender')  # => returns false

#################################

# puts "reverse test cases: \n"
#
# p reverse("house") # => "esuoh"
# p reverse("dog") # => "god"
# p reverse("atom") # => "mota"
# p reverse("q") # => "q"
# p reverse("id") # => "di"
# p reverse("") # => ""

puts "All active tests completed."
