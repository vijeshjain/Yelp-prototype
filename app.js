
/**
 * Module dependencies.
 */

 var express = require('express')
 , routes = require('./routes')
 , user = require('./routes/user')
 , http = require('http')
 , path = require('path')
 , login = require('./routes/login')
 , register = require('./routes/register')
 , category = require('./routes/category')
 , elements = require('./routes/elements')
 , userProfile = require('./routes/userProfile')
 , reviews = require('./routes/reviews');
 

 var app = express();

// all environments
app.set('port', process.env.PORT || 4000);
app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');
app.use(express.favicon());
app.use(express.logger('dev'));
app.use(express.bodyParser());
app.use(express.methodOverride());
app.use(app.router);
app.use(express.static(path.join(__dirname, 'public')));

// development only
if ('development' == app.get('env')) {
	app.use(express.errorHandler());
}

app.get('/', login.login);
app.get('/logout', login.loginOut);
app.get('/register', register.register);
app.post('/insertUser', register.insertUser);
app.get('/users', user.list);
app.post('/loginUser', login.validateUser);
app.get('/loginUser/CategoryPage', category.CategoryPage);
app.post('/category/Add',category.AddCategory);

app.get('/DeleteCategory/:cid', category.DeleteCategory);
app.get('/EditCategory/:cid', category.EditCategory);
app.post('/EditCategory/:cid', category.EditAndSaveCategory);

app.get('/category/:cid', elements.ShowElements);
app.get('/AddElements/:cid',elements.ElementsPage);
app.post('/elements/addElements',elements.AddElements);

app.get('/userProfile/:uid',userProfile.UserProfilePage);

app.get('/reviews/:eid', reviews.ShowReviews);
app.get('/AddReviews/:eid',reviews.ReviewsPage);
app.post('/review/AddReviews', reviews.AddReviews);

http.createServer(app).listen(app.get('port'), function(){
	console.log('Express server listening on port ' + app.get('port'));
});
