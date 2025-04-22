def MY_KEYSTORE_PASSWORD = project.hasProperty('MY_KEYSTORE_PASSWORD') ? project.MY_KEYSTORE_PASSWORD : ""
def MY_KEY_PASSWORD = project.hasProperty('MY_KEY_PASSWORD') ? project.MY_KEY_PASSWORD : ""


plugins {
    id("com.android.application")
    id("com.google.gms.google-services")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    signingConfigs {
        create("release") {
            storeFile = file("release-key.jks")
            storePassword = MY_KEYSTORE_PASSWORD
            keyAlias = "release_alias"
            keyPassword = MY_KEY_PASSWORD

            /*
            * gerar release-key
            * keytool -genkey -v -keystore release.keystore -alias release_alias -keyalg RSA -keysize 2048 -validity 10000
            *
            * pegar o SHA-1
            * keytool -list -v -keystore android/app/release.keystore -alias release-alias
            * */
        }
    }

    namespace = "com.example.jh_mobile"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.jh_mobile"
        minSdk = 23
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("release")
        }
    }
}

flutter {
    source = "../.."
}
