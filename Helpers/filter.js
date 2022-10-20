const fs = require('fs');

function readContent(callback) {
    fs.readFile("../DLROutput.txt", function (err, content) {
        if (err) return callback(err);
        callback(null, content)
    });
    //console.log("Read Complete")
}

readContent(function (err, content) {
    let theText = content.toString();
    let SectionRegex = /Sections? [0-9][0-9]?\(?[0-9]?\)?\(?[0-9]?\)?\(?[0-9]?\)?\(?[0-9]?\)? ?a?n?d? ?[0-9]?[0-9]?\(?[0-9]?[a-z]?[A-Z]?\)?—/g;
    let NumberRegex = /[^0-9][0-9][0-9][0-9][^0-9]/;
    let OurStartingIndex;
    let TheSections = [...theText.matchAll(SectionRegex)];

    let number = theText.match(NumberRegex);


    let ending = number.index;
    OurStartingIndex = TheSections[0].index;

    const Description = theText.slice((OurStartingIndex+TheSections[0][0].length), ending);
    console.log(Description);
});