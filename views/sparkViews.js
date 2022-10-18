var express = require("express")
var router = express.Router();
const helper = require("../Helpers/helper")

router.get('/spark',async(req,res)=>{
    await helper.RunPySparker("something")
    res.send("You successfully invoked sparker, check console")
})

module.exports = router