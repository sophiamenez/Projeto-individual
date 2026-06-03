var quizModel = require("../models/quizModel");

function guardarResposta(req, res) {
    var fkUsuario = req.body.fkUsuario;
    var fkOpcao = req.body.fkOpcao;
    var fkPergunta = req.body.fkPergunta;
    if (fkUsuario == undefined) {
        res.status(400).send("Usuário não encontrado.");

    } else if (fkOpcao == undefined) {
        res.status(400).send("Opção não encontrada.");

    } else if (fkPergunta == undefined) {
        res.status(400).send("Pergunta não encontrada.");

    } else {

        quizModel.guardarResposta(fkUsuario, fkOpcao, fkPergunta)
            .then(function (resultado) {
                res.json(resultado);
            })

            .catch(function (erro) {
                console.log(erro);
                console.log("Houve um erro", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            })
    }

}

function mostrarResultado(req, res) {
    var fkUsuario = req.params.fkUsuario;
    quizModel.mostrarResultado(fkUsuario)
        .then(function (resultado) {
            if (resultado.length > 0){
                res.json(resultado);

            } else {
                res.status(204).send("Nenhum resultado foi encontrado.")
            }
        })
        .catch(
            function (erro) {
                console.log(erro);
                console.log("Houve um erro ao realizar o cadastro! Erro: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }

        )
}

function limparDado(req, res){
    var fkUsuario = req.params.fkUsuario;
    quizModel.limparDado(fkUsuario) 
        .then(function(resultado){
            res.json(resultado);
        })
        .catch(function(erro){
            console.log(erro);
            console.log("Houve um erro ao realizar o cadastro! Erro: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        })

}

module.exports = {
    guardarResposta,
    mostrarResultado,
    limparDado
}

