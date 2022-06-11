import QtQuick 2.4
import QtQuick.Controls 1.2

import Felgo 3.0
import "."
import "../widgets"

Page {
    id: twitterMainPage

    useSafeArea: false // fill full screen

    Component {
        id: mainPageComponent
        MainPage {}
    }

    Navigation {
        id: navigation

        NavigationItem {
            title: "Home"
            icon: IconType.home

            NavigationStack {
                //MainPage {}
                LoginPage {}
            }
        }
    }
}
