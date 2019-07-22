Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B8A6FED6
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 13:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40CFD89C55;
	Mon, 22 Jul 2019 11:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0DEA089C55
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 11:38:50 +0000 (UTC)
Received: from localhost (p54B33E22.dip0.t-ipconnect.de [84.179.62.34])
 by pokefinder.org (Postfix) with ESMTPSA id 2529E2C28E9;
 Mon, 22 Jul 2019 13:38:49 +0200 (CEST)
Date: Mon, 22 Jul 2019 13:38:46 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH 03/14] docs: fix broken doc references due to renames
Message-ID: <20190722113845.GA1115@ninjato>
References: <cover.1563277838.git.mchehab+samsung@kernel.org>
 <aa415583bf6b812b0249093a601aa31412f3a1cf.1563277838.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
In-Reply-To: <aa415583bf6b812b0249093a601aa31412f3a1cf.1563277838.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Andrea Parri <andrea.parri@amarulasolutions.com>,
 Ajay Gupta <ajayg@nvidia.com>, linux-doc@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Akira Yokosawa <akiyks@gmail.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Jerry Hoemann <jerry.hoemann@hpe.com>,
 dri-devel@lists.freedesktop.org, David Howells <dhowells@redhat.com>,
 linux-i2c@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, linux-scsi@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, esc.storagedev@microsemi.com,
 Maxime Ripard <maxime.ripard@bootlin.com>, Ingo Molnar <mingo@redhat.com>,
 Alan Stern <stern@rowland.harvard.edu>, Jade Alglave <j.alglave@ucl.ac.uk>,
 Boqun Feng <boqun.feng@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
 Don Brace <don.brace@microsemi.com>, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Daniel Lustig <dlustig@nvidia.com>,
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
 rcu@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Nicholas Piggin <npiggin@gmail.com>, Luc Maranget <luc.maranget@inria.fr>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>
Content-Type: multipart/mixed; boundary="===============0742215709=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0742215709==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Content-Disposition: inline


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2019 at 09:10:42AM -0300, Mauro Carvalho Chehab wrote:
> Some files got renamed but probably due to some merge conflicts,
> a few references still point to the old locations.
>=20
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Acked-by: Wolfram Sang <wsa@the-dreams.de> # I2C part


--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl01oEEACgkQFA3kzBSg
KbYvLhAAiBCzjlLaOX8TozT9yXWwqRye46Tkkjqei2Gh2ruk6HulzAm4JLL1ghij
bD5UKIqsqMqs8SThEWtBr7lpGKPY5dTOO7Lvp3Gg6Ykw4DSJHjwRbY9Gz3eKpjm6
XCeKu+qe7IWU4PyqjfTmT2tYQBjZTg8+e5ycnPtgLxvLZGpqoOwplZvwady9klS0
6KfODAi0M8Bv05man76ECm1z4PeUjQMjuSgO4lxWDm9QPN6pL1tZ1DN4TWoQpmY8
gnS6iqRtIVwRqjxnx3BNP6q0iF0oMBIJbufn+udz5FVAvXkWtx6gaJ+HZO02CPnd
DfLhbW0h0SzzRnLA8rtuTQl/wJwHcfRtlYBNitXwbXIewlBTqlhzhvuW7JZnXJTe
QXk4bXJuRofQsmWiK/i6bP0ifWyWmH/mLQkZhXEAZXsiiSHYuLC0RGLYTk2OSbRS
d4kM+3WQfr0F8KTgmhKZv0g6yKqxziFVCBFMkKvpYqOfk3MuRf9JREpFnAmtHaox
310crjxth9IwT/SMq813fSz5+SueTeiTp7DZyOANc23QCyJTpTTnIsdpzYzna4+i
t8H5nyy2JKWKP7rvIfn2O4BKHOt14Klmbno/pUak4lxLadz7Av7mC65akEwLWSiI
0qO7h0/ZSuPlu8OPAyR3I7cvx8/RriyeQJUceA6/KjTSKtWhw/E=
=7t6S
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--

--===============0742215709==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0742215709==--
