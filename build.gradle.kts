plugins {
    kotlin("multiplatform") version "1.4.0"
}

repositories {
    mavenCentral()
}

kotlin {
  linuxX64("native") {
    binaries {
      executable()
    }
  }
}
