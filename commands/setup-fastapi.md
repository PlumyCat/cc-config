# Setup FastAPI Project

Initialize a complete FastAPI project with best practices, virtual environment, and proper project structure.

## Project Setup Goals

Create a production-ready FastAPI project with:
- Virtual environment (.venv) setup and activation
- Modern FastAPI structure with dependency injection
- Comprehensive testing setup (pytest, coverage)
- Code quality tools (ruff, mypy) configured
- Docker configuration for deployment
- Environment configuration with Pydantic settings
- API documentation and examples

## Implementation Steps

1. **Environment Setup**
   - Create and activate .venv virtual environment
   - Upgrade pip and install FastAPI ecosystem
   - Set up requirements.txt structure

2. **Project Structure**
   ```
   project/
   ├── .venv/
   ├── app/
   │   ├── __init__.py
   │   ├── main.py
   │   ├── config.py
   │   ├── models/
   │   ├── routers/
   │   ├── dependencies.py
   │   └── database.py
   ├── tests/
   ├── requirements.txt
   ├── requirements-dev.txt
   ├── Dockerfile
   ├── .env.example
   └── README.md
   ```

3. **Dependencies Installation**
   - fastapi[all] for complete FastAPI with extras
   - uvicorn[standard] for ASGI server
   - pydantic-settings for configuration
   - sqlalchemy and alembic for database
   - pytest and pytest-asyncio for testing

4. **Development Tools**
   - ruff for linting and formatting
   - mypy for type checking
   - pytest-cov for coverage reporting
   - pre-commit hooks setup

5. **Configuration**
   - Type-safe environment variables with Pydantic
   - Database connection setup
   - CORS and middleware configuration
   - Logging configuration

6. **Basic Implementation**
   - Health check endpoint
   - Example CRUD operations
   - Dependency injection patterns
   - Error handling middleware

7. **Testing Framework**
   - Test client setup
   - Example unit and integration tests
   - Coverage configuration (target >90%)

8. **Documentation**
   - README with setup instructions
   - API documentation examples
   - Development workflow documentation

Use the python-expert agent proactively throughout this process to ensure all Python best practices are followed.