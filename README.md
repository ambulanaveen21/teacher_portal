
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

	Created a simple Teachers portal that can add students with name, subject and marks
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
	bin/rails generate model Student name:string subject:string marks:integer
	bin/rails server
