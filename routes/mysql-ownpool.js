var ejs = require('ejs');
var mysql = require('mysql');

function getConnection() {
	var connection = mysql.createConnection({
		host : '127.0.0.1',
		user : 'root',
		password : '',
		database : '',
		port : 
	});
	return connection;
}

function Pool(no_of_conn)
{
	this.pool = [];
	for(var i=0; i < no_of_conn; ++i)
        this.pool.push(getConnection()); 
    this.last = 0;
}

Pool.prototype.get = function()
{
	var cli = this.pool[this.last];
	this.last++;
    if (this.last == this.pool.length) 
    	this.last = 0;
    return cli;
}

exports.fetchData = function(callback, sqlQuery) {

	var p = new Pool(16);
	for (var i=0; i < 10; ++i)
	{

		p.get().query(sqlQuery, function(err, rows, fields) {

			if (err) {
				console.log("ERROR: " + err.message);
		} else { 
			console.log("\nSQL Query::" + sqlQuery);
			callback(err, rows);

		}
	}); 
		console.log("\nConnection closed..");

	}
}
