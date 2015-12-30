$(function() {

//salary chart
  var salary_chart = $("#salary_chart").get(0).getContext("2d");
  var new_salary_chart = new Chart(salary_chart);

  var s_data = {
        labels: xaxis,
        datasets: [
            {
                label: "",
                type: "bar",
                fillColor: "RGBA(36, 42, 59, 1)",
                strokeColor: "rgba(220,220,220,1)",
                pointColor: "rgba(220,220,220,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,220,1)",
                data: salary_yaxis
            },
            {
                label: "With Student Loan Payment",
                type: "bar",
                fillColor: "RGBA(204, 177, 152, 1)",
                strokeColor: "rgba(220,220,220,1)",
                pointColor: "rgba(220,220,220,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,220,1)",
                data: student_loan_pmt
            }
        ]
    };

  new Chart(salary_chart).Overlay(s_data, {
     scaleLabel:
      function(label){return  '$' + label.value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") },
     scaleFontSize: 10,
     scaleBeginAtZero : false
  })

//open housing
  var open_housing_data = {
        labels: xaxis,
        datasets: [
            {
                label: "",
                type: "bar",
                fillColor: "RGBA(125, 37, 51, 1)",
                strokeColor: "RGBA(125, 37, 51, 1)",
                pointColor: "rgba(220,220,220,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,220,1)",
                data: open_housing_yaxis
            },
            {
               label: "National Average",
               type: "line",
               fillColor: "rgba(151,187,205,0.5)",
               strokeColor: "rgba(151,187,205,0.8)",
               highlightFill: "rgba(151,187,205,0.75)",
               highlightStroke: "rgba(151,187,205,1)",
               data: [88,88,88,88,88,88]
            }
        ]
    };

  var new_open_housing = new

  Chart($("#open_housing").get(0).getContext("2d")).Overlay(open_housing_data, {scaleLabel: "<%=value + '%' %>", scaleFontSize: 10, scaleBeginAtZero : false });

//unemployment Polar Area chart
  var unemployment_chart = $("#unemployment").get(0).getContext("2d");
  var new_unemployment_chart = new Chart(unemployment_chart);

  var unemployment = {
    labels: xaxis,
    datasets: [
        {
            label: "",
            type: "line",
            fillColor: "RGBA(79, 74, 72, 1)",
            strokeColor: "rgba(220,220,220,1)",
            pointColor: "rgba(220,220,220,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(220,220,220,1)",
            data: unemployment_data
        },
        {
           label: "National Average",
           type: "line",
           fillColor: "rgba(151,187,205,0.5)",
           strokeColor: "rgba(151,187,205,0.8)",
           highlightFill: "rgba(151,187,205,0.75)",
           highlightStroke: "rgba(151,187,205,1)",
           data: [7.2, 7.2, 7.2, 7.2, 7.2, 7.2 ]
        }
    ]
  };

  new Chart(unemployment_chart).Overlay(unemployment, {
    pointDot: true, scaleLabel: "<%=value + '%' %>", scaleFontSize: 10 });

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

  new Chart(hours_worked_chart).Line(hours_data, {scaleFontSize: 10 });

//industry list

  var list_options = {
    valueNames: [ 'name', 'rank' ]
  };

  var userList = new List('industries-list', list_options);

  //housing cost
  var housing_cost = {
        labels: xaxis,
        datasets: [
            {
                label: "",
                type: "line",
                fillColor: "RGBA(250, 203, 112, 1)",
                strokeColor: "RGBA(125, 37, 51, 1)",
                pointColor: "rgba(220,220,220,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,220,1)",
                data: housing_cost_data
            },
            {
               label: "National Average",
               type: "line",
               fillColor: "RGBA(89, 89, 95, )",
               strokeColor: "rgba(151,187,205,0.8)",
               highlightFill: "rgba(151,187,205,0.75)",
               highlightStroke: "rgba(151,187,205,1)",
               data: [173900,173900,173900,173900,173900,173900]
            }
        ]
    };

  var new_housing_cost = new

  Chart($("#housing_cost").get(0).getContext("2d")).Overlay(housing_cost, {
    scaleLabel:
      function(label){return  '$' + label.value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") },
       scaleFontSize: 10,
       scaleBeginAtZero : false
  });

});




