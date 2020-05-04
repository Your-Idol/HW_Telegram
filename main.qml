import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13

Window {
    visible: true
    color: "#5288c1"
    width: 420
    height: 550
    title: qsTr("Contacts")

    ListModel{
        id: contactsModel
        ListElement{
            name: "Алина"
            pic: "icons/Alina.jpg"
            lastMes: "I think I love Kostya ... he became the meaning of my life"

        }
        ListElement{
            name: "Костя"
            pic: "icons/Kostya.jpg"
            lastMes: "well bro? beer today? I bought UFC3 on PS, call the boys, there will be a contest."

        }
        ListElement{
            name: "Admin"
            lastMes: "once again you will go to the public of Hydra and we will really arrange problems for you."

        }
    }

    ColumnLayout{
        anchors.fill: parent
        SearchBox{
            Layout.fillWidth: true
        }
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
            onMenu: {
                contactListMenu.popup();
            }
        }
    }

    Menu{
        id: contactListMenu
        modal: true
        MenuItem{
            text: "Delete"
            onTriggered: {
                contactsModel.remove(list.menuIndex);
            }
        }
        MenuItem{
            text: "Show Profile"
        }
        MenuItem{
            text: "Disable Notifications"
        }
        MenuItem{
            text: "Clear the History"
        }
    }

}
