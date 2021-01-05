Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E52592EA64A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 09:07:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047EC89FC3;
	Tue,  5 Jan 2021 08:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0063489FC3
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 08:07:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 79017ACAF;
 Tue,  5 Jan 2021 08:07:25 +0000 (UTC)
To: Deepak Rawat <drawat.floss@gmail.com>, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20210102060336.832866-1-drawat.floss@gmail.com>
 <2b49fcd2-38f7-dae5-2992-721a8bd142a2@suse.de>
 <4f7818f99734c0912325e1f3b6b80cb2a04df3ef.camel@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic video
 device
Message-ID: <ec340e8e-6386-d582-c93b-0a35c60f9dca@suse.de>
Date: Tue, 5 Jan 2021 09:07:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <4f7818f99734c0912325e1f3b6b80cb2a04df3ef.camel@gmail.com>
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
Cc: Wei Hu <weh@microsoft.com>, Tang Shaofeng <shaofeng.tang@intel.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 Michael Kelley <mikelley@microsoft.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============1366764133=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1366764133==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ahwCFPSmALTDxO0DSFPC2RArzbf1jd2fz"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ahwCFPSmALTDxO0DSFPC2RArzbf1jd2fz
Content-Type: multipart/mixed; boundary="lqWJRsDQUl5QzHmOmF7ZPUrqlakx578hj";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Deepak Rawat <drawat.floss@gmail.com>, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Dexuan Cui <decui@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Hu <weh@microsoft.com>,
 Tang Shaofeng <shaofeng.tang@intel.com>,
 Michael Kelley <mikelley@microsoft.com>
Message-ID: <ec340e8e-6386-d582-c93b-0a35c60f9dca@suse.de>
Subject: Re: [PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic video
 device
References: <20210102060336.832866-1-drawat.floss@gmail.com>
 <2b49fcd2-38f7-dae5-2992-721a8bd142a2@suse.de>
 <4f7818f99734c0912325e1f3b6b80cb2a04df3ef.camel@gmail.com>
In-Reply-To: <4f7818f99734c0912325e1f3b6b80cb2a04df3ef.camel@gmail.com>

--lqWJRsDQUl5QzHmOmF7ZPUrqlakx578hj
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 05.01.21 um 03:27 schrieb Deepak Rawat:
> On Mon, 2021-01-04 at 14:03 +0100, Thomas Zimmermann wrote:
>> Hi,
>>
>> I've been looking forward to this patchset. :) The code is really
>> nice
>> already.
>=20
> Thanks Thomas for the review.
>=20
>=20
>>>   =20
>>> +config DRM_HYPERV
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tristate "DRM Support for =
hyperv synthetic video device"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on DRM && PCI && M=
MU && HYPERV
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select DRM_KMS_HELPER
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select DRM_GEM_SHMEM_HELPE=
R
>>
>> SHMEM helpers might not be a good choice, because you need this blit
>> code, which has a memcpy.
>>
>> I guess it's easily possible to configure 16 MiB or more for the
>> guest's
>> VRAM? If so, I suggest to use VRAM helpers. Guests will be able to
>> render into VRAM directly with the driver's memcpy. The driver will
>> do
>> page flipping. The bochs driver would be an example.
>>
>> Hyperv doesn't need buffer sharing with other devices, I guess?
>>
>=20
> It's not possible to do page flip with this virtual device. The call to=

> SYNTHVID_VRAM_LOCATION is only honoured once. So unfortunately need to
> use SHMEM helpers.

I was thinking about using struct video_output_situation.vram_offset; in =

case you want to tinker with that. There's a comment in the patch that=20
vram_offset should always be 0. But this comment seems incorrect for=20
devices with more than one output.

In any case, SHMEM is good enough for now and this would not be a blocker=
=2E

>=20
>>> +#define PCI_VENDOR_ID_MICROSOFT 0x1414
>>> +#define PCI_DEVICE_ID_HYPERV_VIDEO 0x5353
>>> +
>>> +struct hyperv_device {
>>
>> Could this name lead to conflicts with other hyperv drivers? I
>> suggest
>> to name it hyperv_drm_device.
>>
>>
>=20
> Sure make sense to use hyperv_drm_device.
>=20
>>>
>>> +
>>> +struct synthvid_pointer_shape {
>>
>> Do you have plans for adding cursor support?
>>
>=20
> Yes I have tested with a prototype and cursor works. Will attempt this
> in future iteration.

Sounds good.

>=20
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Negotiate the protocol =
version with host */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0switch (vmbus_proto_versio=
n) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case VERSION_WIN10:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case VERSION_WIN10_V5:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0ret =3D synthvid_negotiate_ver(hdev,
>>> SYNTHVID_VERSION_WIN10);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0if (!ret)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0brea=
k;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0fallthrough;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case VERSION_WIN8:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case VERSION_WIN8_1:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0ret =3D synthvid_negotiate_ver(hdev,
>>> SYNTHVID_VERSION_WIN8);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0if (!ret)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0brea=
k;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0fallthrough;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case VERSION_WS2008:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case VERSION_WIN7:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0ret =3D synthvid_negotiate_ver(hdev,
>>> SYNTHVID_VERSION_WIN7);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0break;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0default:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0ret =3D synthvid_negotiate_ver(hdev,
>>> SYNTHVID_VERSION_WIN10);
>>
>> I don't get the logic of this switch statement. If the host is Win10,
>> I'd expect the graphics device to use Win10's protocol, if the host
>> is
>> Win8, the graphics device uses win8 protocols. So what's the point of
>> the fallthroughs? Can there be newer versions of vmbus_proto_version
>> that only support older devices?
>>
>>
>=20
> This is copied as it is from hyperv_fb driver. I suppose this is just
> to accomodate newer version.

I see. I would put the default case to the top; right before the Win10=20
case. So for newer or unknown versions, it tests Win10 and then falls=20
through until something works.

Best regards
Thomas

>>
>=20
> Deepak
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--lqWJRsDQUl5QzHmOmF7ZPUrqlakx578hj--

--ahwCFPSmALTDxO0DSFPC2RArzbf1jd2fz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/0HjwFAwAAAAAACgkQlh/E3EQov+B/
4xAAkDv8m+xFPc5RBbyqcPco6m4CYr+s8BDAA4J7f21Jii//UutL8AENdUyRsx0TF2fbXLVbCDgR
qLQ17+2aJW2jHWIFnoJi1irRtw2u5O14MoXld2oQ97YgzCsYKRj+KtMRxv3mC/0BfnHY5RbfSjlc
SGCl012FXSCiNZgAmIZvSe008spOGdQ1GSerkZw6hNZWw6tFzU5Np2e/OOgNwxlQ2kez3KDj7pLb
JfdOc/+dzXsLEdrm76OIjEwNujrSLnlpFIBHABnWKyoqxBffMhV/eFxWKp/OX9whrwEthfZoMjls
q1FLGlMOLyPn3BOLcGqynO9wYGyz3vcinmnpgXIptQJ7b2iy0apVqzU3h4+PH4KGSPCYBvicrpOl
UV1c96pqTHkqbMndzXIYzxl6Gwg9eDUss8JexuYAbA1xLvYi1k+afM9qwTNVOqs4s4InDGmCqcBR
ZQ7m9JW2qeewkL7xu9lrScI0+1/CyJzxiBmygVVfjYO5hLTFMhqD4FArau3TF2pTm9tISahy2nR2
5NvbEV8wXKe6wacHyjjcIHM27CL8dSL9qGC4WCfcKHg2W6LlHBamJvZ+hr5sMUbSP1Pq45quD5QX
zZLF1Izf8sexN87+YmEIgRIgsTkeNzsup5w58XFmcDFaiXaplFbws93DrU+db7hk6EfyrB+6ZK9I
7ZA=
=8J15
-----END PGP SIGNATURE-----

--ahwCFPSmALTDxO0DSFPC2RArzbf1jd2fz--

--===============1366764133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1366764133==--
