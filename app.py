from flask import Flask, render_template, request


app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def home():
    if request.method == 'POST':
        # Handle POST request
        data = request.form.get('data')
        return render_template('index.html', message=f'You submitted: {data}')
    # Handle GET request
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True)
