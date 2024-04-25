from flask import Flask, render_template, request

app = Flask(__name__)

def convert_length(value, from_unit, to_unit):
    units = {
        'inch': 0.0254,
        'foot': 0.3048,
        'yard': 0.9144,
        'mile': 1609.34,
        'meter': 1,
        'centimeter': 0.01,
        'kilometer': 1000,
        'pound': 0.453592,
        'ounce': 0.0283495,
        'ml': 0.001,
        'liter': 1,
        'kg': 1
    }
    result = value * units[from_unit] / units[to_unit]
    return round(result, 2)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/converter', methods=['POST'])
def converter():
    if request.method == 'POST':
        value = float(request.form['value'])
        from_unit = request.form['from_unit']
        to_unit = request.form['to_unit']
        result = convert_length(value, from_unit, to_unit)
        return render_template('resultado.html', value=value, result=result, from_unit=from_unit, to_unit=to_unit)

if __name__ == '__main__':
    app.run(debug=True)
