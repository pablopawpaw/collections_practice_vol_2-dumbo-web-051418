def begins_with_r(array)
  r_array = []
  array.select do |word|
    case word.start_with?("r")
    when true 
      r_array << word
    when false 
    end  
  end
  array.size == r_array.size
end

def contain_a(array)
  a_array = []
  array.map do |word|
    case word.include?("a")
    when true 
      a_array << word
    end 
  end 
  a_array
end

def first_wa(array)
  array.find do |word|
    if(Symbol.all_symbols.include?(word))
    else
      word.start_with?("wa")
    end 
  end 
end

def remove_non_strings(array)
  array.select do |item|
    item.is_a? String
  end 
end

def count_elements(array)
  #count occurrences in array
  count = array.collect { |x|  array.count(x) }
  
  #remove dupes
  i = 0 
  while i < array.length do 
    if count[i] > 1 
      array.delete_at(i)
      count.delete_at(i)
    end
    i+=1
  end 
  
  #reflect freq in orig array within hashes per test params
  i = 0 
  while i < count.length do 
    array[i][:count] = count[i]
    i+=1
  end 

  #return
  array
end

def merge_data(data1, data2)
  
#firstname ASHLEY
a_hash = {}
data1.each do |k|
  a_hash = k
end 

#rest of key/pairs ASHLEY
a_v_hash = {}
data2.each do |k|
  a_v_hash = k.values[1]
end 

#merged ASHLEY
a_m_hash = {}
a_m_hash = a_hash.merge(a_v_hash)

#firstname BLAKE
b_hash = {}
b_hash = data1[0]

#rest of key/pairs BLAKE
b_v_hash = {}
data2.each do |k|
  b_v_hash = k.values[0]
end 

#merged BLAKE
b_m_hash = {}
b_m_hash = b_hash.merge(b_v_hash)

#finished BLAKE and ASHLEY
array = []
array.push(b_m_hash,a_m_hash)
array
end

def find_cool(data)
  cool_hash = {}
  cool_array = []
i = 0 
while i < data.length do 
  if (data[i][:temperature] =~ /cool/) == 0 
    cool_hash = data[i]
  end 
  i+=1
end 
cool_array << cool_hash
cool_array
end 

def organize_schools(schools)
  
#got the cities from data hash into an array
cities_array = []
schools.each do |k,v|
  cities_array << v.values
end 
cities_array = cities_array.uniq.flatten

#made cities string keys to an array inside hash 
new_hash = {}
i = 0 
while i < cities_array.length do 
  new_hash[cities_array[i].to_s] = []
  i+=1
end 

#added schools in NYC to the hash 
schools.each do |k,v|
  if v[:location] == cities_array[0]
    new_hash[cities_array[0]] << k
  end 
end 

#added schools in SF to the hash 
schools.each do |k,v|
  if v[:location] == cities_array[1]
    new_hash[cities_array[1]] << k
  end 
end 

#added schools in Chicago to the hash 
schools.each do |k,v|
  if v[:location] == cities_array[2]
    new_hash[cities_array[2]] << k
  end 
end 

new_hash
end 