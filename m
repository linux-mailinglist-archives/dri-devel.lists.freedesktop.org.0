Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC14A2E07F1
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 10:22:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA0E6E83B;
	Tue, 22 Dec 2020 09:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C48589A72
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 12:19:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 979DFAC63;
 Mon, 21 Dec 2020 12:18:59 +0000 (UTC)
Message-ID: <dd1c7526e6c7eb4ad509ac629f233a387eb9b340.camel@suse.de>
Subject: Re: [PATCH 8/8] ARM: dts: bcm2711: Use compatible string for
 BCM2711 DSI1
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Eric Anholt <eric@anholt.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Daniel Vetter <daniel.vetter@intel.com>, David
 Airlie <airlied@linux.ie>
Date: Mon, 21 Dec 2020 13:18:57 +0100
In-Reply-To: <20201203132543.861591-9-maxime@cerno.tech>
References: <20201203132543.861591-1-maxime@cerno.tech>
 <20201203132543.861591-9-maxime@cerno.tech>
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 22 Dec 2020 09:21:47 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: multipart/mixed; boundary="===============1786761060=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1786761060==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-bsPMcCg3EY6k3Lejq6Ht"


--=-bsPMcCg3EY6k3Lejq6Ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-12-03 at 14:25 +0100, Maxime Ripard wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>=20
> Updates the compatible string for DSI1 on BCM2711 to
> differentiate it from BCM2835.
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Applied for-next,

Thanks!


--=-bsPMcCg3EY6k3Lejq6Ht
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl/gkrEACgkQlfZmHno8
x/4gnAf+J3Qk7G+WkKIn52+n93DBe2By+mkG//+MK3Cr51qstrmEy78IYDHWQG2K
WiG3i2G/RF5LA7kgS+s47mH0EfIU9nelsl4Xp4O3rLYm8B43Q0bJKX5UZA8KDG5S
RQPcghpvEU687Ao2a9eiost1a+Q5drghKQgZaL/TPTmdXJW2JX6pY0eYL5cXO02Y
GwuyvD3KtGPly/oiH82qzu+AD3YPXam1nmWNnsNWiWNvoEcSeY6dWHAq3AXskYJN
ePCHkMZE205NKNQWAeZe0Hv5E23QBs4jsFhfrou5qRuaTaAedD9TEsb4wxDsX6QX
ndM4hff34fTLfASumzCvjERPwxFX4Q==
=bzwo
-----END PGP SIGNATURE-----

--=-bsPMcCg3EY6k3Lejq6Ht--


--===============1786761060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1786761060==--

