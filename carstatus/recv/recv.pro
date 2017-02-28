# QT Modules
QT += qml quick  serialport

# Target
TARGET = recv
TEMPLATE = app

# Extra Configs
DEFINES += HUATAI_B11
DEFINES += HUATAI_B21
DEFINES += TIMER_FREQ
DEFINES += HUATAI_RECV
DEFINES += HUATAI_DEBUG
CONFIG(release, debug|release) {
    DEFINES += QT_NO_DEBUG_OUTPUT
}

# Sources and Headers
INCLUDEPATH += ../serial
HEADERS += \
    ../serial/serial.h \
    ../serial/protocol.h \
    ../serial/carstatus.h \
    ../serial/htcarstatus.h

SOURCES += main.cpp \
    ../serial/serial.cpp \
    ../serial/protocol.cpp \
    ../serial/carstatus.cpp \
    ../serial/htcarstatus.cpp

# Qml Files
OTHER_FILES += main.qml \
    MText.qml \
    AllHave.qml \
    NotAllHave.qml \
    Send.qml

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

