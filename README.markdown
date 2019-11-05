# About

This is a CLI to run [IntelliJ Plugin Verifier from command-line](https://github.com/JetBrains/intellij-plugin-verifier)

Usage
-----

The scripts assumes that it is run in the Gradle-based plugin builds, such as [git-quickbranches-idea-plugin](https://github.com/novotnyr/git-quickbranches-idea-plugin)

Preparation steps:

- assemble your plugin via `./gradlew buildPlugin`
- a `build/distributions` folder will contain the resulting ZIP

In the root folder of the plugin (parent of `build`), run `verify.sh`.

It is strongly recommended to put the parent directory of `verify.sh` to `PATH` environment variable.

The *Verifier* will create a directory with verification results.

# Configuration

The following variables must be set and exported:

- `JAVA_HOME` pointing to the location of Java
- `VERIFIER_HOME` pointing to the directory that contains `verifier-all.jar` with plugin verifier code. 
- `IDE_PATHS` containing a list of folders with IntelliJ IDE distributions. By default, the IDE located in `/Applications/IntelliJ IDEA.app/contents` is used. 