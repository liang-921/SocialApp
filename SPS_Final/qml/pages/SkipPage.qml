import QtQuick 2.0
import Felgo 3.0

Page {
    navigationBarHidden: true

    Component{
        id:iconcomponent_home
        Icon{
            anchors.centerIn: parent
            color: "lightpink"
            icon: IconType.home
            size:dp(20)
        }
    }

    Component{
        id:iconcomponent_follow
        Icon{
            anchors.centerIn: parent
            color: "lightpink"
            icon: IconType.hearto
            size:dp(20)
        }
    }

    Component{
        id:iconcomponent_release
        Icon{
            anchors.centerIn: parent
            color: "lightpink"
            icon: IconType.plussquareo
            size:dp(20)
        }
    }

    Component{
        id:iconcomponent_message
        Icon{
            anchors.centerIn: parent
            color: "lightpink"
            icon: IconType.sendo
            size:dp(20)
        }
    }

    Component{
        id:iconcomponent_person
        Icon{
            anchors.centerIn: parent
            color: "lightpink"
            icon: IconType.user
            size:dp(20)
        }
    }

    Navigation {
        id: navigation
        navigationMode: navigationModeTabs

        NavigationItem {
            title:"Home"
            iconComponent: iconcomponent_home
            NavigationStack {
                MainPage {}
            }
        }
        NavigationItem {
            title: "Follow"
            iconComponent: iconcomponent_follow
            NavigationStack {
                AttentionMainPage {}
            }
        }
        NavigationItem {
            title: "Release"
            iconComponent: iconcomponent_release
            NavigationStack {
                Change1PicPage {}
            }
        }
        NavigationItem {
            title: "Message"
            iconComponent: iconcomponent_message
            NavigationStack {
                MessagesPage {}
            }
        }
        NavigationItem {
            title: "ME"
            iconComponent: iconcomponent_person
            NavigationStack {
                PersonPage {}
            }
        }
    }
}
