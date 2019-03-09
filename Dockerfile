FROM centos:7
EXPOSE 8080
ENV SOURCES=/sources
RUN yum update -y
RUN yum install -y file gcc openssl-devel
RUN curl https://sh.rustup.rs -sSf > install.sh
RUN sh ./install.sh -y
RUN mkdir -p $SOURCES
ADD ./ $SOURCES
WORKDIR $SOURCES
RUN $HOME/.cargo/bin/cargo build --release
CMD ./target/release/rust-gae-gcb