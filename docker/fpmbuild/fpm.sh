#!/bin/bash


for i in "$@"
do
case $i in
    -p=*|--package=*)
    PACKAGE="${i#*=}"

    ;;
    -v=*|--version=*)
    VERSION="${i#*=}"
esac
done

DOCKER_IMG=qba73/fpm-deb

if [ -f ./hashicorp/$PACKAGE*$VERSION*.deb ]; then
    echo "Debian package $PACKAGE version $VERSION already exist" 
    echo "Skipping build"
    exit 1
fi

echo "Building $PACKAGE debian package version $VERSION ..."
docker run --rm -i -t --name fpm -v $PWD/hashicorp:/hashicorp $DOCKER_IMG /bin/bash -c "cd /hashicorp && cp * /usr/bin/ && fpm -s dir -t deb -n $PACKAGE -v $VERSION /usr/bin/packer"
