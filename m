Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7142EA9E6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 12:30:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ADC16E0DF;
	Tue,  5 Jan 2021 11:30:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E848997C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 11:30:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AC13AB04C;
 Tue,  5 Jan 2021 11:30:31 +0000 (UTC)
Subject: Re: [PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic video
 device
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210102060336.832866-1-drawat.floss@gmail.com>
 <2b49fcd2-38f7-dae5-2992-721a8bd142a2@suse.de>
 <4f7818f99734c0912325e1f3b6b80cb2a04df3ef.camel@gmail.com>
 <ec340e8e-6386-d582-c93b-0a35c60f9dca@suse.de>
 <20210105110438.zhy22zzqfgbnonos@sirius.home.kraxel.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <8ff4bd88-6e98-3db5-232d-98ce2c370cd1@suse.de>
Date: Tue, 5 Jan 2021 12:30:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105110438.zhy22zzqfgbnonos@sirius.home.kraxel.org>
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
Cc: linux-hyperv@vger.kernel.org, Wei Hu <weh@microsoft.com>,
 Tang Shaofeng <shaofeng.tang@intel.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 dri-devel@lists.freedesktop.org, Michael Kelley <mikelley@microsoft.com>,
 Deepak Rawat <drawat.floss@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============1605234867=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1605234867==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Iep15CppaIkErYIVECpkDJEUZHyGuxyjQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Iep15CppaIkErYIVECpkDJEUZHyGuxyjQ
Content-Type: multipart/mixed; boundary="WURKEi3hSP6Hm7nRj0fQjDhhjLTvwYIxO";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: linux-hyperv@vger.kernel.org, Wei Hu <weh@microsoft.com>,
 Tang Shaofeng <shaofeng.tang@intel.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 dri-devel@lists.freedesktop.org, Michael Kelley <mikelley@microsoft.com>,
 Deepak Rawat <drawat.floss@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Message-ID: <8ff4bd88-6e98-3db5-232d-98ce2c370cd1@suse.de>
Subject: Re: [PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic video
 device
References: <20210102060336.832866-1-drawat.floss@gmail.com>
 <2b49fcd2-38f7-dae5-2992-721a8bd142a2@suse.de>
 <4f7818f99734c0912325e1f3b6b80cb2a04df3ef.camel@gmail.com>
 <ec340e8e-6386-d582-c93b-0a35c60f9dca@suse.de>
 <20210105110438.zhy22zzqfgbnonos@sirius.home.kraxel.org>
In-Reply-To: <20210105110438.zhy22zzqfgbnonos@sirius.home.kraxel.org>

--WURKEi3hSP6Hm7nRj0fQjDhhjLTvwYIxO
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 05.01.21 um 12:04 schrieb Gerd Hoffmann:
>    Hi,
>=20
>>> It's not possible to do page flip with this virtual device. The call =
to
>>> SYNTHVID_VRAM_LOCATION is only honoured once. So unfortunately need t=
o
>>> use SHMEM helpers.
>>
>> I was thinking about using struct video_output_situation.vram_offset; =
in
>> case you want to tinker with that. There's a comment in the patch that=

>> vram_offset should always be 0. But this comment seems incorrect for d=
evices
>> with more than one output.
>=20
> Where does the comment come from?  fbdev drivers support a single
> framebuffer only so for a fbdev driver it makes sense to set the offset=

> to 0 unconditionally.  With drm you probably can handle things
> differently ...

I cannot find it in hyperv_fb.c; it must have gotten introduced here.

Only one display is supported by this DRM driver, so the comment is=20
correct. In the future, having support for multiple displays might be an =

option.

Best regards
Thomas

>=20
> take care,
>    Gerd
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


--WURKEi3hSP6Hm7nRj0fQjDhhjLTvwYIxO--

--Iep15CppaIkErYIVECpkDJEUZHyGuxyjQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/0TdYFAwAAAAAACgkQlh/E3EQov+BV
FA/+Kilf2+Cz+UY/nJNcvKRGVMnTHb3FUKCYkldGpjs7VIyNJ2QpZvE1KVsLH+rKRo2sIn/JkmyG
pwngJeoNsHxvn5PkHMFpQaRZNE5QkAuLTjK/eltn70bPuMJ9qF74ZU8YDIiLtpdkhB/tT+kkWloC
NHGftIk2saxWL93AQnwuTPatl9trOc9Fs0NQQz6rDAvNuue/Vv87jczMeOdqwJIYI9qTnpxM3we0
YzFXjinJUm8ML5Z7w2j0JWFXuoadrgPeaThsEsCbRK5EI9zCQj/DKGcLfz0dMzf4TI9CGqGZbsYb
mF9PMUvMk/HFh+QPomBAzpl8V7C8XN4i/zAU8UYZZiuG727AecJqnk8F6mjTM4cxSIemzxSGnMNP
Zq3GWjmgO6OiaztHKZo6chTs1U+H4cVMEwxq7Yt89GvfHTlVZo8ZRKkDVFijr7Jdh6YuLWasXoUr
Dg083y6KuEOizfwWxuUVuCZHteisXhigCKMfTVI/9Y9XN5IHAHT0qLJXKvcujngyX8dCCK6mk1lu
Qo41Rw7pLFv5VtFSwCJVsGhZCL5Salqxo1ADzFX5vAI6TCRBsgmjHCvBn7O1VX7uajA8CKN1PlTj
12iiYcdGPRuNgsGcA4spdxbFNZ2DHdr4Zcrbwkd4LhgX/42VupzlYUo+JKb1xPLaxeSqwMPEN+pk
kn0=
=65VW
-----END PGP SIGNATURE-----

--Iep15CppaIkErYIVECpkDJEUZHyGuxyjQ--

--===============1605234867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1605234867==--
