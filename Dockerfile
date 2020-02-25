FROM amazonlinux:2

RUN yum -y update && yum -y install \
    java-11-amazon-corretto-headless \
    curl \
    unzip \
    gzip \
    tar \
    ncurses-compat-libs \
    yum clean

RUN curl -LJo /tmp/kotlin.zip https://github.com/JetBrains/kotlin/releases/download/v1.3.61/kotlin-compiler-1.3.61.zip && \
    unzip /tmp/kotlin.zip -d /opt/kotlin && \
    rm -rf /tmp/kotlin.zip

RUN curl -LJo /tmp/gradle.zip https://services.gradle.org/distributions/gradle-6.1-bin.zip && \
    unzip /tmp/gradle.zip -d /opt/gradle && \
    rm -rf /tmp/gradle.zip

ENV PATH=$PATH:/opt/gradle/gradle-6.1/bin
ENV PATH=$PATH:/opt/kotlin/kotlinc/bin
ENV JAVA_HOME=/usr/lib/jvm/java-11-amazon-corretto.x86_64/

WORKDIR /code
ENTRYPOINT [""]
CMD ["bash"]
