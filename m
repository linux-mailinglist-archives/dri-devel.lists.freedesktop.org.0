Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E65A947F3E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 12:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FF689177;
	Mon, 17 Jun 2019 10:06:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 60E3489177
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 10:06:13 +0000 (UTC)
Received: from localhost (p5486CE69.dip0.t-ipconnect.de [84.134.206.105])
 by pokefinder.org (Postfix) with ESMTPSA id 8A67A2C35BF;
 Mon, 17 Jun 2019 12:06:11 +0200 (CEST)
Date: Mon, 17 Jun 2019 12:06:11 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH v2 06/28] drivers: Add generic helper to match by of_node
Message-ID: <20190617100611.GB3502@kunai>
References: <1560534863-15115-1-git-send-email-suzuki.poulose@arm.com>
 <1560534863-15115-7-git-send-email-suzuki.poulose@arm.com>
 <20190614203144.GB7991@kunai>
 <d050ae69-52ee-b32d-2bc0-708b408f3bd4@arm.com>
MIME-Version: 1.0
In-Reply-To: <d050ae69-52ee-b32d-2bc0-708b408f3bd4@arm.com>
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
Cc: andrew@lunn.ch, thor.thayer@linux.intel.com, rafael@kernel.org,
 airlied@linux.ie, linux-fpga@vger.kernel.org, ulf.hansson@linaro.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, srinivas.kandagatla@linaro.org,
 linux-i2c@vger.kernel.org, lee.jones@linaro.org, f.fainelli@gmail.com,
 peda@axentia.se, frowand.list@gmail.com, jonathanh@nvidia.com,
 maxime.ripard@bootlin.com, jslaby@suse.com, devicetree@vger.kernel.org,
 atull@kernel.org, broonie@kernel.org, mdf@kernel.org,
 mathieu.poirier@linaro.org, gregkh@linuxfoundation.org, lgirdwood@gmail.com,
 linux-spi@vger.kernel.org, robh+dt@kernel.org, joe@perches.com,
 davem@davemloft.net, hkallweit1@gmail.com
Content-Type: multipart/mixed; boundary="===============1724808724=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1724808724==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7ZAtKRhVyVSsbBD2"
Content-Disposition: inline


--7ZAtKRhVyVSsbBD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Is it an option to 'static inline' this simple function in the header,
> > saving the EXPORT?
> >=20
>=20
> No.

OK, thanks for the explanation!


--7ZAtKRhVyVSsbBD2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0HZhMACgkQFA3kzBSg
Kbbl3A/+LFTwA3gh8PCif9bJi4Ywry/gCg7cCVuGAw1ZhH5h29SAhoONggyXvO8N
XvGR09Q0NYX1CpAogNTRqTtpOKSudrSozBdFRxKlNCuACTghf1AdboPKq+pM2Zos
+Q75BJMykwO00W+5ghmbztldccufXFjjwXzDwdBq5zNjtVf3yne4h1wWAubXItsQ
LMaf+2X6WrAPfIPVvBbtV33cG/1f8l7GemdTJj02Z+5+u1NH4L1e00WP+rxqj0Q7
nYMFIFYfjfqHBkhAltu6bx/gqqORuDfQ6DQ/vl/qyXVHY6WcYIzUde/NpnVSjAX/
e6d3JrHaEHw7qBEH+39w54dQr4fRii9mUOF9keTO7OSfQnAAva1QQyERtAhPj7EA
I2X/qEU6ncbQJK91mxlelKLbD+WuJUcqahDM0tQ07nQ2lz6zwVpBQzn3VNZiXxh1
KAJFCCaWJRGp0P1JZMwnVbmMSeFoPWJx5fXweNoQXdgz/4yy2VpTh7AdvWFCOl9+
u5N+YWIn6gygP5kUJuDevsLDTzyodTVxi3zvYaaFM+2eIF2nT8a0AI2HPzmR3G1R
xlNjF3xnwWLlW/0g11vgj9PPAnKgNazMZflNXIbPSRZjHZzh6+C/GYnxlDXf5N3V
tFjRbBS861rgNrq+zJv9HqLqlF7opQ3x7jAh8LwHdpF/Z95yDW0=
=hDM+
-----END PGP SIGNATURE-----

--7ZAtKRhVyVSsbBD2--

--===============1724808724==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1724808724==--
