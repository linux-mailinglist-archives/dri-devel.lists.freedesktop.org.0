Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB104A28A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 15:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB12E6E138;
	Tue, 18 Jun 2019 13:41:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 15BAE6E138
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 13:41:32 +0000 (UTC)
Received: from localhost (p5486CE06.dip0.t-ipconnect.de [84.134.206.6])
 by pokefinder.org (Postfix) with ESMTPSA id 95E122C047A;
 Tue, 18 Jun 2019 15:41:30 +0200 (CEST)
Date: Tue, 18 Jun 2019 15:41:30 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH] docs: fix some broken references due to txt->rst renames
Message-ID: <20190618134130.GA4516@kunai>
References: <6f09587b7678f2fb378d736f45a02ffa9412cc99.1560864716.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
In-Reply-To: <6f09587b7678f2fb378d736f45a02ffa9412cc99.1560864716.git.mchehab+samsung@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ajay Gupta <ajayg@nvidia.com>,
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@infradead.org>, linux-i2c@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Li Yang <leoyang.li@nxp.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Otto Sabart <ottosabart@seberm.com>
Content-Type: multipart/mixed; boundary="===============0758588320=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0758588320==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 10:33:58AM -0300, Mauro Carvalho Chehab wrote:
> There are three left-overs from the recent file renames,
> probably due to some other conflicting patch.
>=20
> Fix them.
>=20
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Thanks!

Acked-by: Wolfram Sang <wsa@the-dreams.de>


--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0I6gIACgkQFA3kzBSg
KbYPmw//S9ererLqN6V1mN1Ixbn0CfKZGd1MAB4a/0PZiXPpCngdRfAog04KBXjI
xYSX76wEzxv0+SiwU8kElhD15w/9Vjm9vZ8SCYRv2xBSE7W3xd+fv2gDAQf+pb2p
bHJ5pTs8PRCqJcVLmZirsJ2vvOA1C6NYmb9Sjb4hH4u4+i9fqc0RKjOrO2OZCHx2
3T6xcu0INuJm1RNX0gHHk06mGjfMUm6unYYHJkOMeup4HTUqDmYvX4U1g/3sIAIy
kOPwW1ggkEJDebdxyc1uNft0yZKznjx7iOkP/p6wacCUI56jmCMniAt36f76OV8L
C9Bks/dr9tp4M3z0Jbxa9oJWhc+e8KA/WNgXXnyCCDVg1idhaGgWkW59S05Spu0H
PgprhEo5QYdT1GvEO28eP+kuFKi7HN5VvOJy794jFkjOPH0A9HK/f1CXmjp9cv3V
nZhMOzohbh18AXwOG3T4eF9gL3u0WsPK2EH35oFjxH7ty6tmV5CkpVBgzWH1EBxq
K44uWCs6H6SX3e0Cq5FRgGdvjlpFwQZT4Hbf3IfmukTzurdCi9YSPI228IdLmCPa
uncvdbThBK4o/O6ndCqx04bEmPEUJdzcYuBlqi38lTonwzN4jvOyabM65Mt/HhW7
4sy6hg/cLkPuX8tBpKWJoT13jqVTjRvjnxemkSq06yAmOznSxs4=
=lZcZ
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--

--===============0758588320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0758588320==--
