if [ -z "$1" || -z "$2" ] 
then
    echo "Usage: ./autoflask.sh <project_directory> <app_name>"
    exit 1
fi
mkdir $1
mkdir $1/app
touch $1/app/__init__.py
touch $1/app/routes.py
touch $1/$APP_NAME.py
echo "from flask import Flask" > $1/app/__init__.py
echo "app = Flask(__name__)" >> $1/app/__init__.py
echo "from app import routes" >> $1/app/__init__.py
echo "from app import app" > $1/app/routes.py
echo "@app.route('/')" >> $1/app/routes.py
echo "@app.route('/index')" >> $1/app/routes.py
echo "def index():" >> $1/app/routes.py
echo -e "    return \"Hello, World!\"" >> $1/app/routes.py
echo "from app import app" >> "$1/$2".py 
cd $1 
pipenv install
pipenv install flask
pipenv shell
