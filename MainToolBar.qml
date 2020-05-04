import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13

RowLayout {
    signal newItem(string text )
    TextField{
        id: textFiled
        Layout.fillWidth: true
        selectByMouse: true
        focus: true
    }

    function add(){
        newItem(textFiled.text);
        textFiled.clear();
    }

    Button{
        text: "Add"
        highlighted: true
        onClicked: {
            add();
        }
    }

    Keys.onReturnPressed: {
        add();
    }
    Keys.onEnterPressed: {
        add();
    }
}
