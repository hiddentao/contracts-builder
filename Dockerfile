FROM node:24-slim

# install deps
RUN apt update
RUN apt install -y g++ make curl git unzip
SHELL ["/bin/bash", "-c"]
RUN curl -sSf https://sh.rustup.rs | bash -s -- -y
RUN echo "source ~/.cargo/env" > ~/.bashrc
RUN source ~/.bashrc && cargo install svm-rs
RUN source ~/.bashrc && svm install 0.7.6 && svm install 0.8.24 && svm use 0.8.24
RUN curl -L https://foundry.paradigm.xyz | bash
RUN source ~/.bashrc && foundryup

# start in the shell
ENTRYPOINT [ "/bin/bash" ]