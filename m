Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C452CBF90
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 15:27:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C83E6EA37;
	Wed,  2 Dec 2020 14:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FAF46EA36;
 Wed,  2 Dec 2020 14:27:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ED0E8AE95;
 Wed,  2 Dec 2020 14:27:32 +0000 (UTC)
Subject: Re: [PATCH 14/15] drm/vmwgfx: Remove references to struct
 drm_device.pdev
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Zack Rusin <zackr@vmware.com>
References: <20201124113824.19994-1-tzimmermann@suse.de>
 <20201124113824.19994-15-tzimmermann@suse.de>
 <31E75B1A-AAC0-49E3-985E-2DF5B59CD883@vmware.com>
 <e8102216-edd0-bec3-79af-3925e9668e95@suse.de>
Message-ID: <d43d06e6-d13c-ef9b-b372-8d30d9494417@suse.de>
Date: Wed, 2 Dec 2020 15:27:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <e8102216-edd0-bec3-79af-3925e9668e95@suse.de>
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
Content-Type: multipart/mixed; boundary="===============1347272155=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1347272155==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="2mzi1IasmC0ppc6PTo32ynRnk8CZmEtUv"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2mzi1IasmC0ppc6PTo32ynRnk8CZmEtUv
Content-Type: multipart/mixed; boundary="1nqLIFRzQMDN5weBvDjLDQObFbZZxljKZ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Zack Rusin <zackr@vmware.com>
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Roland Scheidegger <sroland@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "spice-devel@lists.freedesktop.org" <spice-devel@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Message-ID: <d43d06e6-d13c-ef9b-b372-8d30d9494417@suse.de>
Subject: Re: [PATCH 14/15] drm/vmwgfx: Remove references to struct
 drm_device.pdev
References: <20201124113824.19994-1-tzimmermann@suse.de>
 <20201124113824.19994-15-tzimmermann@suse.de>
 <31E75B1A-AAC0-49E3-985E-2DF5B59CD883@vmware.com>
 <e8102216-edd0-bec3-79af-3925e9668e95@suse.de>
In-Reply-To: <e8102216-edd0-bec3-79af-3925e9668e95@suse.de>

--1nqLIFRzQMDN5weBvDjLDQObFbZZxljKZ
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 02.12.20 um 09:01 schrieb Thomas Zimmermann:
> Hi
>=20
> Am 30.11.20 um 21:59 schrieb Zack Rusin:
>>
>>
>>> On Nov 24, 2020, at 06:38, Thomas Zimmermann <tzimmermann@suse.de>=20
>>> wrote:
>>>
>>> Using struct drm_device.pdev is deprecated. Convert vmwgfx to struct
>>> drm_device.dev. No functional changes.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Roland Scheidegger <sroland@vmware.com>
>>> ---
>>> drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c |=C2=A0 8 ++++----
>>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.c=C2=A0=C2=A0=C2=A0 | 27 ++++++++++=
+++-------------
>>> drivers/gpu/drm/vmwgfx/vmwgfx_fb.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 =
+-
>>
>> Reviewed-by: Zack Rusin <zackr@vmware.com>
>=20
> Could you add this patch to the vmwgfx tree?

AMD devs indicated that they'd prefer to merge the patchset trough=20
drm-misc-next. If you're OK with that, I'd merge the vmwgfx patch=20
through drm-misc-next as well.

Best regards
Thomas

>=20
> Best regards
> Thomas
>=20
>>
>> z
>>
>=20
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--1nqLIFRzQMDN5weBvDjLDQObFbZZxljKZ--

--2mzi1IasmC0ppc6PTo32ynRnk8CZmEtUv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/HpFMFAwAAAAAACgkQlh/E3EQov+B4
2Q//WvRxXdOpYaAHFHlUcv0PD//e6GyYAy+TR7YnOjNqUq7iPFHgHZn3cxeXLRJzUlAzdPCyou96
5amBeoX8d+On6kwQu+bBbaMR0v3ToPe51gpVQul1vfJZGsvm3dzQp+cToxDeBVSbC6mZRdE5yoK1
FuTUwTP+0oMErWaFGczNk/j6cZq5Rvh81AVy+TTVm8c5ubNXzYmy+vKNypwsuYSITXbPbsGSKoE7
4vKsj1ib4nzuakriu0LEonUawcQY9H0qFKePjwbDSebMEdfEAzGNZ/LDXHUpMW5/ASiQfnf42ZIn
EtxMMndKZzer3j28YuinIexjW4rE2eQrP11jpkRZ3m/lmuiaO9gxHRFRnVGcQRg4TcG4zMxdMC10
EYT79Socs5hrNDIgliPpFDIDFtozrFxCOZFZJFLvnsZ0cgpfkKWWOqzKP0Dai2jeaXO60T/Ovn9v
DGlZnGkD9AcZL06SpoWrtDLlrj+AfJ71d1B+FYlIAZTJCaEFUc3R/J9T52J2qXlzZo3/AmLXNVPC
YLJvu2/58IJB2FQdAgvtfGls8Qyd7xCXg5fLAh4Y2erd6Ofozi20lI5Dm4wD2WsmpkcL0Lmxmb09
aEq+V8kEAPhbXcBPNvXLwl9gZYrBt156CYqsGI43raRiWRcQKbk8HLOuQMIBOHWsrYcx/VO4Wxfi
waA=
=8LYe
-----END PGP SIGNATURE-----

--2mzi1IasmC0ppc6PTo32ynRnk8CZmEtUv--

--===============1347272155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1347272155==--
