FROM buildpack-deps:bionic

RUN set -ex; \
    useradd --create-home codewarrior; \
    ln -s /home/codewarrior /workspace;

RUN set -ex; \
    curl -sL https://deb.nodesource.com/setup_8.x | bash -; \
    apt-get install -y nodejs; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/*;

RUN set -ex; \
    mkdir -p /opt/purescript; \
    curl -fsSL https://github.com/purescript/purescript/releases/download/v0.12.2/linux64.tar.gz | tar xz -C /opt/purescript --strip-components=1; \
    curl -fsSL https://github.com/purescript/psc-package/releases/download/v0.5.1/linux64.tar.gz | tar xz -C /opt/purescript --strip-components=1;

RUN npm install -g pulp@12.3.1;

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
    psc-package install; \
# compile packages
    psc-package build; \
# ensure running `Main.purs` works
    pulp run; \
# ensure testing works
    pulp test || true; \
# clean up
    rm -rf ./src/Main.purs ./output/Main/ ./test/Example/ ./output/Example.ExampleSpec/;
