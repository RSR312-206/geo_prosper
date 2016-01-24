$(function() {

//function to match the national data in the charts to the length of the x axis data
function fillArray(value, len) {
  var data = [];
  for (var i = 0; i < len; i++) {
    data.push(value);
  }
  return data;
}

//salary chart
  var salary_chart = $("#salary_chart").get(0).getContext("2d");
  var new_salary_chart = new Chart(salary_chart);

  var s_data = {
        labels: xaxis,
        datasets: [
            {
                label: "Average Salary By City",
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
  var overlayChart = new
  Chart(salary_chart).Overlay(s_data, {
     scaleFontSize: 0,
     scaleShowLabels: false,
     scaleBeginAtZero: false,
     multiTooltipTemplate : function (label) {
      return label.datasetLabel + ': $' + label.value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
  })


//open housing

  var open_housing_data = {
        labels: xaxis,
        datasets: [
            {
                label: "Open Housing by City",
                type: "bar",
                fillColor: "RGBA(125, 37, 51, 1)",
                strokeColor: "RGBA(125, 37, 51, 1)",
                pointColor: "RGBA(34, 40, 48, 1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,220,1)",
                data: open_housing_yaxis
            },
            {
               label: "National Average",
               type: "line",
               fillColor: "rgba(220,220,220,0)",
               pointColor: "RGBA(34, 40, 48, 1)",
               strokeColor: "RGBA(34, 40, 48, 1)",
               highlightFill: "RGBA(255, 255, 255, 1)",
               highlightStroke: "rgba(151,187,205,1)",
               data: fillArray(88, xaxis.length)
            }
        ]
    };

  var new_open_housing = new

  Chart($("#open_housing").get(0).getContext("2d")).Overlay(open_housing_data,
    {
      scaleShowLabel: false,
      scaleFontSize: 0,
      scaleBeginAtZero: false,
      multiTooltipTemplate : function (label) {
      return label.datasetLabel + ': ' + label.value.toString() + '%';
      }
    });

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
            pointColor: "RGBA(93, 129, 121, 1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(220,220,220,1)",
            data: unemployment_data
        },
        {
           label: "National Average",
           type: "line",
           fillColor: "rgba(220,220,220,0)",
           pointColor: "RGBA(93, 129, 121, 1)",
           strokeColor: "RGBA(34, 40, 48, 1)",
           highlightFill: "rgba(151,187,205,0.75)",
           highlightStroke: "rgba(151,187,205,1)",
           data: fillArray(7.2, xaxis.length)
        }
    ]
  };

  new Chart(unemployment_chart).Overlay(unemployment, {
    pointDot: true,
    scaleShowLabel: false,
    scaleFontSize: 0,
    multiTooltipTemplate : function (label) {
      return label.datasetLabel + ': ' + label.value.toString() + '%';
    }
  });

// hours worked by city
  var hours_worked_chart = $("#hours-worked").get(0).getContext("2d");
  var new_hours_worked_chart = new Chart(hours_worked_chart)

  var hours_data = {
    labels: xaxis,
    datasets: [
      {
          label: "Average Hours Worked",
          type: "line",
          fillColor: "RGBA(83, 132, 122, 1)",
          strokeColor: "rgba(220,220,220,1)",
          pointColor: "RGBA(34, 40, 48, 1)",
          pointStrokeColor: "#fff",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "rgba(220,220,220,1)",
          data: hours_worked_data
      },
      {
          label: "National Average",
          type: "line",
          fillColor: "rgba(220,220,220,0)",
          pointColor: "RGBA(34, 40, 48, 1)",
          strokeColor: "RGBA(34, 40, 48, 1)",
          pointStrokeColor: "#fff",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "rgba(220,220,220,1)",
          data: fillArray(38.6, xaxis.length)
      }
    ]
};

  new Chart(hours_worked_chart).Line(hours_data, {
    scaleFontSize: 0,
    scaleBeginAtZero: false,
    scaleShowLabel: false,
    multiTooltipTemplate : function (label) {
      return label.datasetLabel + ': ' + label.value.toString() + ' hours';
    }
  });

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
                pointColor: "RGBA(34, 40, 48, 1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "RGBA(245, 202, 120, 1)",
                data: housing_cost_data
            },
            {
              label: "National Average",
              type: "line",
              fillColor: "rgba(220,220,220,0)",
              pointColor: "RGBA(34, 40, 48, 1)",
              strokeColor: "RGBA(34, 40, 48, 1)",
              highlightFill: "rgba(151,187,205,0.75)",
              highlightStroke: "rgba(151,187,205,1)",
              data: fillArray(173900, xaxis.length)
            }
        ]
    };

  var new_housing_cost = new

  Chart($("#housing_cost").get(0).getContext("2d")).Overlay(housing_cost, {
    scaleShowLabel: false,
    scaleFontSize: 0,
    multiTooltipTemplate : function (label) {
      return label.datasetLabel + ': $' + label.value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
  });

});




