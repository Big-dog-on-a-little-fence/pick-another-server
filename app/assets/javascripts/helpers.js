
const ALPHABET = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P'];


function showChart(chartDiv, chartData, currentChart) {
  // display first chart if any
  chartDiv.innerHTML = "";
  if (chartData.length < 1) {
    chartDiv.innerHTML = "No chord charts have been created for this tune";
  } else {
    displayChart(chartDiv, chartData, currentChart);
  }
}

function displayChart(chartDiv, chartData, currentChart) {
  var chart = chartData[currentChart];
  
  // edit chart link
  var linkDiv = document.createElement('div');
  var editLink = document.createElement('a');
  linkDiv.className = "align-right";
  editLink.className = "btn btn-sm btn-warning";
  editLink.innerHTML = "Edit Chart";
  editLink.setAttribute('href', window.location.origin+'/tunes/'+chart.tune_id+'/charts/'+chart.id+'/edit');
  linkDiv.appendChild(editLink);
  chartDiv.appendChild(linkDiv);

  // chart title
  var chartTitle = document.createElement('h3');
  chartTitle.innerHTML = "Chord Chart ver" + (currentChart+1).toString();
  chartTitle.className = "chart-title";
  chartDiv.appendChild(chartTitle);

  // cycle chart arrow buttons
  createCycleArrowButtons(chartDiv, chartData, currentChart);

  // display chord progressions
  chart.progressions.forEach(function(progression, index) {
    displayProgression(chartDiv, progression, index);
  });

  function displayProgression(chartDiv, progression, index) {
    var progressionTitle = document.createElement('div');
    var progressionDiv = document.createElement('div');
    progressionTitle.className = "progression-title";
    progressionTitle.innerHTML = "Part " + ALPHABET[progression.part_number-1];
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

function createCycleArrowButtons(chartDiv, chartData, currentChart) {
  var cycleDiv = document.createElement('div');

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
  
  chartDiv.appendChild(cycleDiv);

    function createArrowButton(cycleDiv, classString) {
      var arrowButton = document.createElement('button');
      var arrowIcon = document.createElement('i');
      arrowIcon.className += classString;
      arrowButton.appendChild(arrowIcon);
      cycleDiv.appendChild(arrowButton);
      return arrowButton;
    }
}