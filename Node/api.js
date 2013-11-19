var mysql = require('mysql')
var express = require('express')
var app = express();
var dataSet = [];

app.get('/', function(req, res) {
	
	console.log('http request starting..');
	
	res.writeHead(200, {'Content-Type': 'text/html'});
	
	//initialize document
	var html = '<!DOCTYPE html><html><head><title>Howl!</title></head><body>';
	
	html += '<h1> Welcome to the HOWL, Inc. Data API </h1><br><br>';
	html += '<p> <strong>HTTP GET REQUEST:</strong>    /restaurants for a json object containing all restaurants </p>';
	html += '<p> <strong>HTTP GET REQUEST:</strong>    /restaurants/:id for a json object containing restaurant[id] </p>';
	html += '<p> <strong>HTTP GET REQUEST:</strong>    /list/:id for a json object 10 restaurants long containing restaurant[(id-1)*10..id*10] </p>';
	html += '<br><p> <strong>HTTP PUT REQUEST:</strong>     /vote/:id   adds 1 vote to restvotes for restaurant[id]</p>'
	
	//close document
	html += '</body></html>';
	
	res.end(html, 'utf-8');
	
	console.log('http request completed..');
	
});

app.get('/restaurants', function(req, res) {
	console.log('http get request "restaurants" starting..');
	var connection = mysql.createConnection({
		host	: 'localhost',
		user	: 'root',    // PUT YOUR USER HERE
		password	: '98jettaVR6!',  //  PUT YOUR PW HERE
		database	: 'howl',     // Assuming your local db is called howl as well.
	});
	dataSet = [];
	
	connection.connect();
	connection.query('SELECT * from bellingham order by restno', function(err, rows, fields) {
		console.log('sql connection starting...');
		if (err) throw err;
	
		for (var i=0; i<rows.length; i++) {
			dataSet[i] = rows[i];
		}
	});
	connection.end();
	connection.on('end', function(){
		res.json(dataSet);
		console.log('http get request ending, result sent.');
	}); 
});

app.get('/restaurants/:id', function(req, res) {
	var index = req.params.id;
	console.log('http get request "resraurants/:id" starting..');
	var connection = mysql.createConnection({
		host	: 'localhost',
		user	: 'root',    // PUT YOUR USER HERE
		password	: 'ginger',  //  PUT YOUR PW HERE
		database	: 'howl',     // Assuming your local db is called howl as well.
	});
	dataSet = [];
	
	connection.connect();
	connection.query('SELECT * from bellingham where restno = "' + index + '" order by restname', function(err, rows, fields) {
		console.log('sql connection starting...');
		if (err) throw err;
	
		for (var i=0; i<rows.length; i++) {
			dataSet[i] = rows[i];
		}
	});
	connection.end();
	connection.on('end', function(){
		res.json(dataSet);
		console.log('http get request ending, result sent.');
	});
	
});

app.get('/list/:id', function(req, res) {
	var index = req.params.id;
	console.log('http get request "restaurants" starting..');
	var connection = mysql.createConnection({
		host	: 'localhost',
		user	: 'root',    // PUT YOUR USER HERE
		password	: 'ginger',  //  PUT YOUR PW HERE
		database	: 'howl',     // Assuming your local db is called howl as well.
	});
	dataSet = [];
	
	connection.connect();
	connection.query('SELECT * from bellingham order by restno', function(err, rows, fields) {
		console.log('sql connection starting...');
		if (err) throw err;
	
		for (var i=0; i<rows.length; i++) {
			dataSet[i] = rows[i];
		}
	});
	connection.end();
	connection.on('end', function(){
		var lowerBound = index*10 - 10;
		var upperBound = index*10;
		if(lowerBound > dataSet.length){
			res.json([]);
		} else if (upperBound > dataSet.length) {
			res.json(dataSet.slice(lowerBound,dataSet.length));
		} else {
			res.json(dataSet.slice(lowerBound,upperBound));
		}
		console.log('http get request ending, result sent.');
	});
});

app.put('/vote/:id', function(req, res) {
	var index = req.params.id;
	console.log('http put request "vote/:id" starting..');
	var connection = mysql.createConnection({
		host	: 'localhost',
		user	: 'root',    // PUT YOUR USER HERE
		password	: 'ginger',  //  PUT YOUR PW HERE
		database	: 'howl',     // Assuming your local db is called howl as well.
	});
	
	connection.connect();
	
	connection.query('update bellingham set restvotes = restvotes+1 where restno ="' + index + '"', function(err, rows, fields) {
		console.log('sql connection starting...');
		if (err) throw err;
	});
	
	connection.end();
	connection.on('end', function(){
		console.log('http put request ending, result sent.');
		res.send('http put request ending, result sent.');
	});

});

app.listen(8080);