class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  COMPARE_KEYS_MARKS = ['maths', 'physics', 'chemistry']
  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def filter
    students = Student.all
    
    @dis_arr = params[:d].split(",")
    @dis_arr.insert(0, 'student_id') if @dis_arr.first != 'student_id'
      @dis_arr.push(params[:q]) if !@dis_arr.include? params[:q]
    # puts @dis_arr
    @total_marks = []
    @change_marks = [] 
    @students = [] 
    @stud = Student.compute(params,@total_marks,@change_marks, @students)
    # puts @total_marks
    puts "\n"
    @total_marks.each do |key,value|
      puts key
      # value.each do |k,v|
      #   puts k
      # end
    end
    

    # # puts @stud
    # puts @total_marks.each { |x| print "#{x}\t"}
      
      
    
    # new_students = []
    # @group_values = students.group_by  {|x| x[params[:q]] }
    # @dis_arr.insert(0, 'student_id') if @dis_arr.first != 'student_id'
    # @dis_arr.push(params[:q]) if !@dis_arr.include? params[:q]

    # @group_values.each do |key,value|
    #    @group_values[key] = value.sort_by{ |x| x[params[:s]]} 
    # end
    # @dis_arr.each{|x| print "#{x}\t\t"}
    #   print "\n"
    # @group_values.each do |key, value|

    #     value.each do |k,v|
    #       @dis_arr.each do |x|
    #         print "#{k[x]}\t\t"
    #       end
    #       print "\n"
    #     end
    #     if params[:t] == 'true'
    #       print "Total\t\t"
    #       @dis_arr.each do |y|
    #         s=0
    #         if COMPARE_KEYS_MARKS.include? y
    #         value.collect do |x|  
    #           s = s + x[y]
    #         end
    #         print "#{s}\t\t"
    #         end 
    #     end
    #   print "\n"
    # end
    # if params[:q] == 'student_id' && params[:sc] == 'true'
        
    #     compare_year1 = nil
    #     compare_year2 = nil
        
    #     for i in 0...value.length
    #       compare_year1 = value[i] if value[i]['year']  == params[:year1] && !value[i].nil?
    #       compare_year2 = value[i] if value[i]['year'] == params[:year2] && !value[i].nil?

    #     end
    #     print "Change\t\t"
    #     @dis_arr.each do |x|

    #       compare_marks = 0
    #       if !compare_year1.nil?
    #         compare_marks = (compare_marks-compare_year1[x]).abs 
    #       end
    #       if !compare_year2.nil?
    #         compare_marks = (compare_marks-compare_year2[x]).abs 
    #       end
    #       print "#{compare_marks}\t\t" if COMPARE_KEYS_MARKS.include? x
    #     end
    #     print "\n"
    #   end
    
    # end
    # @test1 = students.group_by  {|x| x[params[:q]] }
    # if params[:sc] != 'true'
    #   @test1.each do |key,value|
    #     value.each do |k,v|
    #     new_students << k if k['year'] == params[:y].to_i
    #     end 
       
    # end
    # @test1 = sort(new_students, params[:s])
    # else
    #   @test1.each do |key,value|
    #      @test1[key] =  sort(value, params[:s])     
    # end
    # @dis_arr.push('year')
  # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:student_id, :department, :maths, :physics, :chemistry, :year, :college_id)
    end

end
