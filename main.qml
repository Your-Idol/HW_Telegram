import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13

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

    ColumnLayout{
        anchors.fill: parent
        MainToolBar{
            Layout.fillWidth: true
            onNewItem: {
                contactsModel.append({name: text});
            }
        }
        ContactList{
            Layout.fillHeight: true
            Layout.fillWidth: true
            model: contactsModel
        }
    }

}
