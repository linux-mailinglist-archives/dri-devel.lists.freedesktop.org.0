Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A752735A06D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 15:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3796EC2E;
	Fri,  9 Apr 2021 13:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC3B6EC2E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 13:57:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3E128AD2D;
 Fri,  9 Apr 2021 13:57:16 +0000 (UTC)
Subject: Re: [PATCH v4 2/6] drm/sprd: add Unisoc's drm kms master
To: Kevin Tang <kevin3.tang@gmail.com>
References: <20210222132822.7830-1-kevin3.tang@gmail.com>
 <20210222132822.7830-3-kevin3.tang@gmail.com>
 <b1c03605-1304-003c-beb2-ca096a549fb4@suse.de>
 <CAFPSGXZ2o9YRAMax3ZeiyQ5bMtqOsSODMW8V7dXHZSD3gyzbQw@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <449a323c-0bb3-a4aa-5a3f-1325fd4b802c@suse.de>
Date: Fri, 9 Apr 2021 15:57:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFPSGXZ2o9YRAMax3ZeiyQ5bMtqOsSODMW8V7dXHZSD3gyzbQw@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1443325477=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1443325477==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="S4XoDZIR9mto1SEn5emJBWKE0vfzu4oDm"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--S4XoDZIR9mto1SEn5emJBWKE0vfzu4oDm
Content-Type: multipart/mixed; boundary="NALOUUC0u41Jy3oDgBSIgoxBcf1Yo86DK";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Kevin Tang <kevin3.tang@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Orson Zhai <orsonzhai@gmail.com>, Sean Paul <sean@poorly.run>
Message-ID: <449a323c-0bb3-a4aa-5a3f-1325fd4b802c@suse.de>
Subject: Re: [PATCH v4 2/6] drm/sprd: add Unisoc's drm kms master
References: <20210222132822.7830-1-kevin3.tang@gmail.com>
 <20210222132822.7830-3-kevin3.tang@gmail.com>
 <b1c03605-1304-003c-beb2-ca096a549fb4@suse.de>
 <CAFPSGXZ2o9YRAMax3ZeiyQ5bMtqOsSODMW8V7dXHZSD3gyzbQw@mail.gmail.com>
In-Reply-To: <CAFPSGXZ2o9YRAMax3ZeiyQ5bMtqOsSODMW8V7dXHZSD3gyzbQw@mail.gmail.com>

--NALOUUC0u41Jy3oDgBSIgoxBcf1Yo86DK
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 09.04.21 um 15:50 schrieb Kevin Tang:
>      > +static int __init sprd_drm_init(void)
>      > +{
>      > +=C2=A0 =C2=A0 =C2=A0int ret;
>=20
>     I think ret should just go away.
>=20
> Like this?
> "return platform_register_drivers(sprd_drm_drivers,=20
> ARRAY_SIZE(sprd_drm_drivers));"

Sure.

Best regards
Thomas

> if so, i will fix it, thks.
>=20
>=20
>     Acked-by: Thomas Zimmermann <tzimmermann@suse.de
>     <mailto:tzimmermann@suse.de>>
>=20
>      > +
>      > +=C2=A0 =C2=A0 =C2=A0ret =3D platform_register_drivers(sprd_drm_=
drivers,
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARRA=
Y_SIZE(sprd_drm_drivers));
>      > +=C2=A0 =C2=A0 =C2=A0return ret;
>      > +}
>      > +
>      > +static void __exit sprd_drm_exit(void)
>      > +{
>      > +=C2=A0 =C2=A0 =C2=A0platform_unregister_drivers(sprd_drm_driver=
s,
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARRAY_SIZE(sprd_dr=
m_drivers));
>      > +}
>      > +
>      > +module_init(sprd_drm_init);
>      > +module_exit(sprd_drm_exit);
>      > +
>      > +MODULE_AUTHOR("Leon He <leon.he@unisoc.com
>     <mailto:leon.he@unisoc.com>>");
>      > +MODULE_AUTHOR("Kevin Tang <kevin.tang@unisoc.com
>     <mailto:kevin.tang@unisoc.com>>");
>      > +MODULE_DESCRIPTION("Unisoc DRM KMS Master Driver");
>      > +MODULE_LICENSE("GPL v2");
>      > diff --git a/drivers/gpu/drm/sprd/sprd_drm.h
>     b/drivers/gpu/drm/sprd/sprd_drm.h
>      > new file mode 100644
>      > index 000000000..9781fd591
>      > --- /dev/null
>      > +++ b/drivers/gpu/drm/sprd/sprd_drm.h
>      > @@ -0,0 +1,16 @@
>      > +/* SPDX-License-Identifier: GPL-2.0 */
>      > +/*
>      > + * Copyright (C) 2020 Unisoc Inc.
>      > + */
>      > +
>      > +#ifndef _SPRD_DRM_H_
>      > +#define _SPRD_DRM_H_
>      > +
>      > +#include <drm/drm_atomic.h>
>      > +#include <drm/drm_print.h>
>      > +
>      > +struct sprd_drm {
>      > +=C2=A0 =C2=A0 =C2=A0struct drm_device drm;
>      > +};
>      > +
>      > +#endif /* _SPRD_DRM_H_ */
>      >
>=20
>     --=20
>     Thomas Zimmermann
>     Graphics Driver Developer
>     SUSE Software Solutions Germany GmbH
>     Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>     (HRB 36809, AG N=C3=BCrnberg)
>     Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
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
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--NALOUUC0u41Jy3oDgBSIgoxBcf1Yo86DK--

--S4XoDZIR9mto1SEn5emJBWKE0vfzu4oDm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmBwXTsFAwAAAAAACgkQlh/E3EQov+D7
MA/+IAHWrnPg7/5qfYPk4UleTosgnVBGNe/Z2fqhtkh4x9NmLTswgvW0hASHzsvGVVjxJGfUOivY
2/nOETjZEQgBU9VXxVYT+bYlTzmfH5+k7L3cMex/h3XXv1dHKPh5B0aY+IjhBzRSWC1bc7ezIyK3
tTIGoKdXDMWm4JWFtwrGu1/q2jMUu36E9SNzY4Qtx7MpzaDJgjvfs51sOaTiPTcwmh8loBEInNXw
8zpzM5EVOTZaSto1vWcw2ItE7yxCC5B/H13TveYVP6Z3DzoaXXFHqAHCvDHAohZw9CdyNFdF/hUB
5/hHYEJpPEQ9cYqG4FSKDEeSQX1i/uLiWWD2FsUCqIAadJ2e8Bid/7C02oOoaJXNvwn93QnL9I3L
XzgeNafPpcHo9RJ1k12txhWLu5ptnnPuaalZzliC7eW0dQmyTDUzczOb5N4wDxa9V909Uj4D3biE
Y866PPJ8iTSoeRM2P3mPBYZ3SSjqVuFh1Oz6IIWTgsDRQtn5Hv5xgJQ+ApH3g6p9D3/W9YjZGyar
io+SXii5nWsd8V+AIuv6BEYUDihn1Eq6w/sSc7ElZlxoHMZQcHS50NTvAHIybpLt2WkIZyxtcTKQ
Ss94oiUfdV9ctDVTjNnqoAWjyXOPX9JMRqPux+hxZwqxAhbv0E4WUIvg3sE+lPuKpSrK7d/3f6VN
NaA=
=CXJ5
-----END PGP SIGNATURE-----

--S4XoDZIR9mto1SEn5emJBWKE0vfzu4oDm--

--===============1443325477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1443325477==--
