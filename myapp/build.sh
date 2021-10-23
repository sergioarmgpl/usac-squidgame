docker login
docker build --no-cache -t czdev/python-flask-distroless .
docker push czdev/python-flask-distroless
