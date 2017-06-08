['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def find_longest(array)
  longest = array[0]

  array.each do |ele|
    if ele.size > longest
      longest = ele
    end
  end
end

def self.merge_sort (array, &prc)
  return array if array.length <= 1

  mid_idx = array.length / 2
  merge(
    merge_sort(array.take(mid_idx), &prc),
    merge_sort(array.drop(mid_idx), &prc),
    &prc
  )
end

# NB: In Ruby, shift is an O(1) operation. This is not true of all languages.
def self.merge(left, right, &prc)
  merged_array = []
  prc = Proc.new { |num1, num2| num1 <=> num2 } unless block_given?
  until left.empty? || right.empty?
    case prc.call(left.first, right.first)
    when -1
      merged_array << left.shift
    when 0
      merged_array << left.shift
    when 1
      merged_array << right.shift
    end
  end

  merged_array + left + right
end
