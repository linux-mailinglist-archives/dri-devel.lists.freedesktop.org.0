Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F371330A339
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 09:23:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 131B36E1BC;
	Mon,  1 Feb 2021 08:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DAB16E1BC
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 08:23:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2E01AACB7;
 Mon,  1 Feb 2021 08:23:18 +0000 (UTC)
Subject: Re: [PATCH 1/5] drm/gma500: Remove Medfield support
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
References: <20210129095604.32423-1-tzimmermann@suse.de>
 <20210129095604.32423-2-tzimmermann@suse.de>
 <CAMeQTsYb5wF4Ev_XniX-72eWw5pjbmEy_dPJB_oKc0V59Lk+Fw@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <542864ec-aae6-9382-337a-c8631d88d016@suse.de>
Date: Mon, 1 Feb 2021 09:23:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAMeQTsYb5wF4Ev_XniX-72eWw5pjbmEy_dPJB_oKc0V59Lk+Fw@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0964365445=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0964365445==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="jeqYrrbBZfqlKUKn2U39yqe07dF7jEaep"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jeqYrrbBZfqlKUKn2U39yqe07dF7jEaep
Content-Type: multipart/mixed; boundary="xlJsimpUSCkUwQM2rY0rctWtLMZgPPJPM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <542864ec-aae6-9382-337a-c8631d88d016@suse.de>
Subject: Re: [PATCH 1/5] drm/gma500: Remove Medfield support
References: <20210129095604.32423-1-tzimmermann@suse.de>
 <20210129095604.32423-2-tzimmermann@suse.de>
 <CAMeQTsYb5wF4Ev_XniX-72eWw5pjbmEy_dPJB_oKc0V59Lk+Fw@mail.gmail.com>
In-Reply-To: <CAMeQTsYb5wF4Ev_XniX-72eWw5pjbmEy_dPJB_oKc0V59Lk+Fw@mail.gmail.com>

--xlJsimpUSCkUwQM2rY0rctWtLMZgPPJPM
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Patrik

Am 29.01.21 um 15:25 schrieb Patrik Jakobsson:
> On Fri, Jan 29, 2021 at 10:56 AM Thomas Zimmermann <tzimmermann@suse.de=
> wrote:
>>
>> Medfield is an outdated mobile platform with apparently no users left.=

>> Remove it from gma500.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> Great, finally we get rid of that DSI code :)
>=20
> Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

I'm not sure about the meaning of the S-o-b tag here. Can I count this=20
as an A-b?

Best regards
Thomas

>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--xlJsimpUSCkUwQM2rY0rctWtLMZgPPJPM--

--jeqYrrbBZfqlKUKn2U39yqe07dF7jEaep
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAXunUFAwAAAAAACgkQlh/E3EQov+Ap
Vg/+J6yhT0BFtlCmLn9P0ca/ob6OtiDrX4Gr2/Z1cwd6Y8stHzQR1MfVaMV06eAXs5lE0Gh3TAUC
M5gv6BhY1SMpXw5iH66emUWpfLXOJGCKrYgDE8bChS1jld2rkQh23ywJsvFZjEuore8vFI7OZ3vX
MIQXlCDn28rminP4lWjcqFp7RoUnjyFXh2LIioOg79uN6aGh4HExQ3EG7XMIfMupJ+zFO+QdzXTR
b1lFiHSR9WaIfWAjHmRn1imkEGp5tmyzPxEdiNxKQyg5eAQ3PzvXvTadB7cL412kXMzXsHpiLmqi
f01YXB7Gqi4q9eH0Uh+PQXjhK07PV1FI3Vyv/m23fcC1rZhB6c7gPDL5UnGq2ZriSGSazdS6tbKV
b9ZFqIvVLZs51NFySmE2gPEOcS1ZWFpsc4YoZVokHi0UdnWC9FjPy95tVEn6oCy1ie0VsdMCJLq9
c1mC6PksVLTpnkT4P8BtGbeFnTl+Dt0PG9v9Q9kXp0NtlEr8ZwuqQ793B5ez3JVUufgSPoznX2HM
jt8nApH2gD4kpiy8HEwSTr/7saEKlGChLbqjPMomJ0/A9iN2X2vkV3jCeagsLQrZZIxZHOAwdHAj
l1MN/eZyegmNnlkHE+pwohmy9Dz40L1N7ByB3bpLOw1xwnwfpyQ50FHdJ5W1nlgcFc5RJxTI5WyB
sKo=
=Hunq
-----END PGP SIGNATURE-----

--jeqYrrbBZfqlKUKn2U39yqe07dF7jEaep--

--===============0964365445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0964365445==--
