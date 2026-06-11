{
  stdenv,
  lib,
  fetchgit,
  pkg-config,
  meson,
  ninja,
  wayland-scanner,
  libglvnd,
  libx11,
  libxkbcommon,
  libxrandr,
  libxrender,
  libxext,
  wayland,
  pango,
  freetype,
  gitUpdater,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "gpu-screen-recorder-notification";
  version = "1.3.3";
  strictDeps = true;
  __structuredAttrs = true;

  src = fetchgit {
    url = "https://repo.dec05eba.com/gpu-screen-recorder-notification";
    tag = finalAttrs.version;
    hash = "sha256-ejAdrqmZYncTxACJNrP3vSx83KygaV3HdR4kAM5wfN0=";
  };

  nativeBuildInputs = [
    pkg-config
    meson
    ninja
  ];

  buildInputs = [
    libglvnd
    libx11
    libxkbcommon
    libxrandr
    libxrender
    libxext
    pango
    freetype
    wayland
    wayland-scanner
  ];

  passthru.updateScript = gitUpdater { };

  meta = {
    description = "Notification in the style of ShadowPlay for GPU Screen Recorder";
    homepage = "https://git.dec05eba.com/gpu-screen-recorder-notification/about/";
    license = lib.licenses.gpl3Only;
    mainProgram = "gpu-screen-recorder-notification";
    maintainers = with lib.maintainers; [ mowmdown ];
    platforms = lib.platforms.linux;
  };
})