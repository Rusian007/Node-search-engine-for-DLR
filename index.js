const tesseract = require("node-tesseract-ocr")
let express  = require('express');
let app = express();
let bodyParser = require('body-parser');
const multer = require('multer')
const path = require('path')
const helper = require("./Helpers/helper")
var sparkViews = require('./views/sparkViews')

app.use(bodyParser.json());
app.use(express.static(path.join(__dirname+'/uploades')))

app.set('views', './Html');
app.set('view engine',"ejs")

var storage = multer.diskStorage({
	destination: function(req, file, cb){
		cb(null, "uploades")
	},
	filename: function(req,file, cb){
		cb(
			null,
			file.fieldname+ '-' +Date.now() + path.extname(file.originalname)
		)
	}
})
const upload = multer({storage:storage})

app.get('/', async function(req, res) {
	await helper.RunPySparker()
	res.render('index', {data:''})

})

app.post("/extractText", upload.single("file"), (req,res)=>{
	console.log(req.file.path)
	const config = {
		lang: "eng",
		oem: 1,
		psm: 3,
	  }
	  
	  
	  tesseract.recognize(req.file.path, config).then((text) => {
		helper.Extractor(text )
		  res.render('index',{data:text})
		}).catch((error) => {
		  console.log(error.message)
		})
})

app.use('/view',sparkViews);
app.listen(3000, function(){
	console.log("Server started on port: 3000")
})
module.exports = {upload}