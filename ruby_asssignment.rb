students = [{"id" => 1,"department" => "a1","maths" => 43,"physics" => 54,"chemistry" => 65,"year" => 2016},
{"id" => 2,"department" => "a1","maths" => 66,"physics" => 52,"chemistry" => 65,"year" => 2016},
{"id" => 3,"department" => "a7","maths" => 87,"physics" => 32,"chemistry" => 43,"year" => 2016},
{"id" => 1,"department" => "a1","maths" => 21,"physics" => 52,"chemistry" => 65,"year" => 2015},
{"id" => 2,"department" => "a1","maths" => 68,"physics" => 50,"chemistry" => 65,"year" => 2015},
{"id" => 3,"department" => "a7","maths" => 85,"physics" => 22,"chemistry" => 43,"year" => 2015},
{"id" => 4,"department" => "a7","maths" => 21,"physics" => 22,"chemistry" => 13,"year" => 2016}]

puts "GROUP BY: id/department/year"
input_group_by = gets.chomp until !input_group_by.to_s.strip.empty?


puts "SORT BY: maths/physics/chemistry"
input_sort_by =  gets.chomp until !input_sort_by.to_s.strip.empty?



puts "Display: maths,physics,chemistry"
input_display = gets.chomp  until !input_display.to_s.strip.empty?




puts "Year1"
year1 = gets.chomp until !year1.to_s.strip.empty?



puts "Year2"
year2 = gets.chomp until !year2.to_s.strip.empty?



puts "Should compare? true/false"
should_compare = gets.chomp until !should_compare.to_s.strip.empty?



puts "Should total? true/false"
should_total = gets.chomp until !should_total.to_s.strip.empty?

input_display_arr = input_display.split(",")

COMPARE_KEYS_MARKS = ['maths', 'physics', 'chemistry']

def group_by_input_value(student_arr, group_by_value)
	student_arr.group_by {|student| student[group_by_value] }
end

def sort_by_input_value(student_arr, sort_by_subject)
	student_arr.each do |key,value|
		student_arr[key] = value.sort_by{ |subject| subject[sort_by_subject]} 
	end
end

input_display_arr.insert(0, 'id') if input_display_arr.first != 'id'
input_display_arr.push(input_group_by) if !input_display_arr.include? input_group_by

student_group_values = group_by_input_value(students, input_group_by)
# puts student_group_values

def total_marks(subject, display_array)
	print "Total\t\t"

	display_array.each do |subject_name|
		total = 0
		if COMPARE_KEYS_MARKS.include? subject_name
			subject.collect do |subject|
				total = total + subject[subject_name]
			end
			print "#{total}\t\t"
		end
	end
	print "\n"
end

def change_marks(subject, display_array, year1, year2)
	compare_year1 = nil
	compare_year2 = nil
	for i in 0...subject.length
			compare_year1 = subject[i] if subject[i]['year']  == year1.to_i && !subject[i].nil?
			compare_year2 = subject[i] if subject[i]['year'] == year2.to_i && !subject[i].nil?
	end	
	print "Change\t\t"
	display_array.each do |subject_name|
		changed_marks = 0
		if !compare_year1.nil?
			changed_marks = (changed_marks - compare_year1[subject_name]).abs
		end
		if !compare_year2.nil?
			changed_marks = (changed_marks - compare_year2[subject_name]).abs 
		end
		print "#{changed_marks}\t\t" if COMPARE_KEYS_MARKS.include? subject_name
	end
	print "\n"
end

def show_sorted_values(year1, year2, student_arr, compare, total, display_array, input_group_by)
	student_arr.each do |key, value|
		value.each do |display, fields|
			display_array.each do |subject|
				print "#{display[subject]}\t\t"
			end
			print "\n"
		end
		total_marks(value, display_array) if total == 'true'
		change_marks(value, display_array, year1, year2) if compare == 'true' && !input_group_by == 'id'
	end
end

input_display_arr.each{|header| print "#{header}\t\t"}
print "\n"

student_sort_values = sort_by_input_value(student_group_values, input_sort_by)
	
show_sorted_values(year1, year2, student_sort_values, should_compare, should_total, input_display_arr, input_group_by)
	