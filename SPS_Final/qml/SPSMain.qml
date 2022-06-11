import Felgo 3.0
import "./model"

App {
  id: app

  // You get free licenseKeys from https://felgo.com/licenseKey
  // With a licenseKey you can:
  //  * Publish your games & apps for the app stores
  //  * Remove the Felgo Splash Screen or set a custom one (available with the Pro Licenses)
  //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
  //licenseKey: "<generate one from https://felgo.com/licenseKey>"

  onInitTheme: {
    // Set styles
    Theme.colors.tintColor = "#fff"
    Theme.colors.backgroundColor = "#fff"
    Theme.colors.textColor = "#000"
    Theme.navigationBar.backgroundColor = Theme.tintColor
    Theme.navigationBar.titleColor = "lightpink"
    Theme.navigationBar.itemColor = "lightpink"

    Theme.colors.statusBarStyle = Theme.colors.statusBarStyleWhite
  Theme.navigationBar.height=dp(20)
  }

  SPSMainItem { }
//  DataModel{

//  }


}
