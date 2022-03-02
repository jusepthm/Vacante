const express = require('express');
const router = express.Router();

const connection = require('../database/db')


router.get('/vacantes', (req,res)=>{

    
    connection.query('SELECT * FROM vacantes', (error, results) => {
        if (error) {
            throw error;
        }else{
            res.render('vacantes', {results:results});
            
    
        }
    }) 
})




module.exports = router;