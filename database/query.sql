
create table `customers`(

    `customer_id` INT AUTO_INCREMENT primary key,
    `first_name` varchar(100) not null,
    `last_name` varchar(100) not null
);

insert into `customers`(`first_name`,`last_name`)
values('ahkow','Tan');


create table `laptops`(
    `laptop_id` int auto_increment primary key,
    `model_name` varchar(100) not null,
    `ram` tinyint not null,
    `cpu_clock_speed` float not null,
    `video_card` varchar(200) not null,
    `price` float not null
);

insert into `laptops`(`model_name`,`ram`,`cpu_clock_speed`,`video_card`,`price`)
values('series1','16','2.33','integrated','1200.0');

insert into `laptops`(`model_name`,`ram`,`cpu_clock_speed`,`video_card`,`price`)
values('series2','8','1.33','integrated','800.0');

create table `boardgames`(

    `title` varchar(100),
    `play time(min)` tinyint,
    `year published` tinyint,
    `description` varchar(200),
    `retail price` varchar(50)

);

insert into `boardgames` (`title`,`play time(min)`,`year published`,`description`,`retail price`)
values('Saints Petersburg','90','2004','Help Czar Peter builds the grandest city ever','$30.00'),
        ('Stone Age','90','2008','Score the most civilization points as the headsman of your tribe','$50'),
        ('Quadropolis','60','2015','Build the best city by strategically placing your archiect','$90');

alter table `boardgames` change `year published` `year published` smallint;


create table `salespersons`(
    `id` int AUTO_INCREMENT primary key,
    `name` varchar(50),
    `commission_rate` float
);

insert into `salespersons` (`name`,`commission_rate`)
values('Alan tay','0.05')

insert into `salespersons` (`name`,`commission_rate`)
values('mandy wikes','0.09')

create table `closed_deals` (
    `id` int auto_increment primary key,
    `deal_size` varchar(100),
    `product_name` varchar(100),
    `salesperson_id` int,
    foreign key (`salesperson_id`) references `salespersons`(`id`)
);

alter table `closed_deals` add `customer_name` varchar(100)


insert into `closed_deals`(`deal_size`,`product_name`,`salesperson_id`,`customer_name`)
values('300000','SuperComputer','1','Phua Chu Kang');

insert into `closed_deals`(`deal_size`,`product_name`,`salesperson_id`,`customer_name`)
values('460000','AI System','2','Elon Mask');


-- qn4

create database tv_shows

create table `tv_series` (
    `show_id` int auto_increment primary key,
    `series_name` varchar(45) not null,
    `plot_summary` text not null
);

create table `episodes` (
    `episode_id` int auto_increment primary key,
    `title` varchar(45) not null,
    `duration` int not null,
    `synopsis` text not null,
    `show_id` int,
    foreign key (`show_id`) references `tv_series`(`show_id`)
);

insert into `tv_series` (`series_name`,`plot_summary`)
values('days of our lives','Null'),
        ('star trek:discovery','Null');





insert into `episodes` (`title`,`duration`,`synopsis`,`show_id`)
values ('Jean fell in love with Dave','1','Jean met Dave at school and they both fell in love.','1'),
        ('Jean met Dave Mk 2','1','Jean realized that the Dave she knew all along was actually the twin brother of the real Dave.','1'),
        ('Michael Burnham starts a war','2','Michael hated Klingons and purposely started a war to kill them.','2')


-- qn5

create database movies

create table `movies` (
    `movie_id` int auto_increment primary key,
    `title` varchar(100) not null
);

create table `actors` (
    `actor_id` int auto_increment primary key,
    `first_name` varchar(100) not null,
    `last_name` varchar(100) not null,
    `gender` tinyint not null
);

create table `castings` (
    `casting_id` int auto_increment primary key,
    `movie_id` int,
    foreign key (`movie_id`) references `movies`(`movie_id`),
    `actor_id` int,
    foreign key (`actor_id`) references `actors`(`actor_id`)
);

insert into `movies` (`title`)
values ('Lord of the Rings'),('ironman'),('avengers'),('avengers:end game'),('avengers: infinity wars');

insert into `actors` (`first_name`,`last_name`,`gender`)
values('Liv','Tyler','2'),('Viggo','Mortensen','1'),('Robert Downey','Junior','1'),('Jeff','Bridges','1');

insert into `castings` (`movie_id`,`actor_id`)
values('1','1'),('1','2'),('2','3'),('2','4'),('3','3'),('4','3'),('5','3');

select * from `actors` 
        join `castings` on `actors`.`actor_id` = `castings`.`actor_id`
        join `movies` on `castings`.`movie_id` = `movies`.`movie_id`; 
