# Conversor de Unidades de Medida
#### Video Demo: https://youtu.be/QZsTy38DQ7M <URL HERE>
#### Description:
This is a project for a Unit Converter implemented in HTML, CSS, and JavaScript.


# Index.html

The HTML file (`index.html`) contains the entire structure of the web page, from the doctype definition to HTML elements such as forms, unit selectors, and buttons. It also includes a reference to the CSS style file (`<style>` in the header) for styling the page and the JavaScript code (`<script>` in the header and body) to handle the conversion logic and form validation.

The JavaScript comprises two main functions:
- `toggleUnits()`: This function triggers when the "Switch" button is clicked. It checks the selected units and, depending on the combinations, swaps the available options between the "From" and "To" unit selectors. It also handles potential invalid conversions by alerting the user and reverting the selection to prevent incorrect results.
- `validateForm(event)`: This function is invoked when the form is submitted. It validates whether the value field is filled and prevents form submission if it's empty, displaying an alert for the user to enter a value before converting.

Design choices include organizing the page elements for easy unit selection, styling elements for a more pleasing appearance, and implementing logic to switch units to ensure consistent and valid conversions.

If you're interested in adding more units of measurement or enhancing the appearance and functionality, that could be a future consideration to expand and improve the project!

# resultado.html

The HTML defines the structure of the conversion result page. It utilizes classes to style elements and features an <h1> header for the title "Result," a <p> paragraph to display the performed conversion, and an <a> link allowing users to return to the home page.

The CSS is embedded within the HTML file and is responsible for styling the page. It sets the appearance of elements, such as background color, text color, font, and styles for the return link. Design choices include a centralized layout of elements, a background color, and color scheme that provide contrast for readability, and a button-style for the "Back" link that changes color on hover.

However, it's essential to note that the code contains placeholders ({{ '%.2f' | format(value) }}, {{ from_unit }}, {{ '%.2f' | format(result) }}, {{ to_unit }}) that are typically used in frameworks or template languages like Django, Jinja2, or others. These placeholders are intended to be dynamically filled with specific values during page rendering. They would be replaced by actual values before the page is displayed to the user.


# app.py

Certainly! This Python code utilizes the Flask framework to create a unit converter. Let's take a look at what each part does:

**Flask App (`app.py`):**

- The `app.py` file is the heart of the project. It uses Flask to create a web application.
- It imports Flask, `render_template`, and `request` to handle HTTP requests and render HTML templates.
- Defines a `convert_length` function that performs conversion for length and weight units based on predefined conversion factors.
- Contains two routes:
  - The root route `'/'` that renders the home page (`index.html`) with a form for inputting values and selecting units.
  - The `'/converter'` route triggered when the form is submitted. It fetches the entered values, performs conversion using the `convert_length` function, and renders the result page (`resultado.html`) with the converted values.

**HTML Templates:**

- The project includes at least two HTML templates:
  - `index.html`: This is the home page featuring a form for inputting values and selecting units of measurement.
  - `resultado.html`: This page displays the conversion result.

**Conversion Logic:**

- The `convert_length` function takes a value, the source unit, and the target unit, performing the conversion based on predefined conversion factors for various length and weight units.

Regarding design choices, the code follows common Flask practices for handling routes, rendering HTML templates, and handling form data. It separates the conversion logic into a function, allowing easy extension to add more units in the future.


# style.css

This CSS code defines styles for a web page.

**Resets and General Styles:**
- The selector `*` resets the properties `box-sizing`, `margin`, and `padding` for all elements, ensuring layout consistency and avoiding unexpected behaviors due to default browser styles.

**Body Styles (`body`):**
- Defines a fallback font (`Arial, sans-serif`) for text.
- Uses Flexbox to center elements both vertically and horizontally (`display: flex; align-items: center; justify-content: center;`).
- Sets the page body's height to 100% of the screen height (`height: 100vh;`).
- Defines a background color (`background-color: #f4f4f4;`) and text color (`color: #333;`).

**Heading Styles (`h1`):**
- Adds top spacing (`margin-top: 20px;`) to the heading.
- Sets the font size (`font-size: 2em;`) and aligns the text to the center (`text-align: center;`).

**Form Styles (`form`):**
- Centers the form content (`text-align: center;`).

**Label Styles (`label`):**
- Defines the style for form field labels, positioning them as blocks (`display: block;`) and adding a slight bottom spacing (`margin-bottom: 5px;`).

**Numeric Input and Select Styles (`input[type="number"], select`):**
- Defines common styles for numeric fields and selectors.
- Adds padding and margins for spacing

These styles aim to create a clean and organized appearance for a unit conversion form, with an emphasis on usability and readability.
