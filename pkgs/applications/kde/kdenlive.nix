{ mkDerivation
, lib
, extra-cmake-modules
, kdoctools
, kactivities
, kconfig
, kcrash
, kguiaddons
, kiconthemes
, ki18n
, kinit
, kio
, kio-extras
, kwindowsystem
, kdbusaddons
, plasma-framework
, knotifications
, knewstuff
, karchive
, knotifyconfig
, kplotting
, ktextwidgets
, mlt
, shared-mime-info
, libv4l
, kfilemetadata
, ffmpeg
, phonon-backend-gstreamer
, qtdeclarative
, qtquickcontrols
, qtscript
, qtwebkit
}:

mkDerivation {
  name = "kdenlive";
  nativeBuildInputs = [
    extra-cmake-modules
    kdoctools
  ];
  buildInputs = [
    kconfig
    kcrash
    kdbusaddons
    kfilemetadata
    kguiaddons
    ki18n
    kiconthemes
    kinit
    knotifications
    knewstuff
    karchive
    knotifyconfig
    kplotting
    ktextwidgets
    mlt
    phonon-backend-gstreamer
    qtdeclarative
    qtquickcontrols
    qtscript
    qtwebkit
    shared-mime-info
    libv4l
    ffmpeg
  ];
  postPatch =
    # Module Qt5::Concurrent must be included in `find_package` before it is used.
    ''
      sed -i CMakeLists.txt -e '/find_package(Qt5 REQUIRED/ s|)| Concurrent)|'
    '';
  meta = {
    license = with lib.licenses; [ gpl2Plus ];
  };
}
