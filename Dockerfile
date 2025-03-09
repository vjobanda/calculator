# Common base
FROM python:3.11-slim AS base
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Image for tests
FROM base AS test-target
COPY . .
CMD ["sh", "-c", "python -m coverage run -m unittest tests/test_calculator.py && coverage report -m"]

# Image for production
FROM base AS production
COPY src .