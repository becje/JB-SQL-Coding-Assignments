create database if not exists users;

use users;

drop table if exists user_comments;
drop table if exists user_posts;
drop table if exists users;

create table if not exists  users (
	id int(11) not null auto_increment,
	first_name varchar(20) not null,
	last_name varchar(20) not null,
	username varchar(10) not null,
	pswrd varchar(10) not null,
	email varchar(30) not null,
	primary key (id)

);

create table if not exists user_posts (

	id int(11) not null auto_increment,	
	user_post varchar(750),
	post_date DATETIME default current_timestamp,
	user_id int(11) not null,	
	primary key (id),
	foreign key (user_id) references users(id)

);

create table if not exists user_comments (
                    
	id int(11) not null auto_increment,
	user_comment varchar(500),
	comment_date DATETIME default current_timestamp,
	user_id int(11) not null,
	post_id int (11) not null,
	primary key (id),
	foreign key (user_id) references users(id),
	foreign key (post_id) references user_posts(id)
	
);

insert into users values(002, 'Bugs', 'Bunny', 'bunbu', '24Carrot', 'bugs@looneymail.com'),
(003, 'Elmer', 'Fud', 'fudel', 'Getwabbits', 'elmer@looneymail.com'), 
(004, 'Wile E.', 'Coyote', 'coywil', 'AcmeRocket', 'wile@lonneymail.com'),
(005, 'Road', 'Runner', 'runro', 'meepmeep', 'road@lonneymail.com');

insert into user_posts values 
(002, 'Here I go with the timid little woodland creature bit again. It’s shameful, but…ehhh, it’s a living.', now(), 002),
(003,'KILL THE WABBIT! KILL THE WABBIT!', now(), 003),
(004, 'Allow me to introduce myself. My name is Wile E. Coyote genius! Do not try to get away. I am more muscular, more cunning, faster, and larger than you are. Why you could hardly pass the entrance examinations to kindergarten.', now(), 004),
(005, 'meep meep', now(), 005);

insert into user_comments values
(002,'Do you happen to know what the penalty is for shooting a fricaseeing rabbit without a fricaseeing rabbit license?', now(), 002, 003),
(003, 'Hewwo! Acme Pest Contwol? Weww I have a pest I want contwolled.', now(), 003, 002),
(004, 'So I will give ya the customery two minutes to say your prayers', now(), 004, 005),
(005, 'Meep Meep', now(), 005, 004),
(006, 'Jumpin without a parachute...Kinda dangerous aint it?', now(), 002, 004); 

select * from users;
select * from user_posts;
select * from user_comments;

-- Query to show the posts each user made and when they made the post --

select u.id as "User ID", CONCAT(u.first_name, " ", u.last_name) as "Full Name", p.user_post as "Post", p.post_date as "Date Posted" from users u 
inner join user_posts p on p.id = u.id;

-- Query to show the comments each user made and when they made the comment --

select u.id as "User ID", CONCAT(u.first_name, " ", u.last_name) as "Full Name", c.user_comment as "Comment", c.comment_date as "Comment Date" from users u 
inner join user_comments c on c.id = u.id;

-- Query to show comments each user has made and the post the comment is made on along with when the posts and coments were made. --
-- To figure out final query at a later date -- 

-- select u.id as "User ID", CONCAT(u.first_name, " ", u.last_name) as "Tune Creating Post", p.user_post as "Posts", CONCAT(u.first_name, " ", u.last_name) as "Tune Creating Comment", c.user_comment as "Comments", p.post_date as "Post Date-Time", c.comment_date as "Comment Date-Time" from users u
-- inner join user_posts p on p.id = u.id,
-- inner join user_comments c on c.post_id = p.user_post;


