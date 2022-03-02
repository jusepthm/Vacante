const express = require('express');
const router = express.Router();

const connection = require('../database/db')




    
    router.app.get('/vacantes', async (req, res)=>{
        const user = req.body.user;
        const name = req.body.name;
        const rol = req.body.rol;
        const pass = req.body.pass;
        conecction.query('INSERT INTO users SET ?', {user:user, name:name, rol:rol, pass:passwordHaash}, async(error, results)=>{
            if (error) {
                console.log(error);
            }

        })

    })


module.exports = router;