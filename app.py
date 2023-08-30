from flask import Flask

app = Flask(__name__)

@app.route('/whoami', methods=['GET'])
def whoami():
    return "thomas"
 
if __name__ == '__main__':
    app.run(host="0.0.0.0", port=8080, debug=True)