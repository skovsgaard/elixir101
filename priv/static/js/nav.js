var currLocation;

if (basename(window.location.toString()) == 'index.html') {
  currLocation = 0;
} else {
  var currItem = basename(window.location.toString())
  var currLocation = Number(currItem.slice(0,currItem.indexOf('.')));
}

function basename(path) {
  return path.slice(path.lastIndexOf('/')+1, path.length);
}

function nextPage() {
  return window.location = urlify(++currLocation);
}

function prevPage() {
  if (currLocation <= 0) {return false}
  return window.location = urlify(--currLocation);
}

function urlify(slideNum) {
  return slideNum.toString() + '.html';
}

document.addEventListener('keypress', function(e) {
  if (e.keyCode == '37') {
    if (currLocation == 1) {return window.location = urlify('index')}
    return prevPage()
  }

  if (e.keyCode == '39' && currLocation < 20) {return nextPage()} // Hardcode this limit, I guess
  return false
});

// document.addEventListener('click', nextPage);

//Should've been in a separate file but lazy
hljs.initHighlightingOnLoad();
