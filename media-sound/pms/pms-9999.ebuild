# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=2

inherit autotools git-2

DESCRIPTION="Practical Music Search: an open source ncurses client for mpd, written in C++"
HOMEPAGE="http://pms.sourceforge.net/"
SRC_URI=""

EGIT_REPO_URI="git://github.com/ambientsound/pms.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="regex"

RDEPEND="
	sys-libs/ncurses
	dev-libs/glib:2
	regex? ( >=dev-libs/boost-1.36 )
"
DEPEND="
	virtual/pkgconfig
	${RDEPEND}
"

src_prepare() {
	# bug #424717
	sed -i "s:^CXXFLAGS +=:AM_CXXFLAGS =:g" Makefile.am || die "sed failed"

	eautoreconf
}

src_configure() {
	econf \
		$(use_enable regex) ||
			die "configure failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "installation failed"

	dodoc AUTHORS README TODO
}
