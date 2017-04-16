
FROM ubuntu:17.04

RUN apt-get update
RUN apt-get install -y nodejs libghc-terminfo-dev libncurses-dev build-essential haskell-platform
RUN cabal update
RUN cabal install Cabal cabal-install
ENV PATH /root/.local/bin:/root/.cabal/bin:$PATH
RUN cabal update
RUN apt-get install -y openjdk-8-jdk curl
RUN curl -sSL https://get.haskellstack.org/ | sh
RUN cabal install idris

WORKDIR /data

CMD ["idris"]
