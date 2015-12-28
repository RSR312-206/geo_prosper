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
      function(label){return  '$' + label.value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");}
  });


//industry chart setup
  var industry_chart = $("#industry_chart").get(0).getContext("2d");
  var new_industry_chart = new Chart(industry_chart);

  var industry_data = {
        labels: industry_xaxis,
        datasets: [
            {
                label: "",
                fillColor: "RGBA(230, 210, 165, 1)",
                strokeColor: "rgba(220,220,220,1)",
                pointColor: "rgba(220,220,220,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,220,1)",
                data: industry_yaxis
            },
        ]
    };

  new Chart(industry_chart).Bar(industry_data);

  //open housing
  var open_housing_chart = $("#open_housing").get(0).getContext("2d");
  var new_open_housing = new Chart(open_housing_chart);


  //salary chart colors and data
  var open_housing_data = {
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
                data: open_housing_yaxis
            },
        ]
    };

  new Chart(open_housing_chart).Bar(open_housing_data, {scaleLabel: "<%=value + '%' %>" });

  //unemployment Polar Area chart
  var unemployment_chart = $("#unemployment").get(0).getContext("2d");
  var new_unemployment_chart = new Chart(unemployment_chart);

  var unemployment = {
    labels: xaxis,
    datasets: [
        {
            label: "",
            fillColor: "rgba(220,220,220, 1)",
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
    pointDot: false, scaleLabel: "<%=value + '%' %>" });


});




