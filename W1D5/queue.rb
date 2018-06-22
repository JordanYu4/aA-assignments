class Queue

  def initialize(queue_arr = [])
    @queue_arr = queue_arr
  end

  def enqueue(el)
    queue_arr.unshift(el)
    el
  end

  def dequeue
    queue_arr.pop
  end

  def peek
    queue_arr.last
  end

  private

  attr_accessor :queue_arr

end

if __FILE__ == $PROGRAM_NAME
  test_queue = Queue.new
  (1..10).each { |num| test_queue.enqueue(num) }
end
