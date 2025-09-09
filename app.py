# from flask import Flask

# app = Flask(__name__)

# @app.route('/')
# def home():
#     return "Hello Siddesh! 🚀 Your Flask app is running inside Docker!"

# if __name__ == "__main__":
#     app.run(host='0.0.0.0', port=5000,debug=True)


# print("hi i am siddesh")

from flask import Flask
from PIL import Image

app = Flask(__name__)

@app.route('/')
def hello():
    img = Image.new('RGB', (60, 30), color = 'red')
    return "Image created!"

if __name__ == '__main__':
    app.run(host='0.0.0.0')