
// TO DO --> make function that scans all spans on page and applies this function on the measure bas
//        ==> above is done except "getElementsByClassName" does not return an array (only an html array like object)


function translateAllMeasuresToNumerals(key) {
  var chord_scale = resetScale(key);
  var measures = document.getElementsByClassName("measure");
  measures.forEach(function(measure, index) {
    translateMeasureToNumeral(chord_scale, measure);
  });
}

function translateMeasureToNumeral(chord_scale, input_measure) {
  var measure = input_measure.innerHTML;
  var numeral_measure = "";
  var chords = measure.split(' ');
  chords.forEach(function(chord, index) {
    var numeral = translateChordToNumeral(chord_scale, chord);
    numeral_measure += numeral;
  });
  measure.innerHTML = numeral_measure;
}