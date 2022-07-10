parametro=$1

case $parametro in

  build-image)
    docker build -t estudosaction .
    ;;

  start)
    docker run --rm -p 3000:3000 -v ${PWD}:/usr/src/app -it estudosaction npm run server
    ;;

  test)
    docker run --rm -v ${PWD}:/usr/src/app -it estudosaction ../node_modules/.bin/jest $2
    ;;

  container)
    docker run -it --rm -v "$PWD":/usr/src/app -w /usr/src/app estudosaction /bin/sh
    ;;

  *)
    echo "Comandos:"
    echo "build-image|start|test|container"
    ;;
esac