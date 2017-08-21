const CHORD_SCALE = ['C', 'Db', 'D', 'Eb', 'E', 'F', 'F#', 'G', 'Ab', 'A', 'Bb', 'B'];

function resetScale(root) {
  var index = CHORD_SCALE.indexOf(root);
  var chord_scale = CHORD_SCALE.slice(index, CHORD_SCALE.length).concat(CHORD_SCALE.slice(0, index));
  return chord_scale;
}

function translateChordToNumeral(chord_scale, input_chord) {
  var chord = input_chord;
  var minor = false;
  if (chord.includes('mod')) {
    chord = chord.replace('mod', '');
    
  } else if (chord.includes('m')) {
    chord = chord.replace('m', '');
    minor = true;
  }
  var index = chord_scale.indexOf(chord);
  console.log(input_chord + ' ' + index);
  switch (index+1) {
    case 1: 
      chord = 'I';
      break;
    case 2: 
      chord = 'IIb';
      break;
    case 3: 
      chord = 'II';
      break;
    case 4:
      chord = 'IIIb';
      break;
    case 5:
      chord = 'III';
      break;
    case 6:
      chord = 'IV';
      break;
    case 7:
      chord = 'Vb';
      break;
    case 8:
      chord = 'V';
      break;
    case 9:
      chord = 'VIb';
      break;
    case 10:
      chord = 'VI';
      break;
    case 11:
      chord = 'VIIb';
      break;
    case 12:
      chord = 'VII';
      break;
    default: 
      chord = chord;
  }
    
  if (minor) {chord.toLowerCase();}
  return chord;
  
} // translateChordToNumeral()
