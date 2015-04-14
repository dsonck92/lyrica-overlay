# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit git-r3

DESCRIPTION="Audio plugin host"
HOMEPAGE="https://github.com/falkTX/Carla"
SRC_URI=""
EGIT_BRANCH="master"
EGIT_REPO_URI="https://github.com/falkTX/Carla.git"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="frontend qt4 qt5 gtk gtk2 vst alsa opengl pulseaudio X fluidsynth linuxsampler projectm osc zynaddsubfx"

RDEPEND="frontend? ( dev-python/PyQt4
                     dev-qt/qtgui:4
					 x11-libs/libX11 )
		 osc? ( media-libs/liblo )
		 alsa? ( media-libs/alsa-lib )
		 pulseaudio? ( media-sound/pulseaudio )
		 vst? ( x11-libs/libX11 )
		 gtk2? ( x11-libs/gtk+:2 )
		 gtk?  ( x11-libs/gtk+:3 )
         qt4? ( dev-qt/qtgui:4 )
		 qt5? ( dev-qt/qtgui:5 )
		 X? ( x11-libs/libX11 )
		 fluidsynth? ( media-sound/fluidsynth )
		 linuxsampler? ( media-sound/linuxsampler )
		 projectm? ( media-libs/libprojectm )
		 opengl? ( virtual/opengl )
		 zynaddsubfx? ( x11-libs/fltk
		                sci-libs/fftw:3
						dev-libs/mini-xml
						sys-libs/zlib )"
DEPEND="dev-python/PyQt4
        dev-qt/qtgui
        media-libs/alsa-lib
        virtual/opengl
        media-sound/pulseaudio
        x11-libs/libX11
        media-sound/fluidsynth
        media-sound/linuxsampler
        media-libs/libprojectm
        media-libs/liblo"

# TODO: Handle compile dependencies correctly

src_prepare() {
    epatch "${FILESDIR}/${P}-destdir.patch"
	make clean
}

src_compile() {
	make 

}
src_install() {
    emake DESTDIR="${D}" install
}

