const fs = require('fs')
const lunr = require('lunr')
const tsHelper = require("./helper2")
const promptS = require("prompt-sync")({ sigint: true });

let documents = [
  {
    name: 'Lunr', //Name is just for referencing - it is used to identify an item uniquely
    title: 'Lunr', //Any title
    text: 'Like Solr, but much smaller, and not as bright.', //Main text description
  },
  {
    name: 'React',
    title: 'React',
    text: 'A JavaScript library for building user interfaces.',
  },
  {
    name: 'Lodash',
    title: "Lodash",
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
    this.field('title')
    this.field('text')
    this.ref('name')

    documents.forEach(function (doc) {
      this.add(doc)
    }, this)
  })
  let res = idx.search('React') //get result as index
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

  //User gives title as a input
 // let title1 = promptS("Input Title ! ..")
 // console.log("Here is your Title Name: " + title1);

  let titleReges2 = /Anti-Corruption Commission Act/
  let titleReges3 = /NULL/ // null for page end 
  tsHelper.SeperateText(result, titleReges2, titleReges3)
  return result
}


module.exports = { Extractor, Indexer, ReadFile }
