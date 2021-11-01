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
    chartDiv.classList.add("jam-chord-chart");
    chartDiv.dataset.key = selectedTune.key;
    tuneDiv.append(chartDiv);
    showChart(chartDiv, selectedTune.charts, 0);
    
    var linkDiv = document.createElement('div');
    linkDiv.classList.add("jam-first-source");
    if (selectedTune.sources.length < 1) {
      linkDiv.innerHTML = "No audio resources for this tune";
    } 
    else if (embedSourceLink(selectedTune.sources[0].link)) {
      var sourceTitle = document.createElement('h3');
      sourceTitle.innerHTML = "Audio Source";
      linkDiv.appendChild(sourceTitle);
      var frame = document.createElement('iframe');
      frame.setAttribute("src", embedSourceLink(selectedTune.sources[0].link));
      frame.setAttribute("frameborder", 0);
      frame.setAttribute("allowtransparency", true);
      frame.setAttribute("width", 380);
      frame.setAttribute("height", 300);
      linkDiv.appendChild(frame);
    } 
    else {
      var linkTag = document.createElement('a');
      var linkBody = document.createElement('h5');
      linkTag.setAttribute("href", selectedTune.sources[0].link);
      linkTag.innerHTML = selectedTune.sources[0].link;
      linkBody.appendChild(linkTag);
      linkDiv.appendChild(linkBody);
    }
    tuneDiv.appendChild(linkDiv);
  }

  // source helper
  function embedSourceLink(link) {
    var embedLink = '';
    var splitLink = [];
    if (link.includes('youtu.be')) {
      splitLink = link.split('/');
      embedLink = '//www.youtube.com/embed/' + splitLink[splitLink.length - 1];
      return embedLink;
    } 
    else if (link.includes('youtube')) {
      splitLink = link.split('?v=');
      embedLink = '//www.youtube.com/embed/' + splitLink[splitLink.length - 1];
      return embedLink;
    } 
    else if (link.includes('open.spotify')) {
      splitLink = link.split('/');
      embedLink = 'https://open.spotify.com/embed/track/' + splitLink[splitLink.length - 1] + '?utm_source=generator';
      return embedLink;
    } 
    else {
      return 0;
    }
  } 

}); // on document ready
