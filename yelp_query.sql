select * from users;
use yelpDB;

create table users(uid int primary key auto_increment, first_name varchar(1000), last_name varchar(1000), email varchar(1000), password varchar(1000));
create table categories(cid int primary key auto_increment, category_name varchar(1000)); 

create table elements(eid int primary key auto_increment, element_name varchar(1000), cid int, FOREIGN KEY (cid) REFERENCES categories(cid));

create table reviews(rid int primary key auto_increment, comments varchar(5000), eid int, uid int, 
FOREIGN KEY (eid) REFERENCES elements(eid),
FOREIGN KEY (uid) REFERENCES users(uid));

select * from users;
select * from categories;
select * from elements;
select * from reviews;

select count(*), e.element_name, r.comments, e.rating from elements e, reviews r where r.uid=1 and e.eid=r.eid;
select u.first_name, e.element_name, r.comments from users u, elements e, reviews r where r.uid=1 AND e.eid=r.eid AND u.uid=r.uid;

select u.first_name, e.eid, e.element_name, e.rating, r.comments from users u, elements e inner join reviews r on e.eid=r.eid where e.eid=1 AND u.uid=r.uid;

select CONCAT(u.first_name, ' ', u.last_name) as fullname, r.comments, e.rating from users u, reviews r, elements e;

select CONCAT(u.first_name, ' ', u.last_name) as fullname, r.comments, e.rating from users u, reviews r, elements e where e.eid=1;

select c.cid, e.cid from categories c  inner join elements e on c.cid=e.cid where e.eid=1 and r.eid=1;




