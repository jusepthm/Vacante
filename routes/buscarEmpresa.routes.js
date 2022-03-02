const express = require('express');
const routerE = express.Router();

const connection = require('../database/db')


routerE.get('/buscarEmpresa', (req,res)=>{

    
    connection.query('SELECT * FROM empresa', (error, results) => {
        if (error) {
            throw error;
        }else{
            res.render('buscarEmpresa', {results:results});
            
    
        }
    }) 
})




module.exports = routerE;