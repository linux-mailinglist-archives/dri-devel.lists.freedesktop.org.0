Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9012CBF99
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 15:28:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36CB26EA37;
	Wed,  2 Dec 2020 14:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B826EA36;
 Wed,  2 Dec 2020 14:28:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7AB7BAD5C;
 Wed,  2 Dec 2020 14:28:29 +0000 (UTC)
Subject: Re: [PATCH v2 01/20] drm/amdgpu: Fix trailing whitespaces
To: Alex Deucher <alexdeucher@gmail.com>
References: <20201201103542.2182-1-tzimmermann@suse.de>
 <20201201103542.2182-2-tzimmermann@suse.de>
 <d79aa7c0-9b0b-4f1b-c4e5-54f53a8d2931@amd.com>
 <63150504-fda0-48fd-9ecd-fb19ea0ae9d7@suse.de>
 <997ad04d-2acb-1dfb-0733-78f79a45b453@amd.com>
 <99ce8db3-a53f-7432-6e05-428c414174a2@suse.de>
 <CADnq5_O6X_kbdT8ZTzL1P35wgauVNc77voWf97LogDJXia5VTg@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <6d286f72-6669-9027-97d9-7981beb0240b@suse.de>
Date: Wed, 2 Dec 2020 15:28:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_O6X_kbdT8ZTzL1P35wgauVNc77voWf97LogDJXia5VTg@mail.gmail.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Dave Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, spice-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============0910810422=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0910810422==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Aq5Kez8sVYZULyX1T5cE6UtGwvFf9vfV4"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Aq5Kez8sVYZULyX1T5cE6UtGwvFf9vfV4
Content-Type: multipart/mixed; boundary="N5NuQEt6cq0WEmbiR0tq2SB6BzRSX2VB2";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: intel-gvt-dev@lists.freedesktop.org, Dave Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, spice-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
Message-ID: <6d286f72-6669-9027-97d9-7981beb0240b@suse.de>
Subject: Re: [PATCH v2 01/20] drm/amdgpu: Fix trailing whitespaces
References: <20201201103542.2182-1-tzimmermann@suse.de>
 <20201201103542.2182-2-tzimmermann@suse.de>
 <d79aa7c0-9b0b-4f1b-c4e5-54f53a8d2931@amd.com>
 <63150504-fda0-48fd-9ecd-fb19ea0ae9d7@suse.de>
 <997ad04d-2acb-1dfb-0733-78f79a45b453@amd.com>
 <99ce8db3-a53f-7432-6e05-428c414174a2@suse.de>
 <CADnq5_O6X_kbdT8ZTzL1P35wgauVNc77voWf97LogDJXia5VTg@mail.gmail.com>
In-Reply-To: <CADnq5_O6X_kbdT8ZTzL1P35wgauVNc77voWf97LogDJXia5VTg@mail.gmail.com>

--N5NuQEt6cq0WEmbiR0tq2SB6BzRSX2VB2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 02.12.20 um 15:02 schrieb Alex Deucher:
> On Wed, Dec 2, 2020 at 3:53 AM Thomas Zimmermann <tzimmermann@suse.de> =
wrote:
>>
>> Hi
>>
>> Am 02.12.20 um 09:43 schrieb Christian K=C3=B6nig:
>>> Am 02.12.20 um 08:59 schrieb Thomas Zimmermann:
>>>> Hi
>>>>
>>>> Am 01.12.20 um 11:40 schrieb Christian K=C3=B6nig:
>>>>> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com> on pat=
ch #1
>>>>> and #15.
>>>>>
>>>>> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com> on patch =
#2 and
>>>>> #16.
>>>>
>>>> Could you add these patches to the AMD tree?
>>>
>>> Alex is usually the one who picks such stuff up.
>>>
>>> But when people send out patch sets which mix changes from different
>>> drivers it is more common to push them through drm-misc-next.
>>
>> I'm OK with drm-misc-next. I just don't want to add too many merge
>> conflicts in your side.
>=20
> Yeah, it doesn't matter to me.  I assumed you wanted to land this
> whole series so you could move forward with further cleanups.  If we
> merge via different trees, you'll have to wait for all of this to come
> together again in drm-next.

OK, sure. I'll merge it through drm-misc-next.

Best regards
Thomas

>=20
> Alex
>=20
>=20
>>
>> Best regards
>> Thomas
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>> Am 01.12.20 um 11:35 schrieb Thomas Zimmermann:
>>>>>> Adhere to kernel coding style.
>>>>>>
>>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>> Acked-by: Alex Deucher <alexander.deucher@amd.com>
>>>>>> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>>>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 6 +++---
>>>>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>> index 5f304425c948..da23c0f21311 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>> @@ -4922,8 +4922,8 @@ pci_ers_result_t
>>>>>> amdgpu_pci_error_detected(struct pci_dev *pdev, pci_channel_sta
>>>>>>        case pci_channel_io_normal:
>>>>>>            return PCI_ERS_RESULT_CAN_RECOVER;
>>>>>>        /* Fatal error, prepare for slot reset */
>>>>>> -    case pci_channel_io_frozen:
>>>>>> -        /*
>>>>>> +    case pci_channel_io_frozen:
>>>>>> +        /*
>>>>>>             * Cancel and wait for all TDRs in progress if failing =
to
>>>>>>             * set  adev->in_gpu_reset in amdgpu_device_lock_adev
>>>>>>             *
>>>>>> @@ -5014,7 +5014,7 @@ pci_ers_result_t amdgpu_pci_slot_reset(struc=
t
>>>>>> pci_dev *pdev)
>>>>>>            goto out;
>>>>>>        }
>>>>>> -    adev->in_pci_err_recovery =3D true;
>>>>>> +    adev->in_pci_err_recovery =3D true;
>>>>>>        r =3D amdgpu_device_pre_asic_reset(adev, NULL, &need_full_r=
eset);
>>>>>>        adev->in_pci_err_recovery =3D false;
>>>>>>        if (r)
>>>>>
>>>>
>>>
>>
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>
>> _______________________________________________
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
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


--N5NuQEt6cq0WEmbiR0tq2SB6BzRSX2VB2--

--Aq5Kez8sVYZULyX1T5cE6UtGwvFf9vfV4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/HpIwFAwAAAAAACgkQlh/E3EQov+BX
KRAAzqi3AuVErjo8TUvkFebgXZwduknMi4OZYhXPOGMf3G5ZaGkceS+n/hKTP0JWrogg/H4AYJE1
J7sDOoy2QwN0wM/jQ8r5FdMUzPTin0IYduvnUQpNNqH0BP8yZB5l0zR0Ay3pCBWpAFWQp4cupgkI
Qf8xetRC9DDKcpP+jcfCsOtlU9CA2ZomJZHwn23RU+ynlKqN71lEKfuyCUB3kvIsmy1e9aJU0s2B
rRWOcdUk8OjmZha5+FhUDUptuV3+220mX84CbYxrBmZH8PMfSsgmhtJjEjoPb+QiLbyTkOjc5C71
EDDUiuRbDrK9QiVu/y1Kz9Vb2/TciJC31W9SE06z307Ok2nqxPbf4QckYFVyeVmDV9o/JbtkX3Dh
6PuwxA4/1FnvAqnOQZc54EmGUleNhBOSnmVzQ38IFpOZBatVJcgQKKY+Lc3h2dXOflhBP3oydzke
+zKWrcSfMfiChoH+51Rtyk7Zxb+nA0Y9mK9mEaYzXhyJyGvewC8NykTRruafNpPum/1eZF26CB4u
wB6+G3k91DYzXMyuBBLONMgZwdzAFRb8MO1i80A79JhLWfl2Nke48Fuw58pQc/HLj0et4fn8MqBX
qdu1ud8GM9uNMPSY1VNoRdhCKWy17OQRYbrg9SBzzBEZSRdhDjVz1EKc1Jxp9E9QMdflLId4HY5o
HHQ=
=6LTS
-----END PGP SIGNATURE-----

--Aq5Kez8sVYZULyX1T5cE6UtGwvFf9vfV4--

--===============0910810422==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0910810422==--
