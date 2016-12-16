namespace :update_value do
  desc 'update value to extented_sid in student table'

  task update_extended_sid_value: :environment do
    # binding.pry
    students = Student.all
    clg_names = []
    students.each { |student| clg_names.push(student.college.name) }
    details = students.zip(clg_names)
    details.each do |stu, name|
      stu.update_attribute :extended_sid, "#{stu.regid}_#{name[0...2]}"
    end
  end
end
