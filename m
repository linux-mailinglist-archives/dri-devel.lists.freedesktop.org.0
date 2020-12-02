Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E242CB7CA
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:53:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 497C16EA07;
	Wed,  2 Dec 2020 08:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF8C6E955;
 Wed,  2 Dec 2020 08:52:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 67124AC2E;
 Wed,  2 Dec 2020 08:52:57 +0000 (UTC)
Subject: Re: [PATCH v2 01/20] drm/amdgpu: Fix trailing whitespaces
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 airlied@linux.ie, daniel@ffwll.ch
References: <20201201103542.2182-1-tzimmermann@suse.de>
 <20201201103542.2182-2-tzimmermann@suse.de>
 <d79aa7c0-9b0b-4f1b-c4e5-54f53a8d2931@amd.com>
 <63150504-fda0-48fd-9ecd-fb19ea0ae9d7@suse.de>
 <997ad04d-2acb-1dfb-0733-78f79a45b453@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <99ce8db3-a53f-7432-6e05-428c414174a2@suse.de>
Date: Wed, 2 Dec 2020 09:52:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <997ad04d-2acb-1dfb-0733-78f79a45b453@amd.com>
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
Content-Type: multipart/mixed; boundary="===============1788405546=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1788405546==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="NQTeTFwofrKnxF5g51AsjTFX2APrlinPw"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--NQTeTFwofrKnxF5g51AsjTFX2APrlinPw
Content-Type: multipart/mixed; boundary="0BmrJzoA6VxuSPrcTVlHO9W1ExU5R1O1i";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 airlied@linux.ie, daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>
Message-ID: <99ce8db3-a53f-7432-6e05-428c414174a2@suse.de>
Subject: Re: [PATCH v2 01/20] drm/amdgpu: Fix trailing whitespaces
References: <20201201103542.2182-1-tzimmermann@suse.de>
 <20201201103542.2182-2-tzimmermann@suse.de>
 <d79aa7c0-9b0b-4f1b-c4e5-54f53a8d2931@amd.com>
 <63150504-fda0-48fd-9ecd-fb19ea0ae9d7@suse.de>
 <997ad04d-2acb-1dfb-0733-78f79a45b453@amd.com>
In-Reply-To: <997ad04d-2acb-1dfb-0733-78f79a45b453@amd.com>

--0BmrJzoA6VxuSPrcTVlHO9W1ExU5R1O1i
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 02.12.20 um 09:43 schrieb Christian K=C3=B6nig:
> Am 02.12.20 um 08:59 schrieb Thomas Zimmermann:
>> Hi
>>
>> Am 01.12.20 um 11:40 schrieb Christian K=C3=B6nig:
>>> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com> on patch=
 #1=20
>>> and #15.
>>>
>>> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com> on patch #2=
 and=20
>>> #16.
>>
>> Could you add these patches to the AMD tree?
>=20
> Alex is usually the one who picks such stuff up.
>=20
> But when people send out patch sets which mix changes from different=20
> drivers it is more common to push them through drm-misc-next.

I'm OK with drm-misc-next. I just don't want to add too many merge=20
conflicts in your side.

Best regards
Thomas

>=20
> Regards,
> Christian.
>=20
>>
>> Best regards
>> Thomas
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>> Am 01.12.20 um 11:35 schrieb Thomas Zimmermann:
>>>> Adhere to kernel coding style.
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Acked-by: Alex Deucher <alexander.deucher@amd.com>
>>>> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>>>> ---
>>>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 6 +++---
>>>> =C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c=20
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> index 5f304425c948..da23c0f21311 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> @@ -4922,8 +4922,8 @@ pci_ers_result_t=20
>>>> amdgpu_pci_error_detected(struct pci_dev *pdev, pci_channel_sta
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case pci_channel_io_normal:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return PCI_ER=
S_RESULT_CAN_RECOVER;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Fatal error, prepare for slot rese=
t */
>>>> -=C2=A0=C2=A0=C2=A0 case pci_channel_io_frozen:
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>> +=C2=A0=C2=A0=C2=A0 case pci_channel_io_frozen:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Cance=
l and wait for all TDRs in progress if failing to
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * set=C2=
=A0 adev->in_gpu_reset in amdgpu_device_lock_adev
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>> @@ -5014,7 +5014,7 @@ pci_ers_result_t amdgpu_pci_slot_reset(struct =

>>>> pci_dev *pdev)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> -=C2=A0=C2=A0=C2=A0 adev->in_pci_err_recovery =3D true;
>>>> +=C2=A0=C2=A0=C2=A0 adev->in_pci_err_recovery =3D true;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D amdgpu_device_pre_asic_reset(ad=
ev, NULL, &need_full_reset);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adev->in_pci_err_recovery =3D false;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r)
>>>
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--0BmrJzoA6VxuSPrcTVlHO9W1ExU5R1O1i--

--NQTeTFwofrKnxF5g51AsjTFX2APrlinPw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/HVecFAwAAAAAACgkQlh/E3EQov+A4
/BAAm0Pz98qDnqqGJB82OfHn5e/hyEFmeHLwezK4YrvzbM4y5raTkGeAx6eXfbKKJV0PweE8wbGz
joUVnqAkB5kUtpM8YPdph7p2c/re2x2x0ZIBepouw5cnpYAYfbYrDxOgrEe82+BBeyx6ZtOJU+k3
DqPOsCUHMGkG1HFmYn3ejnp8HaDCPMTzoZOUjqXKNpNgf+iLbiPJypq8rei2Rquvb++VDI4+e0p1
+hQCPBMqTEDDqn3Wv+dVz4O2B7YoTsalcDBLyqTOCyxmoQwaBTKchYuUeFpIax+kov+J82Ju1qek
C7pz1JZbtArmXzYtxBzUJvuAjzIFzxY5OBzDFfbKAc7BvlpBZKim4GBVG/UXkbGCCS46McSSMilg
bSey0ZjMvfvTo5AOJ/8ovXaBtAmiPLwnS7JpuGHjgq6eCVwd8IHLHtXGYC17lUTLmPIaGJM5jswN
PWCbhkwRMRqIxD+GMiBpMp8SJ/1AqmNwAKpOo2YvELe2c9SmtUmhhVqG2izX/T8Lh94LJpbYyOev
U8UZssaUEZZsi7zoOVWV8V/Yoh0oclIRBGeVH3riljhpcsEIpNHtxupt4YWrwk9QmaQdz0Z8MJbH
TBQWlyIjzu682rqKskzhY6cavglZhv0ata8vuUuoxNfiZc05QXFwb/+qP28HyQmR7DpSf2QUqKeT
+N8=
=1A9q
-----END PGP SIGNATURE-----

--NQTeTFwofrKnxF5g51AsjTFX2APrlinPw--

--===============1788405546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1788405546==--
