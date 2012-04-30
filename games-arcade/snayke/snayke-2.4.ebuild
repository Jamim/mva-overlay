# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from mva overlay $

EAPI="3"
# we've waiting for porting games.eclass to EAPI4

inherit eutils games

MY_P="beta1"
# Upstream change strange version numeration: 2.4 = beta1, 2.5 (future release) = beta2...

DESCRIPTION="A nice 2D Snake game (like on Tetris)"
HOMEPAGE="http://snayke.net/ https://love2d.org/forums/viewtopic.php?f=5&t=2841"
SRC_URI="http://snayke.net/downloads/snayke_${MY_P}.love -> ${P}.zip"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT=""

DEPEND=">=games-engines/love-0.8.0"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
	insinto "/usr/share/games/love/${P}"
	doins -r .
	games_make_wrapper snayke "love /usr/share/games/love/${P}"
}
