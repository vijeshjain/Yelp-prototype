var ejs = require("ejs");
var mysql = require('./mysql');
var userid= require('./login');

exports.CategoryPage = function(req,res)
{

	res.render('AddCategory', function(err, result){
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

exports.AddCategory = function(req,res)
{

	if(req.param("category")!='')
	{
		var insertCategory = "insert into categories values (null,'"+req.param("category")+"');";

		mysql.fetchData(function(err,rows) {
			if (!err) {

				console.log(JSON.stringify(rows));
				//res.render('Homepage', {data: rows});
				ejs.renderFile('./views/Homepage.ejs', {data: rows, uid: userid.userid, userName: userid.userName}, function(err, result) {
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
				}}, insertCategory);
	}

}

exports.DeleteCategory = function(req,res)
{

	
	
	var deleteCategory = "delete from categories where cid = "+req.param("cid")+";";

	mysql.fetchData(function(err,rows) {
		if (!err) {

			console.log(JSON.stringify(rows));
				//res.render('Homepage', {data: rows});
				ejs.renderFile('./views/Homepage.ejs', {data: rows, uid: userid.userid, userName: userid.userName}, function(err, result) {
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
				}}, deleteCategory);
	

}

exports.EditCategory = function(req,res)
{
	
	var editCategory = "select * from categories where cid="+req.param("cid")+";";
	
	mysql.fetchData(function(err,rows) {
		if (!err) {
			
			console.log(JSON.stringify(rows));
				//res.render('Homepage', {data: rows});
				ejs.renderFile('./views/EditCategory.ejs', {data: rows, uid: userid.userid, userName: userid.userName }, function(err, result) {
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
				}}, editCategory);
	

}

exports.EditAndSaveCategory = function(req,res)
{
	
	var editAndSaveQuery = "update categories set category_name ='"+req.param("category_name")+"' where cid="+req.param("cid")+";";
	mysql.fetchData(function(err,rows) {
		if (!err) {

			console.log(JSON.stringify(rows));
				//res.render('Homepage', {data: rows});
				ejs.renderFile('./views/Homepage.ejs', {data: rows, uid: userid.userid, userName: userid.userName}, function(err, result) {
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
				}}, editAndSaveQuery);
	

}

