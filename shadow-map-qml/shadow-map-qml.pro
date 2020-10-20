

QT += quick qml 3dcore 3drender 3dinput 3dquick qml quick 3dquickextras

SOURCES += \
    calculation.cpp \
    main.cpp

OTHER_FILES += \
    main.qml \
    AdsMaterial.qml \
    AdsEffect.qml \
    ShadowMapLight.qml \
    ShadowMapFrameGraph.qml \
    Trefoil.qml \
    Toyplane.qml \
    GroundPlane.qml

RESOURCES += \
    shadow-map-qml.qrc \
    ../exampleresources/obj.qrc

DISTFILES += \
    Bottomsphere.qml

HEADERS += \
    calculation.h
