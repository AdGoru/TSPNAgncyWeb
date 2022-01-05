function zoom(act) {
    //debugger;
    var arrayOfDivs = document.getElementsByTagName('div');
    var howMany = arrayOfDivs.length - 1;
    for (var i = 0; i < howMany; i++) {
        var thisDiv = arrayOfDivs[i];
        if (act == 'L') {
            newSize = 12;
        }
        else if (act == 'M') {
            newSize = 9;
        }
        else if (act == 'S') {
            newSize = 7;
        }
        else {
            newSize = 9
        }
        thisDiv.style.fontSize = newSize + "pt";
    }
}
function Toggle() {
    var Left = document.getElementById("MainContent_tdLeftForm");
    var Right = document.getElementById('MainContent_tdRightPDF');

    if (Right.style.visibility == "visible" || Right.style.visibility == '') {
        Left.setAttribute("style", "width:99%");
        Right.setAttribute("style", "width:0%");
        Right.style.visibility = "hidden";
    }
    else
        if (Right.style.visibility == "hidden") {

            Right.style.visibility = "visible";
            Left.setAttribute("style", "width:50%");
            Right.setAttribute("style", "width:49%");
        }
    return false;
}
