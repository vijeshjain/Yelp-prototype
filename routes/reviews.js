var ejs = require("ejs");
var mysql = require('./mysql');
var userid= require('./login');
var elements= require('./elements');

exports.ReviewsPage = function(req,res)
{
	var showEid= req.param("eid");

	
	res.render('AddReviews', {currentEid : showEid, userid:userid.userid}, function(err, result){
		if(!err)
		{
			res.end(result);
		}
		else
		{
			res.end('An error occurred');
			console.log(err);
		}
	});
}


exports.ShowReviews = function(req,res)
{
	


	var showReviewsQuery = "select CONCAT(u.first_name, ' ', u.last_name) as fullname, e.eid, e.element_name, e.rating, r.comments from users u, elements e inner join reviews r on e.eid=r.eid where e.eid="+req.param("eid")+" AND u.uid=r.uid;";
	
	mysql.fetchData(function(err,rows) {

		if (!err) {
			
			console.log(JSON.stringify(rows));
			var id=userid.userid;
			var userName=userid.userName;

			var currentEid=req.param("eid");
			//var ename=rows[0].element_name;
			ejs.renderFile('./views/ShowReviews.ejs', {data: rows, uid:id, userName: userName, currentEid: currentEid }, function(err, result) {
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
				// render or error
				else {

					res.end('An error occurred');
					console.log(err);
				}}, showReviewsQuery);


}

exports.AddReviews = function(req,res)
{

	
	var insertReview = "insert into reviews values (null,'"+req.param("comments")+"','"+req.param("currentEid")+"','"+req.param("userid")+"');";

	mysql.fetchData(function(err,rows) {
		if (!err) {
			var showEid= req.param("currentEid");
			console.log(JSON.stringify(rows));
				//res.render('Homepage', {data: rows});

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
				});
			}
				// render or error
				else {

					res.end('An error occurred');
					console.log(err);
				}}, insertReview);


}

