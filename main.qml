import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13

Window {
    visible: true
    width: 320
    height: 480
    title: qsTr("Contacts")

    ListModel{
        id: contactsModel
        ListElement{
            name: "Алина"
        }
        ListElement{
            name: "Костя"
        }
    }

    ListView{
        id: list
        anchors.fill: parent
        clip: true
        boundsBehavior: ListView.StopAtBounds
        ScrollBar.vertical: ScrollBar{}
        model: contactsModel
        delegate: ContactItem{
            text: name
            selected: list.currentIndex === index
            onLeftClick: {
                list.currentIndex = index
            }
        }
    }
}
