# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

EGIT_REPO_URI="https://github.com/qxmpp-project/qxmpp"

inherit qmake-utils multilib git-2

DESCRIPTION="A cross-platform C++ XMPP client library based on the Qt framework"
HOMEPAGE="https://github.com/qxmpp-project/qxmpp/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS=""
IUSE="debug doc +speex test theora vpx qt4 qt5"
REQUIRED_USE="^^ ( qt4 qt5 )"

RDEPEND="qt4? ( dev-qt/qtcore:4 )
    qt5? ( dev-qt/qtcore:5 )
	speex? ( media-libs/speex )
	theora? ( media-libs/libtheora )
	vpx? ( media-libs/libvpx )"
DEPEND="${RDEPEND}
	test? ( dev-qt/qttest:4 )"

src_prepare(){
	if ! use doc; then
		sed -i \
			-e '/SUBDIRS/s/doc//' \
			-e '/INSTALLS/d' \
			qxmpp.pro || die "sed for removing docs failed"
	fi
	if ! use test; then
		sed -i -e '/SUBDIRS/s/tests//' \
			qxmpp.pro || die "sed for removing tests failed"
	fi
	#qt4-r2_src_prepare
}

src_configure(){
	local conf_speex
	local conf_theora
	local conf_vpx

	use speex && conf_speex="QXMPP_USE_SPEEX=1"
	use theora && conf_theora="QXMPP_USE_THEORA=1"
	use vpx && conf_vpx="QXMPP_USE_VPX=1"

	if use qt4; then
	    eqmake4 "${S}"/qxmpp.pro "PREFIX=/usr" "LIBDIR=$(get_libdir)" "${conf_speex}" "${conf_theora}" "${conf_vpx}"
	fi
	if use qt5; then
		eqmake5 "${S}"/qxmpp.pro "PREFIX=/usr" "LIBDIR=$(get_libdir)" "${conf_speex}" "${conf_theora}" "${conf_vpx}"
	fi
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}

#src_install() {
#	#qt4-r2_src_install
#	if use doc; then
#		# Use proper path for documentation
#		mv "${ED}"/usr/share/doc/${PN} "${ED}"/usr/share/doc/${PF} || die "doc mv failed"
#	fi
#}
