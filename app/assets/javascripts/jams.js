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
  
  generateTuneButton.onclick = function() {
    if (jamList.length < 1) {
      console.log("RESET RESET RESET!!!");
      jamList = SHARED_TUNES.slice(0);
      playedJamList = [];
    }
    grabRandomTune(jamList, playedJamList, tuneDiv);
  };
    
  function grabRandomTune(jamList, playedJamList, tuneDiv) {

    // clearDiv(tuneDiv);
    var selectedTune = jamList.splice(Math.floor(Math.random() * jamList.length), 1)[0];
    playedJamList.push(selectedTune);
    tuneDiv.innerHTML = selectedTune.name;
    // var tuneTitle = document.createElement('h3');
    // tuneTitle.innerHTML = selectedTune.name;
    // tuneDiv.appendChild(tuneTitle);
    
    console.log(selectedTune);
    console.log("jamList (length = " + jamList.length.toString() +"): ");
    console.log("playedJamList (length = " + playedJamList.length +"): ");
    console.log("");
  }

  function clearDiv(div) {
    while(div.firstChild) {
      div.removeChild(div.firstChild);
    }
  }

}); // on document ready
