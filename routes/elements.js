var ejs = require("ejs");
var mysql = require('./mysql');
var login = require('./login');

exports.ElementsPage = function(req,res)
{
	var showCid= req.param("cid");
	console.log(showCid);
	var userid=login.userid;
	var userName=login.userName;
	res.render('AddElements', {currentCid : showCid, uid: userid, userName: userName}, function(err, result){
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


exports.ShowElements = function(req,res)
{
	
	var ShowElementsQuery = "select * from elements where cid="+req.param("cid")+";";

	var ShowCategoryName = "select * from categories where cid="+req.param("cid")+";";

	mysql.fetchData(function(err,rows) {

		if (!err) {
			
			var userid=login.userid;
			var userName=login.userName;
			console.log(JSON.stringify(rows));
			var cid=req.param("cid");

			ejs.renderFile('./views/ShowElements.ejs', {data: rows, uid: userid, userName: userName, cid:cid}, function(err, result) {
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
				}}, ShowElementsQuery);


}

exports.AddElements = function(req,res)
{

	
	var insertElement = "insert into elements values (null,'"+req.param("element_name")+"','"+req.param("cid")+"','"+req.param("description")+"','"+req.param("rating")+"');";

	mysql.fetchData(function(err,rows) {
		if (!err) {

			console.log(JSON.stringify(rows));
				//res.render('Homepage', {data: rows});
				res.render('login', {data: rows}, function(err, result) {
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
				}}, insertElement);
	

}

