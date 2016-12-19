//-----------------------------Student part---------------------------
var Student = Backbone.Model.extend({
  default:{
    regid: null,
    dept: "dept",
    maths: null,
    physics: null,
    chemistry: null,
    year:  null
  }
});

var studentCollection = Backbone.Collection.extend({
  model: Student,
  localStorage: new Store("backbone-todo")
});

var student = new studentCollection();
student.fetch();


var eachRow = Backbone.View.extend({
  template: _.template($("#stu_temp").html()),
  render: function(){
        this.$el.html(this.template(this.model.toJSON()));
        return this;
    }
})

var studentView = Backbone.View.extend({
    el: $("#display"),
    render: function(){
      student.each (function(row){
        var s_view = new eachRow({model:row});
        this.$el.append(s_view.render().el)
      },this);
      return this;
    }
});
//-----------------------------------------------------------

//----------------------------College part------------------
var College = Backbone.Model.extend({
  default:{
    name: "",
    establish:  null
  }
});

var collegeCollection = Backbone.Collection.extend({
  model: College,
  localStorage: new Store("backbone-college")
});

var college = new collegeCollection();
college.fetch();


var col_eachRow = Backbone.View.extend({
  template: _.template($("#col_temp").html()),
  render: function(){
      this.$el.html(this.template(this.model.toJSON()));
      return this;
    }
})

var collegeView = Backbone.View.extend({
    el: "#display",
    render: function(){
      college.each (function(row){
        var c_view = new col_eachRow({model:row});
        this.$el.append(c_view.render().el)
      },this);
      return this;
    }
});
//------------------------------------------------------------


//--------------------------Application start------------------
var App_start = Backbone.View.extend({
  el:$("#left"),
  events:{
    "click #substu ":"save_student",
    "click #stuview ":"student_view",
    "click #subcol ":"save_college",
    "click #colview ":"college_view"
  },
  student_view:function(){
    $("#display").empty();
    var result = new studentView(student);
    $(document.body).append(result.render().el);
  },
  save_student:function(e){
      var row = new Student({
      regid: parseInt($("#regid").attr("value")),
      dept: $("#dept").attr("value"),
      maths: parseInt($("#maths").attr("value")),
      physics: parseInt($("#physics").attr("value")),
      chemistry: parseInt($("#chemistry").attr("value")),
      year: parseInt($("#year").attr("value"))
    });
    student.create(row);
    this.student_view();
    document.getElementById("regid").value="";
    document.getElementById("dept").value="";
    document.getElementById("maths").value="";
    document.getElementById("physics").value="";
    document.getElementById("chemistry").value="";
    document.getElementById("year").value="";
  },
  college_view:function(){
    $("#display").empty();
    var result = new collegeView(college);
    $(document.body).append(result.render().el);
  },
  save_college:function(e){
      var row = new College({
      name: $("#name").attr("value"),
      establish: parseInt($("#establish").attr("value"))
    });
    college.create(row);
    this.college_view();
    document.getElementById("name").value="";
    document.getElementById("establish").value="";
  }
});
//------------------------------------------------------

var start = new App_start();
