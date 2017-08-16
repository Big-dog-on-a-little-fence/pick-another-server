window.onload = function() {

  var chartDiv = document.getElementById("charts");
  var chartData = JSON.parse(chartDiv.dataset.charts);
  var cycleDiv = document.getElementById("cycle");
  var button = document.createElement('button');
  
  var currentChart = 0;
  button.innerHTML = "Cycle";
  button.onclick = function() {
    currentChart = cycleChart(chartDiv, chartData, currentChart);
  }
  cycleDiv.appendChild(button);
  displayChart(chartDiv, chartData, currentChart);

  function displayChart(chartDiv, chartData, i) {
    var chart = chartData[i];
    chart.progressions.forEach(function(progression, index) {
      displayProgression(chartDiv, progression, index);
    });

    function displayProgression(chartDiv, progression, index) {
      var progressionDiv = document.createElement('div');
      progressionDiv.innerHTML = "Part " + progression.part_number.toString()+':  ';
      chartDiv.appendChild(progressionDiv);
      progression.measures.forEach(function(measure, index) {
        displayMeasure(progressionDiv, measure, index);
        });

      function displayMeasure(progressionDiv, measure, index) {
        var measuresSpan = document.createElement('span');
        measuresSpan.setAttribute("class", "alert alert-success measure");
        measuresSpan.innerHTML = measure.body;
        progressionDiv.appendChild(measuresSpan);
      }
    }
  }

  function cycleChart(chartDiv, chartData, currentChart) {
    while(chartDiv.firstChild) {
      chartDiv.removeChild(chartDiv.firstChild);
    }
    console.log('before:'+currentChart.toString());
    currentChart++;
    if (currentChart >= (chartData.length)) {
      currentChart = 0;
    }
    console.log('after:'+currentChart.toString());
    displayChart(chartDiv, chartData, currentChart);
    return currentChart;
  }

}; // onload