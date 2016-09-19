# Genesis
A band of dedicated hackers from Code For Australia, making a difference in the way we view government spending.

We aim to provide transparency of construction contracts by providing data that the public can see, view and use.

A platform where anyone who wants insights on government projects can subscribe and participate actively and sharing the information collected to preferred social media.

A place for public to be aware and be inspired of the upcoming projects and infrastracture that will be implemented on their areas.

# Setup

1. Download rails installer:

    [for Windows or Mac](http://railsinstaller.org/en)

    [for Linux](http://railsapps.github.io/installrubyonrails-ubuntu.html)
    
2. Download [postgresql](http://www.enterprisedb.com/products-services-training/pgdownload#windows)database

	*Take note of port setting. * Ex. 5432 as default

3. Run postgresql pgAdmin 4 GUI. 

4. Change/specify connection properties from if needed in order to login.

     *"object menu" --> "properties" --> "connection"* 

5. Open terminal ("Command Prompt With Ruby On Rails") and execute the following task below.


	a. Create/Locate a suitable local folder like "Sites" from terminal and type:

    	@console: *git clone https://github.com/CodeforAustralia/dtf-genesis.git*

  b. Create a user and take note of the *username* and *password* in the postgres database.

  c. Edit *database.yml* file with appropriate *username* and *password* for the development database (Ex. genesis_development)  

	d.  @console: *rake db:create db:migrate*
     
	e.  @console: *rails s*

6. Open your browser and you should be able to see your application by typing this url.
   *localhost:3000* 



