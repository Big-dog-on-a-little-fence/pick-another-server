$( document ).ready(function() {
  
  if (!(page.controller() === 'jams' && page.action() === 'show')) { return; }
  
  var jamDiv = document.getElementById("jam-tunes");
  jamDiv.innerHTML = "";
  const SHARED_TUNES = JSON.parse(jamDiv.dataset.tunes);
  var jamList = SHARED_TUNES.slice(0);
  var playedJamList = [];
  var generateTuneButton = document.createElement('button');
  generateTuneButton.innerHTML = 'Next Tune!';
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
    
    var tuneTitle = document.createElement('h2');
    tuneTitle.innerHTML = selectedTune.name;
    tuneTitle.className = "jam-tune";
    tuneDiv.appendChild(tuneTitle);
    
    var tuneKey = document.createElement('h3');
    tuneKey.innerHTML = "Key: "+ selectedTune.key;
    tuneDiv.appendChild(tuneKey);
    
    var chartDiv = document.createElement('div');
    showChart(chartDiv, selectedTune.charts, 0);
    tuneDiv.append(chartDiv);
    
  }

  function clearDiv(div) {
    while(div.firstChild) {
      div.removeChild(div.firstChild);
    }
  }

}); // on document ready
