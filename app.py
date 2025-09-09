
from flask import Flask
from PIL import Image

app = Flask(__name__)

@app.route('/')
def hello():
    # img = Image.new('RGB', (60, 30), color = 'red')
    # return "Image created!"
    return "hi siddesh how r u"

if __name__ == '__main__':
    app.run(host='0.0.0.0')