const fs = require('fs')
var {PythonShell} = require('python-shell');

async function Extractor(TheText) {
  await fs.appendFile('DLROutput.txt', TheText, (err) => {
    if (err) throw err
    else {
      console.log('Write Complete \n')
      console.log("Please Check")
    }
  })
}

async function RunPySparker(query){
  console.log("calling python Script ....");
  PythonShell.run("./pyscripts/hello.py",null,function(err, res){
    if(err) throw err;
    console.log("Done: %j", res);
  })
  
}
module.exports = { RunPySparker,Extractor }
