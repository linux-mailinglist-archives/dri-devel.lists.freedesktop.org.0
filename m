Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B53ADAA8E1
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 18:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB19E89ED6;
	Thu,  5 Sep 2019 16:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id CDC2A89DC9
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 16:24:42 +0000 (UTC)
Received: from localhost (p54B335F6.dip0.t-ipconnect.de [84.179.53.246])
 by pokefinder.org (Postfix) with ESMTPSA id 835902C00C0;
 Thu,  5 Sep 2019 18:24:40 +0200 (CEST)
Date: Thu, 5 Sep 2019 18:24:40 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [BACKPORT 4.14.y 00/18] Backport candidate from TI 4.14 product
 kernel
Message-ID: <20190905162440.GB3695@kunai>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
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
Cc: linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org, linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0334348546=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0334348546==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mojUlQ0s9EVzWg2t"
Content-Disposition: inline


--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 05, 2019 at 10:17:41AM -0600, Mathieu Poirier wrote:
> These patches are backport candidates picked out of TI's 4.14.y tree [1],
> with most of them already found in the 4.19.y stable tree.

Could you please update your scripting that only the cover-letter and
I2C related patches will be sent to the I2C mailing list?


--mojUlQ0s9EVzWg2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1xNscACgkQFA3kzBSg
KbbSXA//Qr7qcTKeYW+0LEBOI7jVtHAd2WvUvM5Dd4cDxWi9xFJLp3mq9RHpUp2n
C+TcMxlcW7slL8ffeERAPOV3hF+IOWkWiMg+9VUHgK2MvWf+fd3wcmBC/8Cn4DQ3
B8582lHxQQcVy6jYAvgxkojUFDRrVNS0nSb0Vfb8am062q1DIkiilFqdNPNFoGWy
UMV6JnawALcKyWVHftb8p66KvJ0SRMNdm36It3CDQhr4ZBRnuLkZD5HN0QKljKYp
0iFy2yoJnsnTZKmtuEetjVNM01avU8wE0CY9gUb3Oi0xQUfPkqOgQ3WtmeolsOLQ
PriFq6j8Xt4knqOjVhkyPFpfm1uedxeqNF8uUtRL+r0Fm7ytDTwsGashc7so4D0O
s1oOEKDeYT6EOVBVC/4oxYJmIeRk6PX8qeyt6+7dz4MEkfrR+yWr10zOFr7wX6Bh
xmDd5nGeWLVCUnRWaXmph+QTjUlmsP/bKDuTtpkVSuM5X5y62NYpZ7WqsQV2Hob9
NsYPtS4xag5ak71KlvQRVpqaK8Lzgna0qHrXrk9gynDOYpoN+bUsBf+JNfRCKCOa
RO1DDv2S35m+mFLoS5Ddxo/j2urW36sfuLuUmdGcR3oxovCNcgUyG+CRIDJTwnFn
HVVbHqEnxF7f+gw6CiKqAdhye4IWXYWxYbK4hKWi540R8iLVI6g=
=3bwX
-----END PGP SIGNATURE-----

--mojUlQ0s9EVzWg2t--

--===============0334348546==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0334348546==--
