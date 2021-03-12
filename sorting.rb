require 'pry'

class SortingAlgorithms
  class << self
    def make_random_array(size)
      (1..size).to_a.shuffle
    end

    def ruby_sort(arr)
      arr.sort
    end

    def selection_sort(arr)
      sorted_point = 0
      while sorted_point < arr.size - 1
        current_min = arr.size + 1
        for i in sorted_point..(arr.size - 1)
          if current_min > arr[i]
            current_min = arr[i]
            min_index = i
          end
        end
        arr[sorted_point], arr[min_index] = arr[min_index], arr[sorted_point]
        sorted_point += 1
      end
    end

    def bubble_sort(arr)
      swapped_value = true
      while swapped_value
        swapped_value = false
        for i in 0..(arr.size - 2)
          if arr[i] > arr[i + 1]
            arr[i], arr[i + 1] = arr[i + 1], arr[i]
            swapped_value = true
          end
        end
      end
    end
  end
end

puts "give an array size"
size = gets.chomp.to_i
unsorted = SortingAlgorithms.make_random_array(size)

start_time = Time.now
SortingAlgorithms.ruby_sort(unsorted.clone)
end_time = Time.now
puts "it took ruby_sort #{end_time - start_time} seconds to complete this sorting"

start_time = Time.now
SortingAlgorithms.selection_sort(unsorted.clone)
end_time = Time.now
puts "it took selection_sort #{end_time - start_time} seconds to complete this sorting"

start_time = Time.now
SortingAlgorithms.bubble_sort(unsorted.clone)
end_time = Time.now
puts "it took bubble_sort #{end_time - start_time} seconds to complete this sorting"
