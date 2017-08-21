$( document ).ready(function() {
  
  if (!(page.controller() === 'tunes' && page.action() === 'show')) { return; }
  
  var chartDiv = document.getElementById("charts");
  var chartData = JSON.parse(chartDiv.dataset.charts);
  var currentChart = 0;

  // (in helpers.js)
  showChart(chartDiv, chartData, currentChart);

}); // on document ready
