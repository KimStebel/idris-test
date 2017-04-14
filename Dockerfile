
FROM ubuntu:17.04

RUN apt-get update
RUN apt-get install -y nodejs libghc-terminfo-dev libncurses-dev build-essential haskell-platform
RUN cabal update
RUN cabal install Cabal cabal-install
ENV PATH /root/.cabal/bin:$PATH
RUN cabal update
RUN cabal install idris

WORKDIR /data

CMD ["idris"]
