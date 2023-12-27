puts "Please choose an option:"
puts "1. Reverse the name"
puts "2. Quicksort"
puts "3. LSD sort"
choice = gets.chomp

case choice
when "1"
 puts "#{name} spelled backwards is #{name.reverse}"
when "2"
 # Implement Quicksort here
 # Note: Quicksort is typically used on arrays, not strings
def quicksort(array)
 return array if array.length <= 1

 pivot = array.sample
 left = array.select { |x| x < pivot }
 middle = array.select { |x| x == pivot }
 right = array.select { |x| x > pivot }

 quicksort(left) + middle + quicksort(right)
end
when "3"
 # Implement LSD sort here
 # Note: LSD sort is typically used for sorting integers, not strings
def counting_sort(arr, exp)
 n = arr.length
 output = Array.new(n)
 count = Array.new(10, 0)

 arr.each do |i|
   index = (i / exp).to_i % 10
   count[index] += 1
 end

 (1..9).each do |i|
   count[i] += count[i - 1]
 end

 (n - 1).downto(0) do |i|
   index = (arr[i] / exp).to_i % 10
   output[count[index] - 1] = arr[i]
   count[index] -= 1
 end

 output
end

def radixsort(arr)
 max_val = arr.max
 exp = 1

 while max_val / exp > 0
   arr = counting_sort(arr, exp)
   exp *= 10
 end

 arr
end
else
 puts "Invalid choice."
end