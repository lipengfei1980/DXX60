# QT Modules
QT += qml quick serialport

# Target
TARGET = tran
TEMPLATE = app

# Extra Configs
DEFINES += HUATAI_TRAN
CONFIG(release, debug|release) {
    DEFINES += QT_NO_DEBUG_OUTPUT
}

# Sources and Headers
INCLUDEPATH += ../serial
HEADERS += \
    ../serial/serial.h \
    ../serial/protocol.h \
    ../serial/tran.h

SOURCES += main.cpp \
    ../serial/serial.cpp \
    ../serial/protocol.cpp \
    ../serial/tran.cpp

# Qml Files
OTHER_FILES += main.qml \
    MText.qml \
    AllHave.qml \
    NotAllHave.qml \
    Recv.qml

# Resources
RESOURCES += qml.qrc
QMAKE_RESOURCE_FLAGS += -no-compress

target.path = /opt/HuaTai
INSTALLS += target

# Objects Pathes
DESTDIR = bin
UI_DIR = build
MOC_DIR = build
RCC_DIR = build
OBJECTS_DIR = build



