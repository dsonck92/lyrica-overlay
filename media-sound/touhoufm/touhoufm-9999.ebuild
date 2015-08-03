# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit git-r3

DESCRIPTION="TouhouFM Radio Application"
HOMEPAGE="http://en.touhou.fm/"
SRC_URI=""
EGIT_BRANCH="master"
EGIT_REPO_URI="https://github.com/dsonck92/touhoufm.git"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="dev-qt/qtgui:5
         dev-qt/qtmultimedia:5
		 dev-qt/qtwebsockets:5
		 dev-qt/qtsvg:5
		 media-plugins/gst-plugins-meta:0.10[mp3,http]"
DEPEND="dev-qt/qtgui:5
		dev-qt/qtmultimedia:5
		dev-qt/qtwebsockets:5
		dev-qt/qtsvg:5"

# TODO: Handle compile dependencies correctly

src_prepare() {
#    epatch "${FILESDIR}/${P}-destdir.patch"
	QT_SELECT=5 qmake TouHouFM.pro PREFIX=/usr
}

src_compile() {
	make 

}
src_install() {
    emake INSTALL_ROOT="${D}" install
}

