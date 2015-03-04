var generic_pool = require('generic-pool');



var pool = generic_pool.Pool({

	name: 'mysql',

	max: 10,

	create: function(callback) {

		var Client = require('mysql').createConnection({

			host:'127.0.0.1',

			user:'root',

			password:'vijesh',

			database: 'yelpDB',

			port : 4301

		});



		callback(null,Client);

	},

	destroy: function(db) {

		db.disconnect();

	}

});



exports.fetchData = function(callback, sqlQuery) {

	

	pool.acquire(function(err, client) {



		if (err) {

        

    }

    else {

    	client.query(sqlQuery, function(err, rows, fields) {

    		if (err) {
    			console.log("ERROR: " + err.message);
		} else { // return err or result

			callback(err, rows);

		}
	});
    }

});

	
}


