Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 537C3319A23
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 08:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA0E6E525;
	Fri, 12 Feb 2021 07:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416B86E525
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 07:16:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BF4D5AE3F;
 Fri, 12 Feb 2021 07:16:14 +0000 (UTC)
Subject: Re: Proposed Changes to Elida-KD35T133 Panel Driver
To: Christopher Morgan <macromorgan@hotmail.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>, "airlied@linux.ie"
 <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
References: <SN6PR06MB53426C7236890DEEDE4EE632A58C9@SN6PR06MB5342.namprd06.prod.outlook.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <484adfab-24b6-f141-fde1-d7acc184a8d1@suse.de>
Date: Fri, 12 Feb 2021 08:16:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <SN6PR06MB53426C7236890DEEDE4EE632A58C9@SN6PR06MB5342.namprd06.prod.outlook.com>
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
Content-Type: multipart/mixed; boundary="===============1869340916=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1869340916==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="C5sBPhOJDE5CAnbE04LPjuTlZu0G81r9X"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--C5sBPhOJDE5CAnbE04LPjuTlZu0G81r9X
Content-Type: multipart/mixed; boundary="w3ayU7eaDzhuWhEw8pNjRVHc7ghI29Tmm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Christopher Morgan <macromorgan@hotmail.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>, "airlied@linux.ie"
 <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
Message-ID: <484adfab-24b6-f141-fde1-d7acc184a8d1@suse.de>
Subject: Re: Proposed Changes to Elida-KD35T133 Panel Driver
References: <SN6PR06MB53426C7236890DEEDE4EE632A58C9@SN6PR06MB5342.namprd06.prod.outlook.com>
In-Reply-To: <SN6PR06MB53426C7236890DEEDE4EE632A58C9@SN6PR06MB5342.namprd06.prod.outlook.com>

--w3ayU7eaDzhuWhEw8pNjRVHc7ghI29Tmm
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 11.02.21 um 18:51 schrieb Christopher Morgan:
> I'd like to make the following changes to this panel driver.  The first=
 patch is to add rotation support (rotates only the DRM connector at this=
 time).  The panel is currently rotated 270 degrees in the Odroid Go Adva=
nce, and this change allows us to describe that hardware better.
>=20
> The second patch just fixes a typo.  The panel in question is 3.5 inche=
s in size not 5.5 inches.

The patches are attached as files. Could you re-send them as inline=20
attachments?

Best regards
Thomas

>=20
> Thank you.
>=20
>=20
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer


--w3ayU7eaDzhuWhEw8pNjRVHc7ghI29Tmm--

--C5sBPhOJDE5CAnbE04LPjuTlZu0G81r9X
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAmKz0FAwAAAAAACgkQlh/E3EQov+AF
BxAAqmrx881dU/1KFZM2vUiaAdw3dnGPXeGm2d8TTfX67zrKVfX7Z9j4V/f8GNVsent9NAR2eJcB
lbiHmCR2uSHSB3/PX5rh5Nk29QqW/FjswOBKxdiV1ctClTwrcCtihT+lLbMiV1OA/fszVy9COtU9
I5zVmnKo6EjBUNKX9p4+t6rjvnzoLWsvNfGb5V8IZAGRcR2+cluZmALki/LfIIKHslHboXN6yEI7
+vQ8Q7IwSbzbLJW//x4/MjzPhHFfMI/FaU2OnKgs5EW4Th1oB3g78V1Xey11VL+gmresgHOwyznJ
SaQdfBu4DBO4hDjwkTsXIEgxL2JyV92fNyWtgpn9PxfLkvdXNrKIyIg1Zy8I1hgQTN2tHYW9gDYs
7dkZZgM3PyzPfHYMaRjD0/MvJA/QumlWDImDKGgTLPwBdAGuaqUVJ5unl0k7KLqAL1CLxZ6Ryh3G
/pk18vzI/yELmFb1rbtz86J9B/CY0bPYnzjIRZ1piXmbBmq5VKW4Yd1ChZa0wyRoOT2DreUw1Txf
Qf2qpVaZADsUQ0zB0nXAttB8UP8+58sCqD/EyuYnsH2kZvs2DVp7DRkZ+SCpPzHd6U3RZHTPX9mE
x3H9xQVw0Oqiy18kF8ESM/d47TeJ878x5ctpdpqQPcoTOZYD3DZ1fQNXvO9/EzIhRvdk0UAWIuVD
p5Q=
=qMf+
-----END PGP SIGNATURE-----

--C5sBPhOJDE5CAnbE04LPjuTlZu0G81r9X--

--===============1869340916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1869340916==--
