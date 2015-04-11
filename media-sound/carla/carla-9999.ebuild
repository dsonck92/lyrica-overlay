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
IUSE="qt4 alsa opengl pulseaudio X fluidsynth linuxsampler projectm osc"

RDEPEND="qt4? ( dev-python/PyQt4
                dev-qt/qtgui )
		 alsa? ( media-libs/alsa-lib )
		 opengl? ( virtual/opengl )
		 pulseaudio? ( media-sound/pulseaudio )
		 X? ( x11-libs/libX11 )
		 fluidsynth? ( media-sound/fluidsynth )
		 linuxsampler? ( media-sound/linuxsampler )
		 projectm? ( media-libs/libprojectm )
		 osc? ( media-libs/liblo )"
DEPEND="${RDEPEND}"

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

