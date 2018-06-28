
def sluggish_octopus(fish_arr)
  return fish_arr if fish_arr.empty?
  return fish_arr.first if fish_arr.length == 1
  fish_arr.length.times do
    if fish_arr.drop(1).all? { |fish| fish.length < fish_arr.first.length }
      longest_fish = fish_arr.first
    end
  end
  longest_fish
end

def dominant_octopus(fish_arr)
  return fish_arr if fish_arr.empty?
  merge_sort(fish_arr).last
end

def merge_sort(arr)
  return arr if arr.length <= 1
  mid = arr.lenght / 2
  sorted_left = merge_sort(arr.take(mid))
  sorted_right = merge_sort(arr.drop(mid))
  merge(sorted_left, sorted_right)
end

def merge(left, right)
  merged = []
  until left.empty? || right.empty?
    case left.first.length <=> right.first.length
    when -1
      merged << left.shift
    when 0
      merged << left.shift
    when 1
      merged << right.shift
    end
  end
  merged + left + right
end

def clever_octopus(fish_arr)
  return fish_arr if fish_arr.empty?
  longest_fish = fish_arr.first
  fish.drop(1).each do |fish|
    longest_fish = fish if fish.length > longest_fish.length
  end
  longest_fish
end

def slow_dance(direction)
  tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
  tiles_array.each_with_index do |dir, idx|
    return idx if dir == direction
  end
end

def constant_dance(direction)
  tiles_hsh = { "up" => 0,
                "right-up" => 1,
                "right" => 2,
                "right-down" => 3,
                "down" => 4,
                "left-down" => 5,
                "left" => 6,
                "left-up" => 7 }
   tiles_hsh[direction]
end
