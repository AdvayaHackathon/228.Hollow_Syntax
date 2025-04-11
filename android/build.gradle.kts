allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Define a custom build directory for the root project
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()

// Set the custom build directory for the root project
rootProject.layout.buildDirectory.set(newBuildDir)

// Configure build directory for each subproject


// Custom clean task that deletes the build directory
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
