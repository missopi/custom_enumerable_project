# frozen_string_literal: true

# custom versions of enumerable methods that already exist
module Enumerable
  def my_each_with_index
    i = 0
    while i < length
      yield self[i], i
      i += 1
    end
    self
  end

  def my_all?
    my_each { |item| return false unless yield item }
    true
  end

  def my_none?
    my_each { |item| return false if yield item }
    true
  end

  def my_any?
    my_each { |item| return true if yield item }
    false
  end

  def my_count
    return length unless block_given?

    count = 0
    my_each { |item| count += 1 if yield item }
    count
  end

  def my_select
    new_array = []
    my_each { |item| new_array.push(item) if yield item }
    new_array
  end

  def my_map
    new_array = []
    my_each { |item| new_array.push(yield item) }
    new_array
  end
end

# Methods defined in your enumerable module have access to this method
class Array
  # custom version of .each method
  def my_each
    i = 0
    while i < length
      yield self[i]
      i += 1
    end
    self
  end
end
