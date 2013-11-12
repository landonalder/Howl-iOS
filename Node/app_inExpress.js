var mysql = require('mysql')
var express = require('express')
var app = express();
var connection = mysql.createConnection({
	host	: 'localhost',
	user	: 'root',    // PUT YOUR USER HERE
	password	: '98jettaVR6!',  //  PUT YOUR PW HERE
	database	: 'howl',     // Assuming your local db is called howl as well.
});

connection.connect();

var dataSet = [];

connection.query('SELECT * from bellingham order by restvotes DESC', function(err, rows, fields) {
	console.log('sql connection starting...');
	if (err) throw err;
	
	for (var i=0; i<rows.length; i++) {
		dataSet[i] = rows[i];
	}
});
connection.end();

app.get('/', function(req, res) {
	
	console.log('http request starting..');
	
	res.writeHead(200, {'Content-Type': 'text/html'});
	
	//initialize document
	var html = '<!DOCTYPE html><html><head><title>Howl!</title></head><body>';
	
	/* //going to try to populate a list with database items
	
	html += '<ul>';
	
	//for loop
	for(var i=0; i<dataSet.length; i++) {
		html += '<li>'+ dataSet[i].restno + ': ' + dataSet[i].restname + '</li>';
	}
	
	html += '</ul>'; */
	
	html += '<h1> Welcome to the HOWL, Inc. Data API </h1>';
	html += '<p> /restaurants for a json object containing all restaurants </p>';
	html += '<p> /restaurants/:id for a json object containing restaurant[id] </p>';
	html += '<p> more to come shortly! </p>';
	
	//close document
	html += '</body></html>';
	
	res.end(html, 'utf-8');
	
	console.log('http request completed..');
	
});

app.get('/restaurants', function(req, res) {
	console.log('http get request "restaurants" starting..');
	
	res.json(dataSet);
});

app.get('/restaurants/:id', function(req, res) {
	var index = req.params.id;
	
	console.log('http get request "resraurants:id" starting..');
	
	res.json(dataSet[index]);
});

app.listen(8080);