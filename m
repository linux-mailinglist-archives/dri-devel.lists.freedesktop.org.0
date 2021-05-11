Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A9937A83D
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 15:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A7E6EA37;
	Tue, 11 May 2021 13:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB70C6EA37
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 13:55:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3EEF4ADD7;
 Tue, 11 May 2021 13:55:33 +0000 (UTC)
Subject: Re: [PATCH 0/2] drm/qxl: two one-liner fixes.
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20210511104522.2694803-1-kraxel@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <fa358f43-d431-959d-177f-c2666a1b0feb@suse.de>
Date: Tue, 11 May 2021 15:55:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210511104522.2694803-1-kraxel@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="UP2YVNCWoGFhiFFoFGO7BtGtCjpJmtNMA"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UP2YVNCWoGFhiFFoFGO7BtGtCjpJmtNMA
Content-Type: multipart/mixed; boundary="NOrPDDssAHqN8DLO3MI9d9yYHZ5Fcurjt";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Message-ID: <fa358f43-d431-959d-177f-c2666a1b0feb@suse.de>
Subject: Re: [PATCH 0/2] drm/qxl: two one-liner fixes.
References: <20210511104522.2694803-1-kraxel@redhat.com>
In-Reply-To: <20210511104522.2694803-1-kraxel@redhat.com>

--NOrPDDssAHqN8DLO3MI9d9yYHZ5Fcurjt
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 11.05.21 um 12:45 schrieb Gerd Hoffmann:
>=20
>=20
> Gerd Hoffmann (2):
>    drm/qxl: drop redundant code
>    drm/qxl: balance dumb_shadow_bo pin
>=20
>   drivers/gpu/drm/qxl/qxl_display.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>=20

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--NOrPDDssAHqN8DLO3MI9d9yYHZ5Fcurjt--

--UP2YVNCWoGFhiFFoFGO7BtGtCjpJmtNMA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCajNQFAwAAAAAACgkQlh/E3EQov+Ds
JRAAuA2HoRzgQzMbj4t2u/RM8b/F2g6XyhFBi2ha0Vs06oIV+hFX/eVQne8kk4J9lKHx8F4T9/I8
IQzWadAPM+9epQJpQOnE/D867KXg3Py0NDzvHrGhVvyeJR2K5uCo2dQnDYHxv+Y2hRppeU6WV3QG
cvhzr5XEss+ZcTEBoFxNB5ASpSqnazOMdzSyzoZ/UTStHOU44LbiObPFz38H7pjsjF3kDLwfX2+8
+PF7omjzsBgcAXIVWdU4j36p65i1i3eyjpZVD2YSfg5BicYDFLbizgW1AxYJBsHDi6rX6d2zrKFv
8SVRpGVtsfF6NI6io7mgyn7D4cT9S+ZM0/5nOdMMk0fPhnqWaXkF/rV6oQAqqvX8me5Cnit6yE3K
APj9ZAvl0jjxdhvStCLjoIX3Bt+UhKRRiYj1/7hr2EykWFGiBR1ZwdZOOllzws+snP19uJzEx6nY
GD/iyHogBQSWqLgj6Eubq3JJND/VHPF+XSvsHTnfrgCE7DZpcM3OtsLW0cuuDFsEPxc5oaGvxBx3
8IZ7WNMl1R8a4buIFd/VeOwQvse4PrK0aj6pVS/WGEGz/8Hg/J859favyiGWYaqF5juMKu2a1hxn
nxRrMF0GOAmmes40au1BZ7DAUGkRmeoBKTIekaypw5aAeMhD1cN9Q2yg+VinYJQjSzByTs+4n+uw
pCo=
=q1/H
-----END PGP SIGNATURE-----

--UP2YVNCWoGFhiFFoFGO7BtGtCjpJmtNMA--
