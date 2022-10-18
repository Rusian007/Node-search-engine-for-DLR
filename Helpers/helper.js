const fs = require('fs')

async function Extractor(TheText) {
  await fs.appendFile('DLROutput.txt', TheText, (err) => {
    if (err) throw err
    else console.log('Write Complete')
  })
}

module.exports = { Extractor }
