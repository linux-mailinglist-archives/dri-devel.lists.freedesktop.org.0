Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AA5318D82
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 15:37:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADEAB6E17A;
	Thu, 11 Feb 2021 14:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F4C89E41
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 14:37:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B5B54B066;
 Thu, 11 Feb 2021 14:37:20 +0000 (UTC)
Subject: Re: Not 100% sure if I correctly fixed drm-tip
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>
References: <b313d0b2-9589-8209-54a3-f44dc137164e@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <c4a2f1ec-4fe4-7966-9081-025e0740dd61@suse.de>
Date: Thu, 11 Feb 2021 15:37:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b313d0b2-9589-8209-54a3-f44dc137164e@amd.com>
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
Content-Type: multipart/mixed; boundary="===============0077648275=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0077648275==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="BfMCrFRcRdq8kCWwlwh2OMC4RtrjcktZK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BfMCrFRcRdq8kCWwlwh2OMC4RtrjcktZK
Content-Type: multipart/mixed; boundary="B9w0xNIZcD7GAOyLYlWJEwhvX6RWxrUjr";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <c4a2f1ec-4fe4-7966-9081-025e0740dd61@suse.de>
Subject: Re: Not 100% sure if I correctly fixed drm-tip
References: <b313d0b2-9589-8209-54a3-f44dc137164e@amd.com>
In-Reply-To: <b313d0b2-9589-8209-54a3-f44dc137164e@amd.com>

--B9w0xNIZcD7GAOyLYlWJEwhvX6RWxrUjr
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

(cc'ing Jani)

Am 11.02.21 um 11:01 schrieb Christian K=C3=B6nig:
> Hi guys,
>=20
> I had a conflict this morning in the ttm pool while pushing an importan=
t=20
> fix to drm-misc-fixes.
>=20
> I'm not 100% sure if I correctly fixed up drm-tip. How can this be=20
> double checked? And how can it be fixed if the merge has gone bad?
>=20
> Thanks,
> Christian.
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--B9w0xNIZcD7GAOyLYlWJEwhvX6RWxrUjr--

--BfMCrFRcRdq8kCWwlwh2OMC4RtrjcktZK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAlQR8FAwAAAAAACgkQlh/E3EQov+D6
lRAAtxPMOKon8nQ5pIfl++UjQ8K5rcI+owbZEdqGev2IHofPHdeqbEN/aDVhFUm+epJ3x/t19Qno
V4hDhquFMs912/ZUZdYedWCs5bqmNmA9LmZjZtVuKxVmBMJr915Wi2Bb5L6Jt2c8XvwuAkcguWsU
1Nd9AZ02M4JYkeqILEfGuCNwXFncbuONvCR5s1QO2laSx0VOPH3Oy+FkI82atlUpvVZMugkAHTDl
VXPK3Go1QxGkf4CS7esuL1IUvKVM2JVd1TUddwhu2WXrVCmrzeJqLTEUQgbtVzFdwLgEctqDMydZ
v2SOuQWjk1WE0LhQsQCUFky2vU96ffFrFSUSFfTYPNqO7uBW4P1QCNawlW9IUZ/5YFfep5P7V2fn
mIHNS7ZLz57m9n/iRGu1g4gh3CsN7WY/Xp14SF/hZQSpUGlwiykCDDXe4OXPe3V1UnZltljVX0ys
FPV3nDpK5NKbit2Y7A8AGBZHh6HkxPAF7V9xwpWTLb7hbZy3UdiWVo2zuZOMaaqkfcKQWAvtAMKI
GPWxHKPx/iznc7uhnVCSROvoMRnoWE62HfdYT+T/auS4nFSQqq9yAqeIGOIf4lVgZ0pIZ4heC994
ZLMxJNS9jUedJ6aqE0NNeS+LZ8ETgearF2tJj5ImkPhEAPGkV/APacVuY68q2UEfon9dcorW4aY2
fPU=
=45Sl
-----END PGP SIGNATURE-----

--BfMCrFRcRdq8kCWwlwh2OMC4RtrjcktZK--

--===============0077648275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0077648275==--
