def bubble_sort(array)
  n = array.length
  loop do
    swapped = false
    (n - 1).times do |i|
      next if array[i] <= array[i + 1]

      array[i], array[i + 1] = array[i + 1], array[i]
      swapped = true
      puts array.inspect
    end
    break unless swapped
  end
  array
end
