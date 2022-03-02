Create database cd_java_projectmanager;
Use cd_java_projectmanager;

Create table users (
	id int primary key auto_increment,
    firstname varchar(30),
    lastname varchar(30),
    email text,
    password text
);

Create table projects (
	id int primary key auto_increment,
    title varchar(200),
    description text,
    due_date date,
    user_id int,
    foreign key (user_id) references users(id) on delete cascade
);

Create table projects_users (
	project_id int,
    user_id int,
    foreign key (project_id) references projects(id) on delete cascade,
    foreign key (user_id) references users(id) on delete cascade
);

Create table tasks (
	id int primary key auto_increment,
    user_id int,
    project_id int,
    description text,
    created_at datetime,
    foreign key (user_id) references users(id) on delete cascade,
    foreign key (project_id) references projects(id) on delete cascade
);