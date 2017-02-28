# QT Modules
QT += qml quick serialport

# Target
TARGET = gardenia
TEMPLATE = app

# Extra Configs
CONFIG(release, debug|release) {
       DEFINES += QT_NO_DEBUG_OUTPUT
}

# Sources and Headers
SOURCE_FOLDER = src
HEADER_FOLDER = src/include

INCLUDEPATH += $$HEADER_FOLDER
HEADERS += $$HEADER_FOLDER/serial.h \
    $$HEADER_FOLDER/protocol.h \
    $$HEADER_FOLDER/carstatus.h \
    $$HEADER_FOLDER/fontName.h

SOURCES += $$SOURCE_FOLDER/main.cpp \
    $$SOURCE_FOLDER/serial.cpp \
    $$SOURCE_FOLDER/protocol.cpp \
    $$SOURCE_FOLDER/carstatus.cpp

# Qml Files
QML_FOLDER = qml/content
QML_FOLDER_WARNING = $$QML_FOLDER/Warning
OTHER_FILES += qml/mainViewer.qml \
    $$QML_FOLDER/*.qml \
    $$QML_FOLDER_WARNING/*.qml \
    $$QML_FOLDER/qmldir

# Resources
RESOURCES += gardenia.qrc
QMAKE_RESOURCE_FLAGS += -no-compress


fontsFiles.files = fonts/FZDaHei.ttf \
    fonts/miniMicroSoftYahei.ttf

# Objects Pathes
DESTDIR = bin
UI_DIR = build
MOC_DIR = build
RCC_DIR = build
OBJECTS_DIR = build
