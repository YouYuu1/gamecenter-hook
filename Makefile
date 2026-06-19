TARGET := iphone:clang:latest:14.0
ARCHS = arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = GameCenterHook

GameCenterHook_FILES = Tweak.x
GameCenterHook_FRAMEWORKS = UIKit GameKit

# KORONNE POPRAWKI POD SIDELOADING:
# 1. Zmiana sztywnej ścieżki MobileSubstrate na dynamiczny rpath aplikacji
GameCenterHook_DYLIB_INSTALL_NAME = @rpath/GameCenterHook.dylib
# 2. Flagi optymalizacyjne dla kompilatora, usuwające śmieci debugowania
GameCenterHook_CFLAGS = -fvisibility=hidden
GameCenterHook_LDFLAGS = -Xlinker -unexported_symbol -Xlinker "*_logos_*"

include $(THEOS_MAKE_PATH)/tweak.mk
