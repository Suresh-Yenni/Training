class Student < ApplicationRecord
	belongs_to :college, foreign_key: "college_id"
	COMPARE_KEYS_MARKS = ['maths', 'physics', 'chemistry']

	def self.compute (params,total_marks,change_marks,students)
		students = Student.all
		dis_arr = params[:d].split(",")
		 @group_values = students.group_by  {|x| x[params[:q]] }
    	dis_arr.insert(0, 'student_id') if dis_arr.first != 'student_id'
    	dis_arr.push(params[:q]) if !dis_arr.include? params[:q]





		# dis_arr.each{|x| print "#{x}\t\t"}
		# print "\n"

		@group_values.each do |key,value|
			 @group_values[key] = value.sort_by{ |x| x[params[:s]]} 
		end

		students = @group_values
		# puts students
		@group_values.each do |key,value|

			value.each do |k,v|
				dis_arr.each do |x|
					# print "#{k[x]}\t\t"
				end	
				# print "\n"
			end

			if params[:t] == 'true'
				# print "Total\t\t"
				dis_arr.each do |y|
					marks_total = 0
					if COMPARE_KEYS_MARKS.include? y
						value.collect do |x|
							marks_total = marks_total + x[y]
						end
						total_marks << ({key => {y => marks_total}})
						# print "#{marks_total}\t\t"
					end
					
				end
				# print "\n"
			end #dsaasd

			if params[:q] == 'student_id' && params[:sc] == 'true'
				compare_year1 = nil
				compare_year2 = nil
				for i in 0...value.length
					compare_year1 = value[i] if value[i]['year']  == params[:year1].to_i && !value[i].nil?
					compare_year2 = value[i] if value[i]['year'] == params[:year2].to_i && !value[i].nil?
				end
				# print "Change\t\t"
				dis_arr.each do |x|
						compare_marks = 0
					
						compare_marks = (compare_marks-compare_year1[x]).abs if !compare_year1.nil?
						compare_marks = (compare_marks-compare_year2[x]).abs if !compare_year2.nil?
					
					# print "#{compare_marks}\t\t" if COMPARE_KEYS_MARKS.include? x
					change_marks.push ({key => {x => compare_marks}}) if COMPARE_KEYS_MARKS.include? x
				end
				# print "\n"
			end

		end
   	end
end
 