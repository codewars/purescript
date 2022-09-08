FROM buildpack-deps:bionic

RUN set -ex; \
    useradd --create-home codewarrior; \
    mkdir -p /workspace; \
    chown -R codewarrior: /workspace;

RUN set -ex; \
    curl -sL https://deb.nodesource.com/setup_16.x | bash -; \
    apt-get install -y nodejs; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/*;

RUN npm install -g purescript@0.15.4;
RUN npm install -g spago@0.20.9;

COPY --chown=codewarrior:codewarrior workspace/ /workspace
WORKDIR /workspace

USER codewarrior

ENV USER=codewarrior \
    HOME=/home/codewarrior \
    PATH=/opt/purescript:$PATH

RUN set -ex; \
    cd /workspace; \
    npm install; \
    # install packages
    spago install; \
    # compile packages
    spago build; \
    # ensure running `Main.purs` works
    spago run; \
    # ensure testing works
    spago test || true; \
    # clean up
    rm -rf ./src/Main.purs ./output/Main/ ./test/Example/ ./output/Example.ExampleSpec/;
