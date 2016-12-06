students = [
{
	"id" => 1,
	"department" => "a1",
	"maths" => 43,
	"physics" => 54,
	"chemistry" => 65,
	"year" => 2016
},
{
	"id" => 2,
	"department" => "a1",
	"maths" => 66,
	"physics" => 52,
	"chemistry" => 65,
	"year" => 2016
},
{
	"id" => 3,
	"department" => "a7",
	"maths" => 87,
	"physics" => 32,
	"chemistry" => 43,
	"year" => 2016
},
{
	"id" => 1,
	"department" => "a1",
	"maths" => 21,
	"physics" => 52,
	"chemistry" => 65,
	"year" => 2015
},
{
	"id" => 2,
	"department" => "a1",
	"maths" => 68,
	"physics" => 50,
	"chemistry" => 65,
	"year" => 2015
},
{
	"id" => 3,
	"department" => "a7",
	"maths" => 85,
	"physics" => 22,
	"chemistry" => 43,
	"year" => 2015
},
{
	"id" => 4,
	"department" => "a7",
	"maths" => 21,
	"physics" => 22,
	"chemistry" => 13,
	"year" => 2016
}
]

COMPARE_KEYS_MARKS = ['maths', 'physics', 'chemistry']
puts "GROUP BY: id/department/year"
g = gets.chomp 

puts "SORT BY: maths/physics/chemistry"
s =  gets.chomp 

puts "Display: maths,physics,chemistry"
d = gets.chomp 

dis_arr = d.split(",")

puts "Year1"
year1 = gets.chomp.to_i

puts "Year2"
year2 = gets.chomp.to_i

puts "Should compare? true/false"
sc = gets.chomp
puts "Should total? true/false"
tt = gets.chomp

dis_arr.insert(0, 'id') if dis_arr.first != 'id'
dis_arr.push(g) if !dis_arr.include? g

group_values = students.group_by {|x| x[g] }


	dis_arr.each{|x| print "#{x}\t\t"}
	print "\n"


	compare_values = students.group_by {|l| l[g]}
	compare_values.each do |key,value|
		 compare_values[key] = value.sort_by{ |x| x[s]} 
	end

	compare_values.each do |key, value|

		value.each do |k,v|
			dis_arr.each do |x|
				print "#{k[x]}\t\t"
			end
			print "\n"
		end
		if tt == 'true'
			print "Total\t\t"
			dis_arr.each do |y|
				s=0
				if COMPARE_KEYS_MARKS.include? y
				value.collect do |x|  
					s = s + x[y]
					
				end
				print "#{s}\t\t"
				end
				
			end
			print "\n"
		end
		if g == 'id' && sc == 'true'
				
				compare_year1 = nil
				compare_year2 = nil
				
				for i in 0...value.length
					compare_year1 = value[i] if value[i]['year']  == year1 && !value[i].nil?
					compare_year2 = value[i] if value[i]['year'] == year2 && !value[i].nil?

				end
				print "Change\t\t"
				dis_arr.each do |x|

					compare_marks = 0
					if !compare_year1.nil?
						compare_marks = (compare_marks-compare_year1[x]).abs 
					end
					if !compare_year2.nil?
						compare_marks = (compare_marks-compare_year2[x]).abs 
					end
					print "#{compare_marks}\t\t" if COMPARE_KEYS_MARKS.include? x
				end
				print "\n"
			end
		
	end


	