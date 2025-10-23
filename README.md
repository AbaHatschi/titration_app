
# Titration App

## Project Description
A cross-platform Flutter application for managing and analyzing titration data. The app is designed for laboratory use, educational purposes, and chemical process documentation.

## Features
- Record and manage titration lines (KegLine, LineOne, LineTwo)
- Persistent storage using Sembast database
- Temporary data storage with SharedPreferences
- Modular architecture with Domain, Data, and UI layers
- Error handling with Result pattern
- Navigation with GoRouter
- MVVM pattern for state management
- Clean and scalable codebase

## Architecture Overview
The project follows a layered architecture:
- **Domain Layer:** Business models/entities
- **Data Layer:** Repositories, services, mappers, DTOs
- **UI Layer:** Views and ViewModels
- **Utils:** Shared utilities (Result, Command, etc.)

## Installation / Setup
1. Clone the repository:
	```sh
	git clone https://github.com/AbaHatschi/titration_app.git
	```
2. Install dependencies:
	```sh
	flutter pub get
	```
3. Run the app:
	```sh
	flutter run
	```

## Usage
- Start the app and navigate through the dashboard to manage titration lines.
- Add, update, and delete records as needed.
- Data is stored locally and can be retrieved anytime.

## Project Structure
```
lib/
  src/
	 domain/         # Business entities
	 data/           # Repositories, services, mappers, DTOs
	 ui/             # Views and ViewModels
	 utils/          # Shared utilities
```

## Contributing Guidelines
- Fork the repository and create your branch
- Follow Dart/Flutter best practices and code style
- Write clear commit messages
- Submit a pull request with a detailed description

## License
This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
