//1- invocamos a express
// framework principal express
const express =require('express');
const app = express();

//2- seteamos urlencoded para capturar los datos del formulario
app.use(express.urlencoded({extended:false}));
app.use(express.json());

//3- invocamos a dotenv
const dotenv = require('dotenv');
dotenv.config({path:'./env/.env'});

//4- seteamos el direcctorio public
// __dirname lugar donde esta el proyecto
app.use('/resources', express.static('public'));
app.use('/resources', express.static(__dirname + '/public'))

//5-establecemos el motor de plantillas ejs
app.set('view engine', 'ejs');

//6-invocamos a bcryptjs
const bcryptjs = require('bcryptjs');

//7- var de session
const session = require('express-session');
app.use(session({
    secret:'secret',
    resave: true,
    saveUninitialized: true
}));

//8- invocamos al modulo de conexion de la base de datos
const conecction =require('./database/db');
const connection = require('./database/db');


//9- Estableciendo rutas
app.use('/', require('./routes/vacantes.routes'));

app.use('/', require('./routes/buscarEmpresa.routes'));

app.get('/login', (req, res)=>{
    res.render('login');
})
app.get('/register', (req, res)=>{
    res.render('register');
})


app.get('/misVacantes', (req, res)=>{
    res.render('misVacantes');
})

//10- Registracion
app.post('/register', async (req, res)=>{
    const user = req.body.user;
    const name = req.body.name;
    const rol = req.body.rol;
    const pass = req.body.pass;
    let passwordHaash = await bcryptjs.hash(pass, 8);
    conecction.query('INSERT INTO users SET ?', {user:user, name:name, rol:rol, pass:passwordHaash}, async(error, results)=>{
        if (error) {
            console.log(error);
        }else{
            res.render('register', {
                alert: true,
                alertTitle: "Registration",
                alertMessage: "¡Succesful Registration!",
                alertIcon: 'Success',
                showConfirmButton:false,
                timer:1500,
                ruta:''
            })
        }
    })  
    
})

//11- Autenticacion
app.post('/auth', (req, res)=>{
    const user = req.body.user;
    const pass = req.body.pass;
    let passwordHaash = bcryptjs.hash(pass, 8);
    if (user && pass) {
        connection.query('SELECT * FROM users WHERE user = ?', [user], async (error, results)=>{
            if (results.length == 0 || !(await bcryptjs.compare(pass, results[0].pass))){
                res.render('login',{
                    alert:true,
                    alertTitle: "Error",
                    alertMessage: "Usuario y/o password incorrectas",
                    alertIcon: "error",
                    showConfirmButton: true,
                    timer:false,
                    ruta:'login'
                });
            }else{
                req.session.loggedin = true;
                req.session.name = results[0].name
                res.render('login',{
                    alert:true,
                    alertTitle: "Conexion exitosa",
                    alertMessage: "¡LOGIN CORRECTO!",
                    alertIcon: "succes",
                    showConfirmButton: false,
                    timer:1500,
                    ruta:''
                });
            }
        })
    }else{
                res.render('login',{
                    alert:true,
                    alertTitle: "Advertencia",
                    alertMessage: "¡Por favor ingrese un usuario y/o password!",
                    alertIcon: "warning",
                    showConfirmButton: true,
                    timer:false,
                    ruta:'login'
                });
    }
})


// 12 metodo de autenticacion para las paginas
// Auth pages
app.get('/',(req, res)=>{
    if (req.session.loggedin) {
        res.render('index',{
            login: true,
            name: req.session.name
        })
    }else{
        res.render('index',{
            login: false,
            name:'Debe iniciar sesion'
        })
    }
})

//13 
app.get('/logout', (req, res)=>{
    req.session.destroy(()=>{
        res.redirect('/')
    })
})

// escuchando servidor
app.listen(3000, (req, res)=>{
    console.log('SERVIDOR CORRIENDO EN http//loclahost:3000');
})