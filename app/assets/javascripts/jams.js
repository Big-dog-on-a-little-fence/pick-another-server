$( document ).ready(function() {
  
  if (!(page.controller() === 'jams' && page.action() === 'show')) { return; }
  
  var jamDiv = document.getElementById("jam-tunes");
  jamDiv.innerHTML = "";
  const SHARED_TUNES = JSON.parse(jamDiv.dataset.tunes);
  var jamList = SHARED_TUNES.slice(0);
  var playedJamList = [];
  var generateTuneButton = document.createElement('button');
  generateTuneButton.innerHTML = 'Next Tune!';
  generateTuneButton.className = 'btn btn-lg btn-info';
  jamDiv.appendChild(generateTuneButton);
  var tuneDiv = document.createElement('div');
  jamDiv.appendChild(tuneDiv);
  
  grabRandomTune(jamList, playedJamList, tuneDiv);
  
  generateTuneButton.onclick = function() {
    if (jamList.length < 1) {
      jamList = SHARED_TUNES.slice(0);
      playedJamList = [];
    }
    grabRandomTune(jamList, playedJamList, tuneDiv);
  };
    
  function grabRandomTune(jamList, playedJamList, tuneDiv) {
    clearDiv(tuneDiv);
    var selectedTune = jamList.splice(Math.floor(Math.random() * jamList.length), 1)[0];
    playedJamList.push(selectedTune);
    
    var tuneTitle = document.createElement('h1');
    tuneTitle.innerHTML = selectedTune.name;
    tuneTitle.className = "jam-tune-title";
    tuneDiv.appendChild(tuneTitle);
    
    var tuneKey = document.createElement('h2');
    tuneKey.innerHTML = "Key of "+ selectedTune.key;
    tuneDiv.appendChild(tuneKey);
    
    var chartDiv = document.createElement('div');
    chartDiv.dataset.key = selectedTune.key;
    tuneDiv.append(chartDiv);
    showChart(chartDiv, selectedTune.charts, 0);
    
    var linkDiv = document.createElement('div');
    var frame = document.createElement('iframe');
    if (selectedTune.sources.length < 1) {
      linkDiv.innerHTML = "No audio resources for this tune";
    } else {
      frame.src = selectedTune.sources[0].link;
      frame.height = 200;
      frame.frameborder = 0;
      frame.allowtransparency = true;
      linkDiv.appendChild(frame);
    }
    tuneDiv.appendChild(linkDiv);
  }

}); // on document ready
