FROM python:3.9

# Working dir
WORKDIR /app

# Copy to container
COPY . .

# Install dependacies
RUN pip install -r src/requirements.txt

# Open port
EXPOSE 5001

# Run script
CMD ["python", "src/server.py"]