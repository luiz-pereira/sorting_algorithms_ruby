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
      arr
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
      arr
    end

    def cocktail_sort(arr)
      swapped_value = true
      while swapped_value
        swapped_value = false
        for i in 0..(arr.size - 2)
          if arr[i] > arr[i + 1]
            arr[i], arr[i + 1] = arr[i + 1], arr[i]
            swapped_value = true
          end
        end
        for i in (arr.size - 1)..1
          if arr[i - 1] > arr[i]
            arr[i], arr[i - 1] = arr[i - 1], arr[i]
            swapped_value = true
          end
        end
      end
      arr
    end

    def merge_sort(arr)
      l_index = 0
      r_index = arr.size - 1
      if l_index < r_index
        mid = (arr.size / 2).to_i
        left = arr[l_index...mid]
        right = arr[mid..r_index]
        merge_sort(left)
        merge_sort(right)
        left_i = 0
        right_i = 0
        for i in (0...arr.size)
          lefti = left[left_i] if left_i != left.size
          righti = right[right_i] if right_i != right.size
          if right_i == right.size || (left_i != left.size && lefti < righti)
            arr[i] = lefti
            left_i += 1
          else
            arr[i] = righti
            right_i += 1
          end
        end
      end
      arr
    end

  end
end

puts "give an array size"
size = gets.chomp.to_i
unsorted = SortingAlgorithms.make_random_array(size)

start_time = Time.now
sorted = SortingAlgorithms.ruby_sort(unsorted.clone)
end_time = Time.now
puts "it took ruby_sort #{end_time - start_time} seconds to complete this sorting"

start_time = Time.now
if SortingAlgorithms.selection_sort(unsorted.clone) != sorted
  raise "bunda!"
end
end_time = Time.now
puts "it took selection_sort #{end_time - start_time} seconds to complete this sorting"

start_time = Time.now
if SortingAlgorithms.bubble_sort(unsorted.clone) != sorted
  raise "bunda!"
end
end_time = Time.now
puts "it took bubble_sort #{end_time - start_time} seconds to complete this sorting"

start_time = Time.now
if SortingAlgorithms.cocktail_sort(unsorted.clone) != sorted
  raise "bunda!"
end
end_time = Time.now
puts "it took cocktail_sort #{end_time - start_time} seconds to complete this sorting"

start_time = Time.now
if SortingAlgorithms.merge_sort(unsorted.clone) != sorted
  raise "bunda!"
end
end_time = Time.now
puts "it took merge_sort #{end_time - start_time} seconds to complete this sorting"
