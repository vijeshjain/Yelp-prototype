var ejs = require("ejs");
var mysql = require('./mysql');
var userid= require('./login');
var LocalStorage = require('node-localstorage').LocalStorage,
localStorage = new LocalStorage('./scratch');

exports.UserProfilePage = function(req,res)
{
	
	var showUserProfileQuery = "select * from users where uid="+userid.userid+";";
	var showAllUsersReviewsQuery = "select e.element_name, r.comments, e.rating from elements e, reviews r where r.uid="+userid.userid+" AND e.eid=r.eid;";


	mysql.fetchData(function(err,rows) {
		
		if (!err) {

			console.log(JSON.stringify(rows));
			var fullname = rows[0].first_name + " " + rows[0].last_name;


			mysql.fetchData(function(err,results) {

				if (!err) {

					
					var lastLoginTime = (typeof(userid.lastLoginTime) == "undefined") ? localStorage.getItem('currentLoginTime') : userid.lastLoginTime;
					

					ejs.renderFile('./views/UserProfile.ejs', {data: rows, fullname: fullname, lastLoginTime: lastLoginTime, results: results}, function(err, result) {
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
					
						//res.end(result);
					}
					// render or error
					else {
						res.end('An error occurred');
						console.log(err);
					}
				}, showAllUsersReviewsQuery);
		}
				// render or error
				else {

					res.end('An error occurred');
					console.log(err);
				}}, showUserProfileQuery);
}