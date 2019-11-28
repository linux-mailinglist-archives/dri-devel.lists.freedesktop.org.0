Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 014C810CCBE
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 17:24:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000856E861;
	Thu, 28 Nov 2019 16:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id EF3B16E861
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 16:24:13 +0000 (UTC)
Received: from localhost (p54B33127.dip0.t-ipconnect.de [84.179.49.39])
 by pokefinder.org (Postfix) with ESMTPSA id 73ECE2C05D3;
 Thu, 28 Nov 2019 17:19:01 +0100 (CET)
Date: Thu, 28 Nov 2019 17:19:01 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [RFC PATCH 05/12] video: fbdev: matrox: convert to
 i2c_new_scanned_device
Message-ID: <20191128161900.GF5412@kunai>
References: <20191106095033.25182-1-wsa+renesas@sang-engineering.com>
 <20191106095033.25182-6-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
In-Reply-To: <20191106095033.25182-6-wsa+renesas@sang-engineering.com>
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
Cc: linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: multipart/mixed; boundary="===============0045414949=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0045414949==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OzxllxdKGCiKxUZM"
Content-Disposition: inline


--OzxllxdKGCiKxUZM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2019 at 10:50:23AM +0100, Wolfram Sang wrote:
> Move from the deprecated i2c_new_probed_device() to the new
> i2c_new_scanned_device(). Make use of the new ERRPTR if suitable.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--OzxllxdKGCiKxUZM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3f83QACgkQFA3kzBSg
KbbnmxAApek9VsHqO33UsJ6YYN/EWaMYzjYyzXvkR1U5F4veEDwg321WyrfhLzOm
5eV4bXBhoXIl4sFKk3OUSLDqhGVV56BCa0bGnfjf7gc97hsgNkUX7u9t4N4AEp4h
0BhEAurF7qBl8E3gxh1cFc8Zm0rxfls1GeBDx8OTRNv787/AcbJxrmXIkgBFtKvw
BU2fmHwvyRU12p7xmT2cfHZt3iyJsBEZGfKsjF951qQeJF/1em5rh63X4e1oqWYD
fp40g2HIgZz8SX6HO4GeAf+buu4ZeG4sul6dpRav3ycqMD0WGvK9loTJ+Vfy5pFH
iBxd9pPzGa66a2Qlxytb2qj5GSh1n9QJQ5BHZUar5lj21NWm77RQdPInKYswVXox
/JU7/YtJ7w+bfiJsegSxManyYh3n3VBjH9n1mt9ppuS2d4JVmE3/H/4F1/xdxheL
ym3nY2lBlLRt+M+Y4DMix0+iGwcxqrO6eruUIxXaStgj3/ap5KfSOvMu+FU+bC0g
Y0SaNaoVcFk1cmEnrYi/eW6akP7eYFfDo+t2lgq1c/uv3AhoNJ9vJFAikoHcgePa
T6y/DpDTAaQyi/JwiBl8vOkk10L7qgwGHh1x8EghRVr52hQmC5bK6wbOSCR4M0sR
vW8Oeog6NvyshLgWI5NHU7h+qD7W2aTRYw57Nk/GU6PbsxgD61c=
=MmdU
-----END PGP SIGNATURE-----

--OzxllxdKGCiKxUZM--

--===============0045414949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0045414949==--
