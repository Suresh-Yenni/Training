students = [{ 'id' => 1, 'department' => 'a1', 'maths' => 43, 'physics' => 54, 'chemistry' => 65, 'year' => 2016 },
            { 'id' => 2, 'department' => 'a1', 'maths' => 66, 'physics' => 52, 'chemistry' => 65, 'year' => 2016 },
            { 'id' => 3, 'department' => 'a7', 'maths' => 87, 'physics' => 32, 'chemistry' => 43, 'year' => 2016 },
            { 'id' => 1, 'department' => 'a1', 'maths' => 21, 'physics' => 52, 'chemistry' => 65, 'year' => 2015 },
            { 'id' => 2, 'department' => 'a1', 'maths' => 68, 'physics' => 50, 'chemistry' => 65, 'year' => 2015 },
            { 'id' => 3, 'department' => 'a7', 'maths' => 85, 'physics' => 22, 'chemistry' => 43, 'year' => 2015 },
            { 'id' => 4, 'department' => 'a7', 'maths' => 21, 'physics' => 22, 'chemistry' => 13, 'year' => 2016 }]

COMPARE_KEYS_MARKS = %w(maths physics chemistry).freeze

def check_display(input_display)
  return false if input_display.empty?
  input_display.each do |display_name|
    return false if !COMPARE_KEYS_MARKS.include? display_name 
  end
  true
end

puts 'GROUP BY: id/department/year'
input_group_by = gets.chomp.downcase until !input_group_by.to_s.strip.empty? && (%w(id department year).include? input_group_by)

puts 'SORT BY: maths/physics/chemistry'
input_sort_by = gets.chomp.downcase until !input_sort_by.to_s.strip.empty? && (%w(maths physics chemistry).include? input_sort_by)

puts 'Display: maths, physics, chemistry'
while
  input_display_arr = gets.chomp.downcase.split(',').map(&:strip)
  break if (check_display(input_display_arr))
end

puts 'Year1'
year_1 = gets.chomp while year_1.to_s.strip.empty?

puts 'Year2'
year_2 = gets.chomp while year_2.to_s.strip.empty?

puts 'Should compare? true/false'
should_compare = gets.chomp.downcase while should_compare.to_s.strip.empty?


puts 'Should total? true/false'
should_total = gets.chomp.downcase while should_total.to_s.strip.empty?

def group_by_input_value(students, group_by_value)
  students.group_by { |student| student[group_by_value] }
end

def sort_by_input_value(students, sort_by_subject)
  students.each do |key, value|
    students[key] = value.sort_by { |subject| subject[sort_by_subject] }
  end
end

input_display_arr.insert(0, 'id') if input_display_arr.first != 'id'
input_display_arr.push(input_group_by) unless input_display_arr.include? input_group_by
input_display_arr.push('year') unless input_display_arr.include? 'year'

def total_marks(subject, display_array)
  print "Total\t\t"

  display_array.each do |subject_name|
    total = 0
    if COMPARE_KEYS_MARKS.include? subject_name
    subject.collect do |subject|
      total += subject[subject_name]
    end
    print "#{total}\t\t"
  end
  end
  print "\n"
end

def change_marks(subject, display_array, year_1, year_2)
  compare_year_1 = nil
  compare_year_2 = nil

  subject.each do |student|
    compare_year_1 = student if student['year'] == year_1.to_i && !student.nil?
    compare_year_2 = student if student['year'] == year_2.to_i && !student.nil?
  end

  print "Change\t\t"
  display_array.each do |subject_name|
    changed_marks = 0
    unless compare_year_1.nil?
      changed_marks = (changed_marks - compare_year_1[subject_name]).abs
    end
    unless compare_year_2.nil?
      changed_marks = (changed_marks - compare_year_2[subject_name]).abs
    end
    print "#{changed_marks}\t\t" if COMPARE_KEYS_MARKS.include? subject_name
  end
  print "\n"
end

def show_sorted_values(year_1, year_2, students, compare, total, display_array, input_group_by)
  students.keys.each do |value|
    students[value].each do |display|
      display_array.each do |subject|
        print "#{display[subject]}\t\t"
      end
      print "\n"
    end
    total_marks(students[value], display_array) if total == 'true'
    change_marks(students[value], display_array, year_1, year_2) if compare == 'true' && input_group_by == 'id'    
  end
end

input_display_arr.each { |header| print "#{header}\t\t" }
print "\n"

student_group_values = group_by_input_value(students, input_group_by)

student_sort_values = sort_by_input_value(student_group_values, input_sort_by)

show_sorted_values(year_1, year_2, student_sort_values, should_compare, should_total, input_display_arr, input_group_by)
