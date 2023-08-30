from flask import Flask

app = Flask(__name__)

@app.route('/whoami', methods=['GET'])
def whoami():
    return "thomas"

if __name__ == '__main__':
    app.run()