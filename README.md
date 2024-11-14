# GraphLang

GraphLang is a simple, domain-specific programming language designed for generating visual representations of numerical data, such as bar charts, scatter plots, and line charts. It leverages Flex for lexical analysis, Bison for syntactic parsing, and C for program logic, while `gnuplot` handles data visualization.

## Table of Contents
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Commands Overview](#commands-overview)
- [How It Works](#how-it-works)
- [Example Commands](#example-commands)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Features
- **Simple data input**: Easily input and visualize data using concise commands.
- **Multiple chart types**: Supports bar charts, scatter plots, and line charts.
- **Integrated with `gnuplot`**: Produces high-quality visual outputs using `gnuplot`.
- **Extensible design**: Built with modular code, making it easy to extend with new features or visualization types.

## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/your-repository-name.git
   cd your-repository-name
   ```

2. **Install `gnuplot`**:
   Ensure `gnuplot` is installed on your system. On Ubuntu/Debian, run:
   ```bash
   sudo apt-get install gnuplot
   ```

3. **Compile the project**:
   Use `make` to compile the source code:
   ```bash
   make
   ```

## Usage

1. Run the program:
   ```bash
   ./graphlang
   ```

2. Enter commands to input data or generate plots:
   - Define data using the `data` command.
   - Generate plots using `plot_bar`, `plot_scatter`, or `plot_line`.

## Commands Overview

### Basic Commands
- **Define data**:
  ```plaintext
  data [number1, number2, ..., numberN]
  ```

- **Create a bar chart**:
  ```plaintext
  plot_bar [number1, number2, ..., numberN]
  ```

- **Create a scatter plot**:
  ```plaintext
  plot_scatter [number1, number2, ..., numberN]
  ```

- **Create a line chart**:
  ```plaintext
  plot_line [number1, number2, ..., numberN]
  ```

## How It Works

### Overview
GraphLang processes user input by:
1. **Lexical Analysis**: The lexer (`lexer.l`) tokenizes the input into meaningful symbols.
2. **Parsing**: The parser (`parser.y`) processes these tokens according to grammar rules and triggers C functions for plot generation.
3. **Data Visualization**: The C functions open a pipe to `gnuplot`, send commands and data, and display the plot.

### Core Concepts
- **Flex**: Reads input and identifies keywords, numbers, and symbols, converting them into tokens.
- **Bison**: Matches token sequences against defined grammar rules and calls relevant C functions.
- **C Functions**: Implement logic for sending data and commands to `gnuplot` through a pipe for visualization.

## Example Commands

### Define Data
```plaintext
data [10, 20, 30, 40]
```

### Generate a Bar Chart
```plaintext
plot_bar [5, 15, 25, 35]
```

### Generate a Scatter Plot
```plaintext
plot_scatter [2, 4, 6, 8]
```

### Generate a Line Chart
```plaintext
plot_line [1, 3, 5, 7, 9]
```

## Contributing
Contributions are welcome! To contribute:
1. Fork the repository.
2. Create a branch for your feature or bugfix (`git checkout -b feature-name`).
3. Commit your changes (`git commit -m "Description of changes"`).
4. Push to your branch (`git push origin feature-name`).
5. Open a pull request on GitHub.

Please ensure your code is well-documented and follows the project's style guidelines.

## License
This project is licensed under the MIT License. For more information, see the [LICENSE](LICENSE) file.

## Contact
If you have questions or suggestions, feel free to reach out at [jairoequelal@gmail.com] or open an issue in the repository.

---

Thank you for using GraphLang! We hope it helps you easily visualize and analyze your data.
