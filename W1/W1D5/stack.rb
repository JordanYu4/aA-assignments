class Stack

  def initialize(stack_arr = [])
    @stack_arr = stack_arr
  end

  def push(el)
    @stack_arr.push(el)
    el
  end

  def pop
    @stack_arr.pop
  end

  def peek
    stack_arr.last
  end

  private

  attr_reader :stack_arr

end

if __FILE__ == $PROGRAM_NAME
  test_stack = Stack.new
  (1..10).each { |num| test_stack.push(num) }
end
