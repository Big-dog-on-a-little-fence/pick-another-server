$( document ).ready(function() {
  
  if (!(page.controller() === 'tunes' && page.action() === 'show')) { return; }
  
  var chartDiv = document.getElementById("charts");
  var chartData = JSON.parse(chartDiv.dataset.charts);
  var currentChart = 0;
  
  ///
  var numeralButton = document.createElement('button');
  numeralButton.innerHTML = 'Change to Numeral';
  document.body.appendChild(numeralButton);
  numeralButton.onclick = function() {
    var key = chartDiv.dataset.key;
    translateAllMeasuresToNumerals(key);
  };
  ///
  
  // (in helpers.js)
  showChart(chartDiv, chartData, currentChart);

}); // on document ready
