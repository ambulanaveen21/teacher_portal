
This is a small application that Teacher can logins and add Students into portal

Things covered:

* Ruby version:
	ruby-3.2.0
* Rails version:
	rails-7.2.1.1
* Database
	mysql
* System dependencies
	devise for better authetication
	kaminari for Pagination
	Jquery, Javascript for Front-end interface like Inline editing 
	Bootstrap CSS for UI design

* Implementaion Plan
	
	1)Clone the project from repository
	2) go to the Project directory and do
		bundle install
	3) Setup mysql locally and create database and migrate and seed data
		rails db:create

		rails db:migrate

		rails db:seed
	4) Login into application with valid teacher credentials provoded in db/seeds.rb file

	Set all fields mandatory

	Created students controller

	Loaded all students with their details which is home page of the application.

	Additionally rendered Home and Sign out links and New student actions

	Implemented Modal pop up for new student creation

	Implemented In line editing With Java Script

* Configuration to run the application.

	cd teachers_portal
	
	bundle install
	
	bin/rails db:create

	bin/rails db:migrate

	bin/rails db:seed
	
	bin/rails server

	Vedio for the reference: https://github.com/user-attachments/assets/76d1e8a4-5c5e-40e1-84c7-7d3ea97fceff
