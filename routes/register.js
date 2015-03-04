var ejs = require("ejs");
var mysql = require('./mysql');
var userid= require('./login');

exports.register = function(req, res) {

	res.render('register', function(err, result) {
		// render on success
		if (!err) {
			res.end(result);

		}
		// render or error
		else {
			res.end('An error occurred');
			console.log(err);
		}
	})
};

exports.insertUser = function(req, res) {
	// insert new user
	var regUser = "insert into users values(null,'" + req.param("first_name")
		+ "','" + req.param("last_name") + "','" + req.param("email")
		+ "','" + req.param("password") + "')";

var registerUserSuccess=0;

var fullname=req.param("first_name") + " " + req.param("last_name")
console.log("Query is:" + regUser);

mysql.fetchData(function(err, results) {
	if (err) {
		throw err;
	} else {
		registerUserSuccess=1;
		console.log("new user registered");
		res.render('login', {registerUserSuccess: registerUserSuccess}, function(err, result) {
				// render on success
				if (!err) {
					res.end(result);
				}
				// render or error
				else {
					res.end('An error occurred');
					console.log(err);
				}
			});

	}
}, regUser);
}