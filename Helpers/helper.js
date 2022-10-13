const fs = require('fs')
const lunr = require('lunr')
const tsHelper = require("./helper2")

let documents = [
  {
    name: 'Lunr',
    text: 'Like Solr, but much smaller, and not as bright.',
  },
  {
    name: 'React',
    text: 'A JavaScript library for building user interfaces.',
  },
  {
    name: 'Lodash',
    text:
      'A modern JavaScript utility library delivering modularity, performance & extras.',
  },
]

async function Extractor(TheText) {
  await fs.appendFile('output.txt', TheText, (err) => {
    if (err) throw err
    else console.log('Write Complete')
  })
}
function Indexer() {
  var idx = lunr(function () {
    //this.field('name')
    this.field('text')
    this.ref('name')

    documents.forEach(function (doc) {
      this.add(doc)
    }, this)
  })
  let res = idx.search('as bright')
  const results = searchItem(res)
  console.log(results)
}

function searchItem(res) {
  return res.map((item) => {
    return documents.filter((post) => item.ref === post.name)
  })
}

function ReadFile() {
  let result = fs.readFileSync('output.txt').toString()
  tsHelper.SeperateText(result)
  return result
}


module.exports = { Extractor, Indexer, ReadFile }
