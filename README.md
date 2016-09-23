# Genesis
A band of dedicated hackers from Code For Australia, making a difference in the way we view government spending.

We aim to provide transparency of construction contracts by providing data that the public can see, view and use.

A platform where anyone who wants insights on government projects can subscribe and participate actively and sharing the information collected to preferred social media.

A place for public to be aware and be inspired of the upcoming projects and infrastracture that will be implemented on their areas.

# Setup
Frontend:

1. Install [npm](https://nodejs.org/en/)

2. Install [bower](https://bower.io)

   ```bash
    npm install -g bower
   ```

Backend:

1.  Install rails:
    [for Windows or Mac](http://railsinstaller.org/en)
    [for Linux](http://railsapps.github.io/installrubyonrails-ubuntu.html)

2. Install PostgreSQL database

  * Windows
    * Download [postgresql](http://www.enterprisedb.com/products-services-training/pgdownload#windows)
    * Take note of port setting (5432 is default)
    * Run postgresql pgAdmin 4 GUI
    * "object menu" --> "properties" --> "connection"
    * Create a user and take note of the *username* and *password* in the postgres database

  * Linux
    * In a terminal run
```bash
sudo apt-get install postgresql postgresql-server-dev-all
sudo su - postgres
createdb genesis_development
psql
```

    * Then in SQL prompt:
```sql
CREATE USER genesis WITH PASSWORD 'q1w2e3r4t5';
ALTER USER genesis CREATEDB;
```

3. Create/Locate a suitable local folder like "Sites" for development

4. Open terminal ("Command Prompt With Ruby On Rails") and execute the following tasks


```bash
git clone https://github.com/CodeforAustralia/dtf-genesis.git
cd dtf-genesis
```

5. Edit *database.yml* file with appropriate *username* and *password* for the development database (Ex. genesis_development) from "config" folder

6. Then run the commands:

```bash
bundle install
rake db:create db:migrate
rails s
```

7. Open your browser and you should be able to see your application by entering the url `localhost:3000`
