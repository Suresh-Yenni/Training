require 'rails_helper'

RSpec.describe Student, type: :models do
  context 'When testing Student model class' do
    it 'Should return total_marks and marks_change when compute_change_and_total! method is called' do
      total_marks = {}
      marks_change = {}
      student = {
        1 => [{'regid' => 1, 'maths' => 1, 'physics' =>  2,'chemistry' => 3, 'year' => 2016},
              {'regid' => 1, 'maths' => 1, 'physics'=>  2,'chemistry' => 3, 'year' => 2015}],
        3 => [{'regid' => 3, 'maths' => 1, 'physics'=>  2,'chemistry' => 3, 'year' => 2016},
              {'regid' => 3, 'maths' => 1, 'physics' =>  2,'chemistry' => 3, 'year' => 2015}]
      }
      
      total_marks, marks_change = Student.compute_change_and_total!(total_marks, marks_change, student, 2016, 2015, "true")
      expect(total_marks).to eq({1 => {'maths' => 2, 'physics' => 4, 'chemistry' => 6 },
                                        3 => {'maths' => 2, 'physics' => 4, 'chemistry' => 6 }})
      expect(marks_change).to eq({1 => {'maths' => 0, 'physics' => 0, 'chemistry' => 0 },
                                         3 => {'maths' => 0, 'physics' => 0, 'chemistry' => 0 }})
    end
  end
end
