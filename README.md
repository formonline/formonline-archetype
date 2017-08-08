# fol-archetype
formonline application archetype

## Requirements
- Download (or clone) and install the formonline project  (`mvn install`)

## Installation
- Download (or clone) and install the fol-archetype project  (`mvn install`)
- Create a project with the artifact :

```
mvn archetype:generate -DarchetypeGroupId=fr.seboo -DarchetypeArtifactId=fol-archetype -DarchetypeVersion=1.0.0-SNAPSHOT -DgroupId=<YOUR-GROUP> -DartifactId=<YOUR-ARTIFACT>
```

- Create a database and execute the `fol-example.SQL` script
- Modify if necessary the database source in the profile section of the POM.xml
- Run `mvn tomcat7:run` to build and deploy a dev server (or `mvn org.apache.tomcat.maven:tomcat7-maven-plugin:run-war`)

- see the result at `http://localhost:9090/projectname`
