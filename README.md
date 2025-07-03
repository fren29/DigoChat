# DigoChat

A full-stack ChatGPT clone built with Django (backend) and React (frontend), showcasing clean architecture principles and modern development practices.

## 🚀 Features

- Real-time chat interface with streaming responses
- Multiple chat management
- Configurable AI parameters (model, temperature, max tokens)
- User authentication and chat history
- Clean architecture implementation
- Fully containerized development environment

## 🛠️ Tech Stack

### Backend
- **Framework**: Django 5.0 with Django REST Framework
- **Language**: Python 3.11+
- **Database**: PostgreSQL
- **Real-time**: Django Channels with Redis
- **AI Integration**: OpenAI API
- **Architecture**: Clean Architecture (Domain/Application/Infrastructure/API layers)

### Frontend
- **Framework**: React 18 with TypeScript
- **State Management**: Redux Toolkit
- **Styling**: Tailwind CSS / Material-UI
- **Real-time**: Socket.io Client
- **Build Tool**: Create React App

### DevOps
- **Containerization**: Docker & Docker Compose
- **CI/CD**: GitHub Actions
- **Testing**: pytest (backend), Jest (frontend)

## 📁 Project Structure
```bash
digo-chat/ 
├── backend/ # Django backend with clean architecture 
├── frontend/ # React frontend with TypeScript 
├── docs/ # Additional documentation 
├── .github/ # GitHub Actions workflows 
├── docker-compose.yml 
└── README.md
```

## 🚦 Getting Started

### Prerequisites
- Docker Desktop
- Git
- Node.js 20+ (for local development)
- Python 3.11+ (for local development)

### Quick Start
```bash
# Clone the repository
git clone git@github.com:fren29/DigoChat.git
cd digo-chat

# Copy environment variables
cp .env.example .env

# Start the development environment
docker-compose up

# Access the application
# Frontend: http://localhost:3000
# Backend API: http://localhost:8000
```

## 📝 Environment Variables
Create a .env file in the root directory:
```
# OpenAI
OPENAI_API_KEY=your_api_key_here

# Database
POSTGRES_DB=chatgpt_db
POSTGRES_USER=chatgpt_user
POSTGRES_PASSWORD=secure_password

# Django
DJANGO_SECRET_KEY=your_secret_key
DJANGO_DEBUG=True

# Redis
REDIS_URL=redis://redis:6379
```

## 🧪 Testing
```
# Backend tests
cd backend
pytest

# Frontend tests
cd frontend
npm test
```
## 📖 Documentation
Architecture Overview
API Documentation
Development Guide

## 🤝 Contributing
This is a portfolio project, but suggestions and feedback are welcome! Please feel free to open issues or submit pull requests.

## 📄 License
This project is licensed under the MIT License - see the LICENSE file for details.

## 👤 Author
Rodrigo Fassa

GitHub: https://github.com/fren29

LinkedIn: https://www.linkedin.com/in/rodrigo-fassa-26a213168/

## 🙏 Acknowledgments
OpenAI for providing the GPT API

The Django and React communities for excellent documentation
