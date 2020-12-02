Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6202CB60F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:01:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F076EA01;
	Wed,  2 Dec 2020 08:01:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416656E9A6;
 Wed,  2 Dec 2020 08:01:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D2E5AABD2;
 Wed,  2 Dec 2020 08:01:10 +0000 (UTC)
Subject: Re: [PATCH 14/15] drm/vmwgfx: Remove references to struct
 drm_device.pdev
To: Zack Rusin <zackr@vmware.com>
References: <20201124113824.19994-1-tzimmermann@suse.de>
 <20201124113824.19994-15-tzimmermann@suse.de>
 <31E75B1A-AAC0-49E3-985E-2DF5B59CD883@vmware.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <e8102216-edd0-bec3-79af-3925e9668e95@suse.de>
Date: Wed, 2 Dec 2020 09:01:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <31E75B1A-AAC0-49E3-985E-2DF5B59CD883@vmware.com>
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Roland Scheidegger <sroland@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "spice-devel@lists.freedesktop.org" <spice-devel@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0220861510=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0220861510==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Am4FOUXZOcqPgHq39fhKGA0YvYMWrkUHS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Am4FOUXZOcqPgHq39fhKGA0YvYMWrkUHS
Content-Type: multipart/mixed; boundary="eaFRfE55w1MRvdfAsCcfX1mxELLfMlYIe";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Zack Rusin <zackr@vmware.com>
Cc: "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Roland Scheidegger <sroland@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "spice-devel@lists.freedesktop.org" <spice-devel@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Message-ID: <e8102216-edd0-bec3-79af-3925e9668e95@suse.de>
Subject: Re: [PATCH 14/15] drm/vmwgfx: Remove references to struct
 drm_device.pdev
References: <20201124113824.19994-1-tzimmermann@suse.de>
 <20201124113824.19994-15-tzimmermann@suse.de>
 <31E75B1A-AAC0-49E3-985E-2DF5B59CD883@vmware.com>
In-Reply-To: <31E75B1A-AAC0-49E3-985E-2DF5B59CD883@vmware.com>

--eaFRfE55w1MRvdfAsCcfX1mxELLfMlYIe
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 30.11.20 um 21:59 schrieb Zack Rusin:
>=20
>=20
>> On Nov 24, 2020, at 06:38, Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
>>
>> Using struct drm_device.pdev is deprecated. Convert vmwgfx to struct
>> drm_device.dev. No functional changes.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Roland Scheidegger <sroland@vmware.com>
>> ---
>> drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c |  8 ++++----
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.c    | 27 +++++++++++++-------------=

>> drivers/gpu/drm/vmwgfx/vmwgfx_fb.c     |  2 +-
>=20
> Reviewed-by: Zack Rusin <zackr@vmware.com>

Could you add this patch to the vmwgfx tree?

Best regards
Thomas

>=20
> z
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--eaFRfE55w1MRvdfAsCcfX1mxELLfMlYIe--

--Am4FOUXZOcqPgHq39fhKGA0YvYMWrkUHS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/HScUFAwAAAAAACgkQlh/E3EQov+A5
lQ/9EOKsA/oUbEGXGt6r0+ZOkVeDk90o3oIDiENMmRAuYbufsmkmqtcqjg8sxmvFdNZc8K1e18JZ
ImyhLHXHNQIOYlvi362TSMxM8G33UGBWo3se5Vhjy0vN+FrmpoWO3Pd2ctIKd3aux2dg5Tmj1wrG
U/dGG1VT+qMZKLUOkXRLXTP+1y7va8aRzEtGQc0pTFdBoDrb/IMsVl+MFaV+SJ5a9Ar95uL0x6vy
4052WSeyA+TDYncD8PeZHDEGotC5y/f8n9elTc+aBXGSCbNfhV5tad23yrM9MPTIs09BMJrGwRoo
8QOsFTfr5XWn5O4ex5UKfHulTRnKcC4aCactTA2G1GKw9A3rai8E6hTV+1BVcHg4Acae1SDNRpIb
USRpiiT89u08+tsbd0919ij3QwgTMzTgI9qdGfMELeNCHQ741LJGaPImJbSVKemITFRI4iKCag+Q
32lfaU2+T+gXIJW98OX/YjTLt1f2cWjEdKwaLG9cDXJG0YB0ezcML6lotmt+WOIvBO+RQQdJaGtj
gAIlRjBvToOGAhqbO0LEiN20VPRCP7mUOeyHcbETIxzmifa8wpWPukXmza6wYFu9P/KIaf1QYxJw
2ZBDHDxXhu155sbPPgL2KH+rK4+H93TwSWVJ2qGWsFNY+oCEaquEYIvOE+h1D8HWxoJXffHhu9GA
w9A=
=XbA6
-----END PGP SIGNATURE-----

--Am4FOUXZOcqPgHq39fhKGA0YvYMWrkUHS--

--===============0220861510==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0220861510==--
