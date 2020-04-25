import QtQuick 2.13
import QtQuick.Layouts 1.13
import QtQuick.Controls 2.13

Rectangle {
    id: me

    property alias icon: icon.source
    property alias text: label.text
    property alias being: lastMessage.text
    property bool selected: false

    signal leftClick()
    signal rightClick()

    color: {
        if (selected)
            return "#4fc1e9"
        if(area.containsMouse)
            return "#f1f1f1"
        return "white";
    }

    width: parent.width
    height: 60

    RowLayout{
        anchors.fill: parent
        spacing: 0
        anchors.leftMargin: 4
        anchors.rightMargin: 4
        Image {
            id: icon
            source: "icons/tg.png"
            Layout.fillHeight: true
            Layout.preferredWidth: height
            Layout.margins: 4
        }
        ColumnLayout{
            Label{
                id:label
                font.bold:true
            }
            Label{
                id:lastMessage
                text:"you are not allowed to write messages"
            }
        }
    }
    MouseArea{
        id: area
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: {
            if (mouse.button === Qt.LeftButton)
                leftClick();
            if (mouse.button === Qt.RightButton)
                rightClick();
        }
    }
}
