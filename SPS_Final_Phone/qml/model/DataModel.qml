import QtQuick 2.0
import Felgo 3.0

Item{
    id:dataModel
    property  var userInform   
    property var userInform_2

    Component.onCompleted: {
//        HttpRequest.get(Qt.resolvedUrl("/root/Demo_10/qml/data/user.json"))
        HttpRequest.get(Qt.resolvedUrl("../data/user.json"))
        .then(function(res){
//            console.log(res.body)
            console.log("read user's information")
            userInform=JSON.parse(res.body)
        })
        .catch(function(err){
            console.log(err.message)
            console.log(err.response)
        })


//        HttpRequest.get(Qt.resolvedUrl("/root/Demo_10/qml/data/user_2.json"))
//        .then(function(res){
//            console.log(res.body)
//            console.log("read user's information")
//            userInform_2=JSON.parse(res.body)
//        })
//        .catch(function(err){
//            console.log(err.message)
//            console.log(err.response)
//        })
    }

    Connections{
        target: saveJson
        onDataChanged: {
//            HttpRequest.get(Qt.resolvedUrl("/root/Demo_10/qml/data/user.json"))
            HttpRequest.get(Qt.resolvedUrl("../data/user.json"))
            .then(function(res){
                console.log(res.body)
                console.log("read user's information")
                userInform=JSON.parse(res.body)
            })
            .catch(function(err){
                console.log(err.message)
                console.log(err.response)
            })
        }
    }
}
