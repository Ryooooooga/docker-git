#!/bin/sh
GIT_VERSIONS="$(cat versions.txt)"
LATEST_GIT_VERSION="$(tail -n1 versions.txt)"

docker pull ryooooooga/git:latest
docker build --build-arg="GIT_VERSION=$LATEST_GIT_VERSION" -t ryooooooga/git:latest .

for v in $GIT_VERSIONS; do
    echo "v$v"
    docker build --cache-from=ryooooooga/git:latest --build-arg="GIT_VERSION=$v" -t ryooooooga/git:"$v" .
    docker push ryooooooga/git:"$v"
    docker rmi ryooooooga/git:"$v"
done

docker push ryooooooga/git:latest
