var database = require("../database/config")

function guardarResposta (fk_usuario, fk_opcao){

    var instrucaoSql = `INSERT INTO resposta_usuario (fk_usuario, fk_opcao)
    VALUES(${fk_usuario}, ${fk_opcao})`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);

}

function mostrarResultado (fk_usuario){

    var instrucaoSql = `SELECT o.perfil, COUNT (o.perfil) as Total
    FROM resposta_usuario as r JOIN opcao as o ON r.fk_opcao = o.id
    WHERE r.fk_usuario = ${fk_usuario}
    GROUP BY o.perfil
    ORDER BY total DESC`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);

}

module.exports = {
    guardarResposta,
    mostrarResultado
}