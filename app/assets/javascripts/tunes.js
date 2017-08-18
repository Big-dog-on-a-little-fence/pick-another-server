// window.onload = function() {
$( document ).ready(function() {
  var partLetters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P'];
  var chartDiv = document.getElementById("charts");
  var chartData = JSON.parse(chartDiv.dataset.charts);
  var cycleDiv = document.getElementById("cycle");
  var currentChart = 0;

  // create cycle buttons if more than 1 chord chart
  if (chartData.length > 1) {
    var cycleLeft = createArrowButton(cycleDiv, 'fa fa-arrow-left fa-3x');
    var cycleRight = createArrowButton(cycleDiv, 'fa fa-arrow-right fa-3x');
    cycleLeft.onclick = function() {
      currentChart = cycleChart(chartDiv, chartData, currentChart, -1);
    };
    cycleDiv.appendChild(cycleLeft);
    
    cycleRight.onclick = function() {
      currentChart = cycleChart(chartDiv, chartData, currentChart, 1);
    };
    cycleDiv.appendChild(cycleRight);
  }

  // display first chart if any
  chartDiv.innerHTML = "";
  if (chartData.length < 1) {
    cycleDiv.innerHTML = "No chord charts have been created for this tune";
  } else {
    displayChart(chartDiv, chartData, currentChart);
  }

  // helper functions
  function displayChart(chartDiv, chartData, i) {
    var chart = chartData[i];

    var editLink = document.createElement('a');
    editLink.className = 'btn btn-sm btn-warning align-right';
    editLink.innerHTML = "Edit Chart";
    editLink.setAttribute('href', window.location.origin+'/tunes/'+chart.tune_id+'/charts/'+chart.id+'/edit');
    chartDiv.appendChild(editLink);

    // display chord progressions
    chart.progressions.forEach(function(progression, index) {
      displayProgression(chartDiv, progression, index);
    });

    function displayProgression(chartDiv, progression, index) {
      var progressionTitle = document.createElement('div');
      var progressionDiv = document.createElement('div');
      progressionTitle.className = "progression-title";
      progressionTitle.innerHTML = "Part " + partLetters[progression.part_number-1];
      chartDiv.appendChild(progressionTitle);
      chartDiv.appendChild(progressionDiv);
      progression.measures.forEach(function(measure, index) {
        displayMeasure(progressionDiv, measure, index);
        });

      function displayMeasure(progressionDiv, measure, index) {
        var measuresSpan = document.createElement('span');
        measuresSpan.className = "alert alert-success measure";
        measuresSpan.innerHTML = measure.body;
        progressionDiv.appendChild(measuresSpan);
      }
    }
  }

  function cycleChart(chartDiv, chartData, currentChart, adder) {
    while(chartDiv.firstChild) {
      chartDiv.removeChild(chartDiv.firstChild);
    }
    console.log('before:'+currentChart.toString());
    currentChart += adder;
    
    if (currentChart >= (chartData.length)) {
      currentChart = 0;
    } else if (currentChart < 0) {
      currentChart = chartData.length - 1;
    }
    
    console.log('after:'+currentChart.toString());
    displayChart(chartDiv, chartData, currentChart);
    return currentChart;
  }

  function createArrowButton(cycleDiv, classString) {
    var arrowButton = document.createElement('button');
    var arrowIcon = document.createElement('i');
    arrowIcon.className += classString;
    arrowButton.appendChild(arrowIcon);
    cycleDiv.appendChild(arrowButton);
    return arrowButton;
  }

});
// }; // onload