const fs = require('fs')
const nodecallspython = require("node-calls-python");

const py = nodecallspython.interpreter;


async function Extractor(TheText) {
  await fs.appendFile('DLROutput.txt', TheText, (err) => {
    if (err) throw err
    else {
      console.log('Write Complete \n')
      console.log("Please Check")
    }
  })
}

async function RunPySparker(){
  console.log("calling python Script ....");
  
   py.import("./pyscripts/sparker.py").then(async function(pymodule) {
    const result = await py.call(pymodule, "printHello");
    console.log("This is what Python says,  %j",result);
});

}

async function RunFilter(){
  console.log("Calling FIlter");

     py.import("./pyscripts/filter.py").then(async function(pymodule){
       const result = await py.call(pymodule,"FilterText");
       console.log(result);
     })

}
module.exports = { RunPySparker,Extractor,RunFilter }
