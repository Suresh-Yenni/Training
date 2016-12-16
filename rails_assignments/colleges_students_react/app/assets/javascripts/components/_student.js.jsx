var Students = React.createClass({

  getInitialState : function() {
      return {
        student : {},
        marks_change: {},
        total_marks: {},
        display:[],
        index: -1,
        group_on : ""
      };
      
  },
  handleFilter(){

      var display_fields = [];
      if ($("#maths").is(':checked')) display_fields.push("maths");
      if ($("#chemistry").is(':checked')) display_fields.push("chemistry");
      if ($("#physics").is(':checked')) display_fields.push("physics");
      $.ajax({
          url:  '/home/filter',
          type: 'POST',
          data: { group: this.refs.group.value,
                  sort: this.refs.sort.value,
                  display: display_fields,
                  year1: this.refs.year1.value,
                  year2: this.refs.year2.value,
                  total: this.refs.total.value
                  },
          timeout: 5000,
          success:function(result){ this.setState({
                    student: result[0],
                    marks_change: result[1],
                    total_marks: result[2],
                    display: result[3],
                    index: -1,
                    group_on: this.refs.group.value
                  }) }.bind(this),
          dataType: 'JSON',
          error: function(xhr, textStatus, errorThrown){
                     alert("Error Occurred: No search done");
                  }
      });
  },
  
  render(){
   
      return( <div>
                <p> GROUP BY </p>
                <select ref="group" >
                      <option value="regid">Reg.ID</option>
                      <option value="dept">Department</option>
                      <option value="year">Year</option>
                </select>
                <p> SORT BY </p>
                <select ref="sort" >
                      <option value="maths">Maths</option>
                      <option value="physics">Physics</option>
                      <option value="chemistry">Chemistry</option>
                </select>
                <p> DISPLAY </p>
                    Maths<input type="checkbox" value="maths" id="maths" /> | 
                    Physics<input type="checkbox" value="physics" id="physics" /> | 
                    Chemistry<input type="checkbox" value="chemistry" id="chemistry" />
                <p>
                    <input type="text" ref="year1" placeholder="Year1" defaultValue="2016"/>
                    --COMPARISON--
                    <input type="text" ref="year2" placeholder="Year2" defaultValue="2015"/>
                </p>
                <p> TOTAL </p>
                <select ref="total" >
                      <option value="true">Yes</option>
                      <option value="false">No</option>
                </select>
                <p><button className="press" onClick={this.handleFilter}>Filter</button></p>
                <div>
                    {Object.keys(this.state.student).map((key) => <Table 
                                    group_id = {key}
                                    student = {this.state.student}
                                    display = {this.state.display}
                                    total_marks = {this.state.total_marks}
                                    marks_change = {this.state.marks_change}
                                    group_on = {this.state.group_on}
                                    index = {++this.state.index}/>)}
                </div>
              </div>);
  }
});
