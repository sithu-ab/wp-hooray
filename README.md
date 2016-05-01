# Hooray Wordpress

Just a Wordpress tutorial site

# Installation

    cd /path/to/your/web/server/root
    git clone https://github.com/sithu-ab/wp-hooray.git
    cd wp-hooray

## Database installation

- Checkout the branch **dev**: `git checkout dev`
- Get the sql dump file `db.sql`
- Create a new database (e.g., `wphooray`) and import `db.sql`

## Configuration

- If you are not in the branch **dev**, checkout the branch `dev`.
- Copy the content of the file `wp-config.php`.
- Checkout the branch `master`.
- Create a new file `wp-config.php` and paste the previously copied content into it.
- Update your database settings of `wp-config.php` according to your credentials.
