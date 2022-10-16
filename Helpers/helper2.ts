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

    console.log(secondTitle);

    //const ThirdTitle = TheText.match(titleReges3)
    let ResultArray = ""


        if ( FirstTitle?.index) {
            // console.log("************Index matched************");

            if (secondTitle?.index) { //just Checking for if second title exists or not to loop through

                // for (let j = (FirstTitle.index + FirstTitle[0].length); j < secondTitle.index; j++) {

                // ResultArray = ResultArray + TheText.charAt(j)
                let start = FirstTitle.index + FirstTitle[0].length
                let end = secondTitle.index
                ResultArray = TheText.slice(start, end); //find the part only from the first title to ending of another title

                //  }
                FindAndSliceASection(ResultArray, FirstTitle[0]) // split the title , section 

            }

            else {
                console.log("The second title not exists")
                let start = FirstTitle.index + FirstTitle[0].length
                ResultArray = TheText.slice(start)

                FindAndSliceASection(ResultArray, FirstTitle[0])
            }
        }
        /* else if(i == secondTitle?.index ){
            console.log("Second title reached");
            
        } */


}

function FindAndSliceASection(ResultArray: String, titleName: String) {
    let Sectionregex = /Sections? [0-9][0-9]?\s?&?\s?[0-9]?[0-9]?\(?[0-9]?\)?—/g
    let numregex = /[^0-9][0-9][0-9][0-9]\n/g
    let jsonObj

    let Section = [...ResultArray.matchAll(Sectionregex)]
    let Num = [...ResultArray.matchAll(numregex)]
        // console.log(Num);

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
                }
               console.log(jsonObj);
            } else console.log("Index end *********");
            
            }
        })


    return
}
module.exports = { SeperateText }