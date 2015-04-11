# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit git-r3

DESCRIPTION="Collection of tools useful for audio production"
HOMEPAGE="https://github.com/falkTX/Cadence"
SRC_URI=""
EGIT_BRANCH="master"
EGIT_REPO_URI="https://github.com/falkTX/Cadence.git"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="launcher"
RDEPEND="dev-python/PyQt4"
DEPEND="${RDEPEND}"

src_prepare() {
    epatch "${FILESDIR}/${P}-destdir.patch"
	if use launcher ; then
	epatch "${FILESDIR}/${P}-launcher.patch"
	fi
	make clean
}

src_compile() {
	make 

}
src_install() {
    emake DESTDIR="${D}" install
}

