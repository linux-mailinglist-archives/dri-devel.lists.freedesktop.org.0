Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B32305551
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 09:13:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC8C6E55E;
	Wed, 27 Jan 2021 08:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 493296E55E;
 Wed, 27 Jan 2021 08:13:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D15E2B928;
 Wed, 27 Jan 2021 08:13:09 +0000 (UTC)
Subject: Re: [PULL] drm-misc-fixes
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <YBEco1Vxeny8U/ca@linux-uq9g>
Message-ID: <0ba98a80-ec44-222c-1474-54f2688ca8eb@suse.de>
Date: Wed, 27 Jan 2021 09:13:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YBEco1Vxeny8U/ca@linux-uq9g>
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
Cc: Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: multipart/mixed; boundary="===============1859489175=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1859489175==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tiBa6YdDPLplnm2VD29WSHV3E1My87bAS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tiBa6YdDPLplnm2VD29WSHV3E1My87bAS
Content-Type: multipart/mixed; boundary="YbQt9yZ84ps5lqA60pE6r0AWohSMM5K5i";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Message-ID: <0ba98a80-ec44-222c-1474-54f2688ca8eb@suse.de>
Subject: Re: [PULL] drm-misc-fixes
References: <YBEco1Vxeny8U/ca@linux-uq9g>
In-Reply-To: <YBEco1Vxeny8U/ca@linux-uq9g>

--YbQt9yZ84ps5lqA60pE6r0AWohSMM5K5i
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 27.01.21 um 08:56 schrieb Thomas Zimmermann:
> Hi Dave and Daniel,
>=20
> here are the 2 fixes from this week's drm-misc-next.

drm-misc-fixes

Grr! I had this typo last week already.

>=20
> Best regards
> Thomas
>=20
> drm-misc-fixes-2021-01-27:
>=20
>   * drm/vc4: Fix LBM size calculation; Fix high resolutions for hvs5
> The following changes since commit a37eef63bc9e16e06361b539e528058146af=
80ab:
>=20
>    drm/syncobj: Fix use-after-free (2021-01-20 10:28:39 +0100)
>=20
> are available in the Git repository at:
>=20
>    git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-=
01-27
>=20
> for you to fetch changes up to f6b57101a6b31277a4bde1d8028c46e898bd2ff2=
:
>=20
>    drm/vc4: Correct POS1_SCL for hvs5 (2021-01-25 11:53:44 +0100)
>=20
> ----------------------------------------------------------------
> Short summary of fixes pull (less than what git shortlog provides):
>=20
>   * drm/vc4: Fix LBM size calculation; Fix high resolutions for hvs5
>=20
> ----------------------------------------------------------------
> Dom Cobley (2):
>        drm/vc4: Correct lbm size and calculation
>        drm/vc4: Correct POS1_SCL for hvs5
>=20
>   drivers/gpu/drm/vc4/vc4_hvs.c   |  8 ++++----
>   drivers/gpu/drm/vc4/vc4_plane.c | 11 ++++++++---
>   2 files changed, 12 insertions(+), 7 deletions(-)
>=20
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--YbQt9yZ84ps5lqA60pE6r0AWohSMM5K5i--

--tiBa6YdDPLplnm2VD29WSHV3E1My87bAS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmARIJQFAwAAAAAACgkQlh/E3EQov+A2
qxAAtR5qii0/w0xyFdEgYhpVxNaylnvy5Qwbj376gm5qi+VFVglce3rEYwzW66MVWRdYTLiGj/0l
JWuBLc/C+o0RfySPJI9vXC05DW3iGzLtL5xGgoXrp7n/1blyzTQrOuxT8HGPGYb8bATxYWALrFjz
bLFkD0B+DP5pGm89ldNHGiIx/aoO9ppTZS79mZirruMiTHQzuXniiiWSaFNYtVFwfQDtGdPCtUb7
byEmzVZS8RH01h34ABAlr3xWGXybEafDc9wAUKzuX67v7SGFjuet2saC88SE9/daXLWUQ6j/9VIX
Sa1ewhurW4WYP2mu4SBvtj1uvU563BncI+PU7vgo3/b2Q3Xa6a8PFbCaHzMnLuG1XbpLZsTpzmyT
BPmXoUtyRt9M6Vnq1raM++z+9wgNLfZlpW+K8ihao4GlT0uO+kyJfDPdy465Xr8xZReNLiwcfTj/
chSLQ36yOwoW9GwIfEVhKBJYvSAVUg9oBo68BhG6yj+03g4LiR7/C110VMhQTPxRqpcggRrYfj5E
0aeHOjf9q6oF8ZQCQpt7TdxM+OcR63gYK8ty7ObYv5v0tfigyZdz9TRnR4nEcXcn4WxhYfAwlH9S
SigSCcxOi2m1SCzNRkiXsWUCZgjOXLC6tm0tECU5i9gJyScTLqqkB5koKm0UxWGs/ZDqhyp/sC60
KQc=
=BQ/x
-----END PGP SIGNATURE-----

--tiBa6YdDPLplnm2VD29WSHV3E1My87bAS--

--===============1859489175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1859489175==--
