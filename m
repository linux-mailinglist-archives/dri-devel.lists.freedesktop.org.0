Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8B5324B90
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 08:53:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129BD6EC5B;
	Thu, 25 Feb 2021 07:53:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1296EC5A;
 Thu, 25 Feb 2021 07:53:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F411AADE5;
 Thu, 25 Feb 2021 07:53:42 +0000 (UTC)
Subject: Re: [PULL] drm-misc-fixes
To: Dave Airlie <airlied@gmail.com>
References: <YDYqJhsuNDKvD3V/@linux-uq9g>
 <CAPM=9tzu+Sa+1w4LCwdV0wsRCvqPnXSdrCxi-dTMxn+hN_Kz2A@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <9592f25d-b7fa-5b84-eccf-01af1019ef06@suse.de>
Date: Thu, 25 Feb 2021 08:53:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAPM=9tzu+Sa+1w4LCwdV0wsRCvqPnXSdrCxi-dTMxn+hN_Kz2A@mail.gmail.com>
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
Cc: "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============2135717460=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2135717460==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="DMZdv4ptfVr1o70LrZ5Vt91Au9Cg8a72y"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DMZdv4ptfVr1o70LrZ5Vt91Au9Cg8a72y
Content-Type: multipart/mixed; boundary="xki79IW9FNO2NRlXE77Pn1XBBLDGIVhOk";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>
Cc: "DRM maintainer tools announcements, discussion, and development"
 <dim-tools@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>
Message-ID: <9592f25d-b7fa-5b84-eccf-01af1019ef06@suse.de>
Subject: Re: [PULL] drm-misc-fixes
References: <YDYqJhsuNDKvD3V/@linux-uq9g>
 <CAPM=9tzu+Sa+1w4LCwdV0wsRCvqPnXSdrCxi-dTMxn+hN_Kz2A@mail.gmail.com>
In-Reply-To: <CAPM=9tzu+Sa+1w4LCwdV0wsRCvqPnXSdrCxi-dTMxn+hN_Kz2A@mail.gmail.com>

--xki79IW9FNO2NRlXE77Pn1XBBLDGIVhOk
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 25.02.21 um 02:55 schrieb Dave Airlie:
> On Wed, 24 Feb 2021 at 20:27, Thomas Zimmermann <tzimmermann@suse.de> w=
rote:
>>
>> Hi Dave and Daniel,
>>
>> here's this week's PR for drm-misc-fixes. One of the patches is a memo=
ry
>> leak; the rest is for hardware issues.
>>
>=20
> This is based on 5.11 and I'm not currently in the market for a
> backmege now before rc1 so can you just top this up next week?

I can, but I think Maxime will take over after -rc1.

Best regards
Thomas

>=20
> Though maybe the ttm fix should be fast tracked, will contemplate it.
>=20
> Dave.
>=20
>> Best regards
>> Thomas
>>
>> drm-misc-fixes-2021-02-24:
>>   * drm/panel: kd35t133: Work with non-continuous DSI clock
>>   * drm/rockchip: Require YTR modifier for AFBC
>>   * drm/ttm: Fix a memory leak in error handling
>> The following changes since commit f40ddce88593482919761f74910f42f4b84=
c004b:
>>
>>    Linux 5.11 (2021-02-14 14:32:24 -0800)
>>
>> are available in the Git repository at:
>>
>>    git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021=
-02-24
>>
>> for you to fetch changes up to 54dab3a718f7094532daf7d25cd14121a0e00e3=
4:
>>
>>    drm/panel: kd35t133: allow using non-continuous dsi clock (2021-02-=
23 22:44:58 +0100)
>>
>> ----------------------------------------------------------------
>>   * drm/panel: kd35t133: Work with non-continuous DSI clock
>>   * drm/rockchip: Require YTR modifier for AFBC
>>   * drm/ttm: Fix a memory leak in error handling
>>
>> ----------------------------------------------------------------
>> Alyssa Rosenzweig (1):
>>        drm/rockchip: Require the YTR modifier for AFBC
>>
>> Heiko Stuebner (1):
>>        drm/panel: kd35t133: allow using non-continuous dsi clock
>>
>> xinhui pan (1):
>>        drm/ttm: Fix a memory leak
>>
>>   drivers/gpu/drm/panel/panel-elida-kd35t133.c |  3 ++-
>>   drivers/gpu/drm/rockchip/rockchip_drm_vop.h  | 11 +++++++++++
>>   drivers/gpu/drm/ttm/ttm_bo.c                 |  9 ++++++---
>>   3 files changed, 19 insertions(+), 4 deletions(-)
>>
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
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


--xki79IW9FNO2NRlXE77Pn1XBBLDGIVhOk--

--DMZdv4ptfVr1o70LrZ5Vt91Au9Cg8a72y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmA3V4YFAwAAAAAACgkQlh/E3EQov+Ai
Vw/9HLgFfONLhJKv4ntetjdMDEeXOhTr6eyd57U4okq1jXTEnTz7nU2cvBP66TdKwX9H5LRDvCgz
zsYirmA7FFox14wbJ+sb2ltWfw3GLD/kdSIv/TT44mIM/u90oNJHQPrqX3ZQdcR0AFb+PL1Ox6Bt
IG9sm2Btu2XGeyAyvGlSWitIL/Jno6tV4Sf5h1TcuY7KHLPJUF5UJs7q4ClByTOkfm9AaWKvTyTC
UKaVRn7TXCYHIZSiTgvJyzlKROEXHABhGOcmjsSbV/u2OSjcO950coLVo88WwmbsSwUfSHW5NBnF
4k7M2iNWKJTGgszoni3gjUFfPVQsqUwLl8wnc+wE8/L6BNNdDuCiNHHZVs350UVeYRXVEFKwgSej
Q4IYgcMFhbbKamJuj2QEGE7O9iVc15nCLbIp66zPn/STdioofJXitQF4NUMoq/DNGG2ACix82YrI
6puAXBiEcCGcmrWwHaNz0grikLAaU936wahHg8ETwTFslF6VPW8KoS/ikYf2XqENv/WFdf/vSU8z
UqaD8RkKFG8EC4whUPz8oCavqGS+0Gsx5Z5bFyJ6124ZesvP5OhdnPywjOGnU+siInMrpHWjcT6x
nVF61jx6yBpH7E3/uFTYayBR8jU0UkpfEeHtu4WhdpCkKVTioyz6QebpdxCLXF0mrO9wYGmNUJVZ
bIY=
=Ayd/
-----END PGP SIGNATURE-----

--DMZdv4ptfVr1o70LrZ5Vt91Au9Cg8a72y--

--===============2135717460==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2135717460==--
