# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from mva overlay $

EAPI="4"

inherit autotools eutils

DESCRIPTION="Allows you to easily put programs and users in a chrooted environment"
HOMEPAGE="http://olivier.sessink.nl/jailkit/"
SRC_URI="http://olivier.sessink.nl/${PN}/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

src_prepare() {
	epatch \
		"${FILESDIR}/${P}-ldflags.patch" \
		"${FILESDIR}/${P}-pyc.patch" \
		"${FILESDIR}/${P}-noshells.patch"
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	doinitd "${FILESDIR}/jailkit" ||  die "doinit install failed"
}

pkg_postinst() {
	ebegin "Updating /etc/shells"
	{ grep -v "^/usr/sbin/jk_chrootsh$" "${ROOT}"etc/shells; echo "/usr/sbin/jk_chrootsh"; } > "${T}"/shells
	mv -f "${T}"/shells "${ROOT}"etc/shells
	eend $?
}
