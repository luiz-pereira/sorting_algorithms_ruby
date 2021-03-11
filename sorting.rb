require 'pry'

class SortingAlgorithms
  class << self
    def make_random_array(size)
      (1..size).to_a.shuffle
    end

    def selection_sort(size)
      unsorted = make_random_array(size)
      sorted_point = 0
      while sorted_point < size - 1
        current_min = size + 1
        for i in sorted_point..(size - 1)
          if current_min > unsorted[i]
            current_min = unsorted[i]
            min_index = i
          end
        end
        unsorted[sorted_point], unsorted[min_index] = unsorted[min_index], unsorted[sorted_point]
        sorted_point += 1
      end
      puts unsorted
    end
  end
end

puts "
  select a sorting algorithm:\n
  1 - Selection Sort\n
  2 - Bubble Sort\n
  3 - Cocktail-shaker Sort\n
  4 - Merge Sort\n
"
selection = gets.chomp.to_i
puts "give an array size"
size = gets.chomp.to_i
start_time = Time.now
case selection
when 1
  SortingAlgorithms.selection_sort(size)
when 2
  SortingAlgorithms.selection_sort(size)
when 3
  SortingAlgorithms.selection_sort(size)
when 4
  SortingAlgorithms.selection_sort(size)
end
end_time = Time.now
puts "it took #{end_time - start_time} seconds to complete this shitty sorting"