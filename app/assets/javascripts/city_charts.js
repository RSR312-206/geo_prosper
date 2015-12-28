$(function() {

//salary charts - comparing all cities by salary
  var salary_chart = $("#salary_chart").get(0).getContext("2d");
  var new_salary_chart = new Chart(salary_chart);

//salary chart colors and data
  var s_data = {
        labels: xaxis,
        datasets: [
            {
                label: "",
                fillColor: "RGBA(82, 87, 133, 1)",
                strokeColor: "rgba(220,220,220,1)",
                pointColor: "rgba(220,220,220,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,220,1)",
                data: salary_yaxis
            },
        ]
    };

//salary chart constrcutror instatiation and type= Bar.
  new Chart(salary_chart).Bar(s_data, {
     scaleLabel:
      function(label){return  '$' + label.value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")},
     scaleFontSize: 10
  });

  //open housing
  var open_housing_chart = $("#open_housing").get(0).getContext("2d");
  var new_open_housing = new Chart(open_housing_chart);


  //salary chart colors and data
  var open_housing_data = {
        labels: xaxis,
        datasets: [
            {
                label: "",
                fillColor: "RGBA(125, 37, 51, 1)",
                strokeColor: "RGBA(125, 37, 51, 1)",
                pointColor: "rgba(220,220,220,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,220,1)",
                data: open_housing_yaxis
            },
        ]
    };

  new Chart(open_housing_chart).Bar(open_housing_data, {scaleLabel: "<%=value + '%' %>", scaleFontSize: 10 });

  //unemployment Polar Area chart
  var unemployment_chart = $("#unemployment").get(0).getContext("2d");
  var new_unemployment_chart = new Chart(unemployment_chart);

  var unemployment = {
    labels: xaxis,
    datasets: [
        {
            label: "",
            fillColor: "RGBA(79, 74, 72, 1)",
            strokeColor: "rgba(220,220,220,1)",
            pointColor: "rgba(220,220,220,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(220,220,220,1)",
            data: unemployment_data
        }
    ]
  };

  new Chart(unemployment_chart).Bar(unemployment, {
    pointDot: false, scaleLabel: "<%=value + '%' %>", scaleFontSize: 10 });

// hours worked by city

  var hours_worked_chart = $("#hours-worked").get(0).getContext("2d");
  var new_hours_worked_chart = new Chart(hours_worked_chart)

  var hours_data = {
    labels: xaxis,
    datasets: [
      {
          label: "My First dataset",
          fillColor: "RGBA(83, 132, 122, 1)",
          strokeColor: "rgba(220,220,220,1)",
          pointColor: "rgba(220,220,220,1)",
          pointStrokeColor: "#fff",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "rgba(220,220,220,1)",
          data: hours_worked_data
      }
    ]
};

  console.log(hours_worked_data)


  new Chart(hours_worked_chart).Line(hours_data, {scaleFontSize: 10});

//industry list
var list_options = {
  valueNames: [ 'name', 'rank' ]
};

var userList = new List('industries-list', list_options);
});




