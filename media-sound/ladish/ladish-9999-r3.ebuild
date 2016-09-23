# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE='threads(+)'
#inherit git-2 python-single-r1 waf-utils

DESCRIPTION="LADI Session Handler - a session management system for JACK applications"
HOMEPAGE="http://ladish.org/"
#EGIT_REPO_URI="git://repo.or.cz/${PN}.git"

SRC_URI="http://dist.sonck.nl/gentoo/media-sound/ladish/ladish-9999.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="doc lash python"
REQUIRED_USE="${PYTHON_REQUIRED_USE}
	python? ( lash )"

# Gentoo bug #477734
RDEPEND="!media-libs/lash
	media-sound/jack-audio-connection-kit[dbus]
	>=x11-libs/flowcanvas-0.6.4
	sys-apps/dbus
	>=dev-libs/glib-2.20.3
	>=x11-libs/gtk+-2.20.0
	>=dev-libs/dbus-glib-0.74
	>=dev-libs/expat-2.0.1
	${PYTHON_DEPS}"
DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )
	virtual/pkgconfig"

#DOCS=( AUTHORS NEWS README )

src_install() {
	cp -R "${S}/." "${D}/" || die "Install failed!"
}
