var express = require("express");
var router = express.Router();

var quizController = require("../controllers/quizController");

router.post("/salvar", function (req, res){
    quizController.guardarResposta(req, res);
});

router.get("/resultado/:fkUsuario", function(req, res){
    quizController.mostrarResultado(req, res);
});

module.exports = router;