class Map

  def initialize
    @underlying_arr = []
  end

  def set(key, value)
    if get(key)
      underlying_arr.each { |pair| pair[-1] = value if pair.first == key }
    else
      underlying_arr << [key, value]
    end
  end

  def get(key)
    underlying_arr.each do |pair|
      return pair.last if pair.first == key
    end
    puts "Map does not contain requested key"
    nil
  end

  def delete(key)
    underlying_arr.reject! { |pair| pair.first == key }
  end

  def show
    underlying_arr
  end

  private

  attr_accessor :underlying_arr

end

if __FILE__ == $PROGRAM_NAME
  test_map = Map.new
  (1..10).each { |num| test_map.set(num, num.to_s) }
end
