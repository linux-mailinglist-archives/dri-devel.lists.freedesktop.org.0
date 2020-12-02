Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 327DB2CB60C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:00:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D146EA08;
	Wed,  2 Dec 2020 08:00:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A7D16E955;
 Wed,  2 Dec 2020 08:00:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C10E2ABD2;
 Wed,  2 Dec 2020 07:59:59 +0000 (UTC)
Subject: Re: [PATCH v2 01/20] drm/amdgpu: Fix trailing whitespaces
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 airlied@linux.ie, daniel@ffwll.ch
References: <20201201103542.2182-1-tzimmermann@suse.de>
 <20201201103542.2182-2-tzimmermann@suse.de>
 <d79aa7c0-9b0b-4f1b-c4e5-54f53a8d2931@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <63150504-fda0-48fd-9ecd-fb19ea0ae9d7@suse.de>
Date: Wed, 2 Dec 2020 08:59:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <d79aa7c0-9b0b-4f1b-c4e5-54f53a8d2931@amd.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, spice-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0530392899=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0530392899==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="4eKph0FuFqNq79Rl3FZHdrapCHdf6uN3w"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4eKph0FuFqNq79Rl3FZHdrapCHdf6uN3w
Content-Type: multipart/mixed; boundary="3gcSrvRCjPgEBFOFDx6W1hdXoLEHQV45f";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 airlied@linux.ie, daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>
Message-ID: <63150504-fda0-48fd-9ecd-fb19ea0ae9d7@suse.de>
Subject: Re: [PATCH v2 01/20] drm/amdgpu: Fix trailing whitespaces
References: <20201201103542.2182-1-tzimmermann@suse.de>
 <20201201103542.2182-2-tzimmermann@suse.de>
 <d79aa7c0-9b0b-4f1b-c4e5-54f53a8d2931@amd.com>
In-Reply-To: <d79aa7c0-9b0b-4f1b-c4e5-54f53a8d2931@amd.com>

--3gcSrvRCjPgEBFOFDx6W1hdXoLEHQV45f
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 01.12.20 um 11:40 schrieb Christian K=C3=B6nig:
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com> on patch #=
1 and=20
> #15.
>=20
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com> on patch #2 a=
nd #16.

Could you add these patches to the AMD tree?

Best regards
Thomas

>=20
> Regards,
> Christian.
>=20
> Am 01.12.20 um 11:35 schrieb Thomas Zimmermann:
>> Adhere to kernel coding style.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Acked-by: Alex Deucher <alexander.deucher@amd.com>
>> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>> ---
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 6 +++---
>> =C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c=20
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 5f304425c948..da23c0f21311 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -4922,8 +4922,8 @@ pci_ers_result_t=20
>> amdgpu_pci_error_detected(struct pci_dev *pdev, pci_channel_sta
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case pci_channel_io_normal:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return PCI_ERS_=
RESULT_CAN_RECOVER;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Fatal error, prepare for slot reset =
*/
>> -=C2=A0=C2=A0=C2=A0 case pci_channel_io_frozen:
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0 case pci_channel_io_frozen:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Cancel =
and wait for all TDRs in progress if failing to
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * set=C2=A0=
 adev->in_gpu_reset in amdgpu_device_lock_adev
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
>> @@ -5014,7 +5014,7 @@ pci_ers_result_t amdgpu_pci_slot_reset(struct=20
>> pci_dev *pdev)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> -=C2=A0=C2=A0=C2=A0 adev->in_pci_err_recovery =3D true;
>> +=C2=A0=C2=A0=C2=A0 adev->in_pci_err_recovery =3D true;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D amdgpu_device_pre_asic_reset(adev=
, NULL, &need_full_reset);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adev->in_pci_err_recovery =3D false;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r)
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--3gcSrvRCjPgEBFOFDx6W1hdXoLEHQV45f--

--4eKph0FuFqNq79Rl3FZHdrapCHdf6uN3w
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/HSX4FAwAAAAAACgkQlh/E3EQov+Cn
iw//fMsnlOc+PqrXSFAe13Z7qjnUrEob83wRbIiWj/feKrpixLOuIGOprm2tQfMp2FPfMTiYrWeO
MEVLR7xWsfiqPaupauttA82gBtVO8yYZ5Yabi82zNqX77osAm/w17zF39c+p11W9duhZnV8brHhv
RKTnwzP1pD13Q5mpBf6WLOHOe8QUsQBz51DTZEsPl2CKYjXMv+GXX9Gr+mtG1tW0VkpgnzlsDe+Y
yY327EqhjgE8T1I4Qx4qaPllqRX6BBxe2KRj7RYW8OL/GEYCJqbEhDn+iEeHdr1gZ9DA0eeGXWa1
TxtTtBF3OK27o1UnO5KKhoW4LN2d6YePlDrEtf/AWji0OokAs+kv/F3xVUJBuXL+OQhR8CQ92Nzv
/lWarpsKvjmmd8SXBAsJNsFz53JkbQVDzrZ5qEYEgGXPBP8TWjV7E8nRx+ntndUlVy9KiH/AkJ96
EVtmhNvNp439cNraXizLMDjwFnUiHed6zZi0AcdM8T/dxBWRzeelF0WwWdV3VEdw6BBYZJyoLEz3
qY6SoqOWzuBYutJ+4uqLUzj9xtIdxlbszyvu+p1zN9GQ4Vb/2Sfq7wi+7Sku2qiwO/iWasSzzQJG
BMQsZ0uKrn1/7/JqYA+p8rOH3Bpv8RcMZUcfpnqKhBG1iU4bzFQGrkwpLssRf24v6eEjnwiIRLH4
7TE=
=8bgC
-----END PGP SIGNATURE-----

--4eKph0FuFqNq79Rl3FZHdrapCHdf6uN3w--

--===============0530392899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0530392899==--
