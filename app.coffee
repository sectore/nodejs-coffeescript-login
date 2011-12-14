
require("coffee-script")

express = require 'express'
eco = require 'eco'

###
creating server
###
app = express.createServer()

###
server configuration
###
app.configure ->
	app.set 'views', __dirname + "/views"
	app.set 'view engine', 'eco'

	app.use express.bodyParser()
	app.use express.static(__dirname + "/public")


###
routing and view rendering
###
app.get '/', (req, res) ->
	res.render 'login', title:'log in'


###
handling post requests
###
app.post '/login', (req, res) ->

	###
	user object which is sent from login form
	###
	user = req.body.user

	###
	Usually you will check the login data accessing a database or similiar
	For simplicity of this demo it is just hardcoded here
	###
	if user.name is 'luke' and user.password is 'skywalker'
		res.render 'loggedIn', title: "Logged in as #{user.name}", user: user
	else
		res.render 'login', title:'Error', error:true


app.post '/logout', (req, res) ->
	res.render 'login', title:'logged out', loggedOut:true

###
run server
###
port = 9294
app.listen port, -> console.log "Server is starting on port: #{port}"