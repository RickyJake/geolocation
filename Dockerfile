FROM openjdk:8
ADD target/bioMedical-0.0.4-SNAPSHOT.jar bioMedical-0.0.4-SNAPSHOT.jar
EXPOSE 8081
ENTRYPOINT ["-java","-jar","bioMedical-0.0.4-SNAPSHOT.jar"]
