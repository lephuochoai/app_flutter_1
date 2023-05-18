enum AppPage { login, home, splash, main, settings, register }

extension AppPageExtension on AppPage {
  String get toPath {
    switch (this) {
      case AppPage.login:
        return "/login";
      case AppPage.register:
        return "/register";
      case AppPage.splash:
        return "/splash";
      case AppPage.main:
        return "/";
      case AppPage.home:
        return "home";
      case AppPage.settings:
        return "settings";

      default:
        return "/";
    }
  }

  String get toName {
    switch (this) {
      case AppPage.login:
        return "LOGIN";
      case AppPage.register:
        return "REGISTER";
      case AppPage.splash:
        return "SPLASH";
      case AppPage.main:
        return "MAIN";
      case AppPage.home:
        return "HOME";
      case AppPage.settings:
        return "SETTINGS";

      default:
        return "HOME";
    }
  }

  String get toTitle {
    switch (this) {
      case AppPage.login:
        return "Login screen";
      case AppPage.register:
        return "Register screen";
      case AppPage.splash:
        return "Splash screen";
      case AppPage.main:
        return "Main layout";
      case AppPage.home:
        return "Home screen";
      case AppPage.settings:
        return "Settings screen";

      default:
        return "My App";
    }
  }
}
