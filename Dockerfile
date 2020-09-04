FROM rileymathews/base:latest

RUN yum -y update && yum -y install \
    java-11-amazon-corretto-headless \
    tar \
    ncurses-compat-libs \
    && yum clean all \
    && \
    # install kotlin compiler
    curl -LJo /tmp/kotlin.zip https://github.com/JetBrains/kotlin/releases/download/v1.4.0/kotlin-compiler-1.4.0.zip && \
    unzip /tmp/kotlin.zip -d /opt/kotlin && \
    rm -rf /tmp/kotlin.zip \
    && \
    # install gradle
    curl -LJo /tmp/gradle.zip https://services.gradle.org/distributions/gradle-6.1-bin.zip && \
    unzip /tmp/gradle.zip -d /opt/gradle && \
    rm -rf /tmp/gradle.zip

# set path for gradle and kotlinc
ENV PATH=$PATH:/opt/gradle/gradle-6.1/bin:/opt/kotlin/kotlinc/bin

# set java home
ENV JAVA_HOME=/usr/lib/jvm/java-11-amazon-corretto.x86_64/

WORKDIR /code
CMD ["/bin/zsh"]
