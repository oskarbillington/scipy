# Build the Docker image
docker build -t scipy-dev .

# Run the Docker container and attach it to the current terminal
docker run --rm -v ${PWD}:/usr/src/scipy scipy-dev bash -c "
    python3 setup.py build_ext --inplace &&
    python3 runtests.py
"
