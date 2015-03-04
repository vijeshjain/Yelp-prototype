var ejs = require("ejs");
var mysql = require('./mysql');
var LocalStorage = require('node-localstorage').LocalStorage,
localStorage = new LocalStorage('./scratch');


exports.login = function(req, res) {

	res.render('login', function(err, result) {
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

exports.loginOut = function(req, res) {

	res.render('login', function(err, result) {
		// render on success
		if (!err) {

			var lastLoginTime = localStorage.getItem('currentLoginTime');
			console.log("last : "+lastLoginTime);
			localStorage.setItem('lastLoginTime', lastLoginTime);
			exports.lastLoginTime=lastLoginTime;
			res.end(result);

		}
		// render or error
		else {
			res.end('An error occurred');
			console.log(err);
		}
	})
};

exports.validateUser = function(req, res) {
	// check user already exists
	
	
	var getUser = "select * from users where email='" + req.param("email")
	+ "' AND password='" + req.param("password") + "'";
	console.log("Query is:" + getUser);

	mysql.fetchData(function(err, results) {
		if (err) {
			throw err;
		} else {
			if (results.length > 0) {
				console.log("valid Login");
				

				
				var userName= results[0].first_name + " " + results[0].last_name;
				exports.fullName=userName;
				var getCategories = "select * from categories";
				var userid= results[0].uid;
				exports.userid=userid;
				exports.userName=results[0].first_name;

				mysql.fetchData(function(err,rows) {
					if (!err) {
						
						localStorage.setItem('currentLoginTime', Date());
						console.log(JSON.stringify(rows));
						exports.rows=rows;
						
						res.render('Homepage', { data: rows, userName: userName, userid: userid, uid: userid});
					}
							// render or error
							else {
								res.end('An error occurred');
								console.log(err);
							}}, getCategories);

				
			} else {

				console.log("Invalid Login");
				ejs.renderFile('./views/failLogin.ejs', function(err, result) {
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
		}
	}, getUser);
}

