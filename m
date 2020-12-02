Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F412CB5F5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 08:56:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD3606E955;
	Wed,  2 Dec 2020 07:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC626E955
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 07:55:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B3654AC2D;
 Wed,  2 Dec 2020 07:55:53 +0000 (UTC)
To: Mikulas Patocka <mpatocka@redhat.com>
References: <20201130125200.10416-1-tzimmermann@suse.de>
 <alpine.LRH.2.02.2011300843270.29199@file01.intranet.prod.int.rdu2.redhat.com>
 <20201130154147.GT401619@phenom.ffwll.local>
 <alpine.LRH.2.02.2011301241470.21432@file01.intranet.prod.int.rdu2.redhat.com>
 <ac639546-d97e-b197-8998-180b0535fae2@suse.de>
 <alpine.LRH.2.02.2012010615080.1371@file01.intranet.prod.int.rdu2.redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] fbdev: Remove udlfb driver
Message-ID: <9e7cad29-a9c0-2e02-04a9-3149d7e15838@suse.de>
Date: Wed, 2 Dec 2020 08:55:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2012010615080.1371@file01.intranet.prod.int.rdu2.redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, geert+renesas@glider.be,
 linux-doc@vger.kernel.org, daniel.vetter@ffwll.ch, corbet@lwn.net,
 bernie@plugable.com, dri-devel@lists.freedesktop.org, sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============0623996128=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0623996128==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="DyF5ErOOQxZapjJT3Ag8XB7gJoy8VMU4t"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DyF5ErOOQxZapjJT3Ag8XB7gJoy8VMU4t
Content-Type: multipart/mixed; boundary="PCdFIN2iawhSKjj8GO2dskStC23JJYou5";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, linux-fbdev@vger.kernel.org,
 geert+renesas@glider.be, corbet@lwn.net, daniel.vetter@ffwll.ch,
 linux-doc@vger.kernel.org, bernie@plugable.com,
 dri-devel@lists.freedesktop.org, sam@ravnborg.org
Message-ID: <9e7cad29-a9c0-2e02-04a9-3149d7e15838@suse.de>
Subject: Re: [PATCH] fbdev: Remove udlfb driver
References: <20201130125200.10416-1-tzimmermann@suse.de>
 <alpine.LRH.2.02.2011300843270.29199@file01.intranet.prod.int.rdu2.redhat.com>
 <20201130154147.GT401619@phenom.ffwll.local>
 <alpine.LRH.2.02.2011301241470.21432@file01.intranet.prod.int.rdu2.redhat.com>
 <ac639546-d97e-b197-8998-180b0535fae2@suse.de>
 <alpine.LRH.2.02.2012010615080.1371@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2012010615080.1371@file01.intranet.prod.int.rdu2.redhat.com>

--PCdFIN2iawhSKjj8GO2dskStC23JJYou5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 01.12.20 um 12:20 schrieb Mikulas Patocka:
>=20
>=20
> On Tue, 1 Dec 2020, Thomas Zimmermann wrote:
>=20
>> Hi
>>
>> Am 30.11.20 um 19:39 schrieb Mikulas Patocka:
>>>
>>>
>>> On Mon, 30 Nov 2020, Daniel Vetter wrote:
>>>
>>>> On Mon, Nov 30, 2020 at 09:31:15AM -0500, Mikulas Patocka wrote:
>>>>>
>>>>> The framebuffer driver supports programs running full-screen direct=
ly on
>>>>> the framebuffer console, such as web browser "links -g", image view=
er
>>>>> "fbi", postscript+pdf viewer "fbgs", ZX Spectrum emulator "fuse-sdl=
",
>>>>> movie player "mplayer -vo fbdev". The DRM driver doesn't run them.
>>>>
>>>> Hm this should in general work on drm drivers. Without that it's cle=
ar the
>>>> switch-over isn't really ready yet.
>>>
>>> I fixed it with this patch two years ago:
>>> https://lists.freedesktop.org/archives/dri-devel/2018-June/179023.htm=
l
>>>
>>> But the patch never went through and the fb_defio feature was removed=
 in
>>> the kernel 5.6 (commit d0c4fc5a4814e431c15272935c8dc973c18073aa).
>>>
>>>
>>> Without fb_defio, the only other possibility how to update the screen=
 is
>>> the ioctl DRM_IOCTL_MODE_DIRTYFB. But this ioctl requires master mode=
, so
>>> user programs like "links -g" can't issue it.
>>
>> That's confusing. DIRTYFB is only for DRM.
>=20
> Yes, you're right.
>=20
>> And why can links not run as DRM master mode? If it renders to the ter=
minal,
>> it should act like a composer. In that case it almost certainly wants =
master
>> status.
>>
>> Best regards
>> Thomas
>=20
> How can a userspace program acquire master mode without being suid?

For my understanding, there's no easy solution to that. :/

I guess we (DRM devs) have to treat fbdev as the solution for use cases=20
such as ours.

For the unplug issue, I'll try to reproduce and fix it.

For the performance problems, we might be able to squeeze a few more=20
cycles out of it.

Best regards
Thomas

>=20
> Is there some "Hello World!" program that shows how to use DRM? I'm not=
 an
> expert in DRM, but if there were some tutorial+documentation, I could
> consider porting "links" to it.
>=20
> Mikulas
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--PCdFIN2iawhSKjj8GO2dskStC23JJYou5--

--DyF5ErOOQxZapjJT3Ag8XB7gJoy8VMU4t
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/HSIgFAwAAAAAACgkQlh/E3EQov+De
rRAAuiguOHT9X8o4OXxwH/edemSGzFmzaNQmrA/4rW8QIuym1UdDLWsCuHA1lwJzRCPmHMeYnACK
77jE/lKogeZtRMgfWh4UlN5o09oVZjRzHbX42vFxwgJBOu5cmB8bkKj20eC0JFZZ62evLT6SLla/
eRWqv0OFjZXM6Q/Qv6a5DDoEa56slbdE56sadbex7lGWNQ3VdYy+fx19UhsDtbkaxY4XkWlkGFvH
N5RtYgIPPOTGaCeVC5G3sTs9fymf1P4K7C9v3tNyFgQ+mBDGen80XAkpxzglH1TVc1ewidhZ/zmJ
M4HppnegjC6xYIvpV3ATk1Ec9HeOn/3lsuYri42Xe2sPVIJPtu53z/a2ph3kp+zajdnYCGqS5FFX
N/UE84LrSvrtBskNBO97RDKNaQ4v4JVVeRqZQ3UqD6saiZZenO1KMJYZNeJZewLBbZIcJK3V4I4K
bMkcyKBLvZg7HNgXDLikLfhyB5FHyng2GXWC/NlzSDGqqQRagi80xX1V9YM0LRd9/SgPuBBYUGoa
dQe1adAUP12eL3u69JB2b6sKEB3/dUPAsyQWAEsv0xplkBuTp5/AJh8iC61qmta6JQVJWqadBtR/
ja5aymitqclPi5cm5cztVi+FRZyj5xr2TmtdMzOnlOupIO3ICCinOy7EB406QvmMXMdDHez9b44g
vcE=
=46Cv
-----END PGP SIGNATURE-----

--DyF5ErOOQxZapjJT3Ag8XB7gJoy8VMU4t--

--===============0623996128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0623996128==--
