import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Rectangle {
    id: container
    width: 1920
    height: 1080
    color: "black"

    Image {
        id: background
        source: "background.png"
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
    }

    // Часы
    Text {
        id: clock
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 80
        text: Qt.formatDateTime(new Date(), "HH:mm")
        font.family: "JetBrains Mono"
        font.pixelSize: 110
        font.weight: Font.Bold
        color: "white"
        layer.enabled: true
        layer.effect: DropShadow { color: "#aa8870a0"; radius: 25; samples: 30 }
    }

    // Центр: Приветствие и Пароль
    Column {
        anchors.centerIn: parent
        spacing: 20

        Text {
            text: userModel.lastUser ? "HELLO, " + userModel.lastUser.toUpperCase() : "HELLO"
            font.family: "JetBrains Mono"
            font.pixelSize: 26
            color: "#d0d0d0"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        TextField {
            id: passwordField
            width: 380; height: 60
            echoMode: TextInput.Password
            passwordCharacter: "●"
            placeholderText: "PASSWORD"
            placeholderTextColor: "#77ffffff"
            color: "white"
            font.family: "JetBrains Mono"
            font.pixelSize: 32
            horizontalAlignment: TextInput.AlignHCenter
            selectionColor: "#8870a0"

            background: Rectangle {
                color: "#20ffffff"
                border.color: "#8870a0"
                border.width: 1
                radius: 15
            }

            onAccepted: sddm.login(userModel.lastUser, passwordField.text, sessionList.currentIndex)
        }
    }

    // Список сессий слева снизу
    Column {
        id: sessionContainer
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.margins: 50
        spacing: 10

        Repeater {
            id: sessionList
            model: sessionModel
            
            // Храним выбранный индекс
            property int currentIndex: sessionModel.lastIndex

            delegate: Item {
                width: sessionText.implicitWidth
                height: 30

                Text {
                    id: sessionText
                    text: model.name.toUpperCase()
                    font.family: "JetBrains Mono"
                    font.pixelSize: 16
                    font.letterSpacing: 1
                    color: index === sessionList.currentIndex ? "white" : "#66ffffff"
                    
                    Behavior on color { ColorAnimation { duration: 200 } }
                }

                // Линия подчеркивания для активной сессии
                Rectangle {
                    anchors.top: sessionText.bottom
                    anchors.topMargin: 4
                    width: sessionText.width
                    height: 2
                    color: "#8870a0"
                    opacity: index === sessionList.currentIndex ? 0.6 : 0.0
                    
                    Behavior on opacity { NumberAnimation { duration: 250 } }
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: sessionList.currentIndex = index
                }
            }
        }
    }

    Timer {
        interval: 1000; running: true; repeat: true
        onTriggered: clock.text = Qt.formatDateTime(new Date(), "HH:mm")
    }

    Component.onCompleted: passwordField.forceActiveFocus()
}
