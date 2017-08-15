function displayChart(i) {
  var chartDiv = document.getElementById("charts");
  var button = document.createElement('button');
  chartDiv.innerHTML = '';
  button.innerHTML = "Cycle";
  button.addEventListener("click", cycleChart);
  chartDiv.appendChild(button);
  
  var chartData = JSON.parse(chartDiv.dataset.charts);
  var chart = chartData[i];
  chart.progressions.forEach(displayProgression);

  function displayProgression(progression, index) {
    var progressionDiv = document.createElement('div');
    progressionDiv.innerHTML = "Part " + progression.part_number.toString()+':  ';
    progression.measures.forEach(displayMeasure);
    chartDiv.appendChild(progressionDiv);
  
    function displayMeasure(measure, index) {
      var measuresSpan = document.createElement('span');
      measuresSpan.setAttribute("class", "alert alert-success measure");
      measuresSpan.innerHTML = measure.body;
      progressionDiv.appendChild(measuresSpan);
    }
  }

  function cycleChart() {
    alert('clicked');
  }

}

window.onload = function() {
  // var charts = document.getElementById("charts");
  // alert(charts);
  displayChart(0);
}; // onload