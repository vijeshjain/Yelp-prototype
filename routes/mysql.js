var ejs = require('ejs');
var mysql = require('mysql');

function getConnection() {
	var connection = mysql.createConnection({
		host : '127.0.0.1',
		user : 'root',
		password : 'root',
		database : 'yelpDB',
		port : 3306
	});
	return connection;
}

exports.fetchData = function(callback, sqlQuery) {

	console.log("\nSQL Query::" + sqlQuery);

	var connection = getConnection();

	connection.query(sqlQuery, function(err, rows, fields) {

		if (err) {
			console.log("ERROR: " + err.message);
		} else { // return err or result

			callback(err, rows);

		}
	});
	console.log("\nConnection closed..");
	connection.end();
}
