const fs = require('fs')



function SeperateText(TheText: String, titleRegex1: RegExp, titleReges2: RegExp) {

    /*  let titleRegex1 = /Acquisition and Requisition of\nImmovable Property Ordinance/
     //let titleRegex1 = new RegExp(title1)  
     let titleReges2 = /Administrative Tribunals Act/
     let titleReges3 = /Anti-Corruption Commission Act/
  */

    //const sectionArray = [...TheText.matchAll(regex)]
    // const numArray = [...TheText.matchAll(numregex)]
    const FirstTitle = TheText.match(titleRegex1)
    const secondTitle = TheText.match(titleReges2)

    let ResultArray = ""

        if ( FirstTitle?.index) {

            if (secondTitle?.index) { //just Checking for if second title exists or not to loop through

                let start = FirstTitle.index + FirstTitle[0].length
                let end = secondTitle.index
                ResultArray = TheText.slice(start, end); //find the part only from the first title to ending of another title

                FindAndSliceASection(ResultArray, FirstTitle[0]) // split the title , section (One section per title, if one title has several section then it will just loop through)

            }

            else {
                console.log("The second title not exists")
                let start = FirstTitle.index + FirstTitle[0].length
                ResultArray = TheText.slice(start)

                FindAndSliceASection(ResultArray, FirstTitle[0])
            }
        }
      

}

function FindAndSliceASection(ResultArray: String, titleName: String) {
    let Sectionregex = /Sections? [0-9][0-9]?\s?&?\s?[0-9]?[0-9]?\(?[0-9]?\)?—/g //Regular expressions to find Sections
    let numregex = /[^0-9][0-9][0-9][0-9]\n/g // Regular expressions to find The number after every section ending
    let jsonObj // Our JSON object

    let Section = [...ResultArray.matchAll(Sectionregex)]
    let Num = [...ResultArray.matchAll(numregex)]

        Section?.map((item, index) => {
        
           
           
            if (item.index) {
                let start: number = item.index + item[0].length
                let end = Num[index].index
              
                if(end && start)  {
                let OneSection = ResultArray.slice(start, end)
                jsonObj = {
                    title: titleName,
                    sectionName: item[0],
                    sectionDescription: OneSection 
                } // TODO: Write this object as JSON in a file or save to the database
               console.log(jsonObj);
            } else console.log("Index end *********");
            
            }
        })


    return
}
module.exports = { SeperateText }
