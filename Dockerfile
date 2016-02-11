FROM java:jre
MAINTAINER Alesandro Ortiz <aortiz@grovo.com>

RUN mkdir /usr/local/dynamodb
RUN wget http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz
RUN tar -xzf dynamodb_local_latest.tar.gz -C /usr/local/dynamodb

EXPOSE 8000

WORKDIR /usr/local/dynamodb

ENTRYPOINT ["/usr/bin/java", "-Djava.library.path=/usr/local/dynamodb/DynamoDBLocal_lib", "-jar", "DynamoDBLocal.jar", "-sharedDb"]
