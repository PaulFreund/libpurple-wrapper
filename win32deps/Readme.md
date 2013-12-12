# Instructions

## Download dependencies

* GTK (all-in-one bundle) http://www.gtk.org/download/win32.php
* GetText http://ftp.gnome.org/pub/gnome/binaries/win32/dependencies/gettext-runtime_0.18.1.1-2_win32.zip
* Pidgin Binaries http://pidgin.im/download/windows/
* Pidgin Sources http://pidgin.im/download/source/

##  Prepare GTK

* Extract GTK archive
* Create folder win32deps/glib
* Create folder win32deps/dlls
* Copy from GTK bin/ to win32deps/dlls
 * libgio-2.0-0.dll
 * libglib-2.0-0.dll
 * libgmodule-2.0-0.dll
 * libgobject-2.0-0.dll
 * libgthread-2.0-0.dll
 * libffi-6.dll
* Create folder win32deps/glib/lib
* Copy from GTK lib/ to win32deps/glib/lib/
 * gio-2.0.lib
 * glib-2.0.lib
 * gmodule-2.0.lib
 * gobject-2.0.lib
 * gthread-2.0.lib
* Copy include/glib-2.0 from GTK to win32deps/glib/include
* Copy from GTK lib/glib-2.0/include/glibconfig.h to win32deps/glib/include/

## Prepare GetText

* Extract GetText archive
* Copy from GetText bin/intl.dll to win32deps/dlls

## Prepare PidginSource

* Extract PidginSource archive
* Create folder win32deps/libpurple
* Create folder win32deps/libpurple/include
* Create folder win32deps/libpurple/include/media
* Create folder win32deps/libpurple/include/win32
* Copy from PidginSource libpuple/*.h to win32deps/libpurple/include
* Copy from PidginSource libpuple/media/*.h to win32deps/libpurple/include/media
* Copy from PidginSource libpuple/win32/*.h to win32deps/libpurple/include/win32

## Prepare PidginBinary

* Extract PidginBinary (installer) with 7zip
* Copy win32deps/libify.sh to PidginBinary folder
* Execute libify.sh (with bash) 
* Create folder win32deps/libpurple/lib
* Copy from PidginBinary folder lib/*.lib to win32deps/libpurple/lib
* Copy from PidginBinary folder *.dll to win32deps/dlls
* Copy from PidginBinary folder $_OUTDIR/plugins/ to win32deps/dlls/plugins
* Copy from PidginBinary folder $_OUTDIR/sasl2/ to win32deps/dlls/sasl2


