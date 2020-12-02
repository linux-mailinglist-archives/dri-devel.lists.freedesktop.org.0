Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9E62CB617
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:02:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDA66EA03;
	Wed,  2 Dec 2020 08:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72976EA03
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 08:02:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 53EA6ABD2;
 Wed,  2 Dec 2020 08:01:59 +0000 (UTC)
Subject: Re: [PATCH] fbdev: Remove udlfb driver
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Mikulas Patocka <mpatocka@redhat.com>
References: <20201130125200.10416-1-tzimmermann@suse.de>
 <alpine.LRH.2.02.2011300843270.29199@file01.intranet.prod.int.rdu2.redhat.com>
 <20201130154147.GT401619@phenom.ffwll.local>
 <alpine.LRH.2.02.2011301241470.21432@file01.intranet.prod.int.rdu2.redhat.com>
 <ac639546-d97e-b197-8998-180b0535fae2@suse.de>
 <alpine.LRH.2.02.2012010615080.1371@file01.intranet.prod.int.rdu2.redhat.com>
 <9e7cad29-a9c0-2e02-04a9-3149d7e15838@suse.de>
Message-ID: <d3dbe8bf-d5a3-dc6e-b98a-778d942ee7fa@suse.de>
Date: Wed, 2 Dec 2020 09:01:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <9e7cad29-a9c0-2e02-04a9-3149d7e15838@suse.de>
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
Content-Type: multipart/mixed; boundary="===============0186385085=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0186385085==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="4QEmHYAmn97ipMvLKAVzidpTp0CzotVig"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4QEmHYAmn97ipMvLKAVzidpTp0CzotVig
Content-Type: multipart/mixed; boundary="g2nXcqKmfiVdxBUkyf25Q6uypK25c8Smd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, linux-fbdev@vger.kernel.org,
 geert+renesas@glider.be, corbet@lwn.net, daniel.vetter@ffwll.ch,
 linux-doc@vger.kernel.org, bernie@plugable.com,
 dri-devel@lists.freedesktop.org, sam@ravnborg.org
Message-ID: <d3dbe8bf-d5a3-dc6e-b98a-778d942ee7fa@suse.de>
Subject: Re: [PATCH] fbdev: Remove udlfb driver
References: <20201130125200.10416-1-tzimmermann@suse.de>
 <alpine.LRH.2.02.2011300843270.29199@file01.intranet.prod.int.rdu2.redhat.com>
 <20201130154147.GT401619@phenom.ffwll.local>
 <alpine.LRH.2.02.2011301241470.21432@file01.intranet.prod.int.rdu2.redhat.com>
 <ac639546-d97e-b197-8998-180b0535fae2@suse.de>
 <alpine.LRH.2.02.2012010615080.1371@file01.intranet.prod.int.rdu2.redhat.com>
 <9e7cad29-a9c0-2e02-04a9-3149d7e15838@suse.de>
In-Reply-To: <9e7cad29-a9c0-2e02-04a9-3149d7e15838@suse.de>

--g2nXcqKmfiVdxBUkyf25Q6uypK25c8Smd
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 02.12.20 um 08:55 schrieb Thomas Zimmermann:
> Hi
>=20
> Am 01.12.20 um 12:20 schrieb Mikulas Patocka:
>>
>>
>> On Tue, 1 Dec 2020, Thomas Zimmermann wrote:
>>
>>> Hi
>>>
>>> Am 30.11.20 um 19:39 schrieb Mikulas Patocka:
>>>>
>>>>
>>>> On Mon, 30 Nov 2020, Daniel Vetter wrote:
>>>>
>>>>> On Mon, Nov 30, 2020 at 09:31:15AM -0500, Mikulas Patocka wrote:
>>>>>>
>>>>>> The framebuffer driver supports programs running full-screen=20
>>>>>> directly on
>>>>>> the framebuffer console, such as web browser "links -g", image vie=
wer
>>>>>> "fbi", postscript+pdf viewer "fbgs", ZX Spectrum emulator "fuse-sd=
l",
>>>>>> movie player "mplayer -vo fbdev". The DRM driver doesn't run them.=

>>>>>
>>>>> Hm this should in general work on drm drivers. Without that it's=20
>>>>> clear the
>>>>> switch-over isn't really ready yet.
>>>>
>>>> I fixed it with this patch two years ago:
>>>> https://lists.freedesktop.org/archives/dri-devel/2018-June/179023.ht=
ml
>>>>
>>>> But the patch never went through and the fb_defio feature was=20
>>>> removed in
>>>> the kernel 5.6 (commit d0c4fc5a4814e431c15272935c8dc973c18073aa).
>>>>
>>>>
>>>> Without fb_defio, the only other possibility how to update the=20
>>>> screen is
>>>> the ioctl DRM_IOCTL_MODE_DIRTYFB. But this ioctl requires master=20
>>>> mode, so
>>>> user programs like "links -g" can't issue it.
>>>
>>> That's confusing. DIRTYFB is only for DRM.
>>
>> Yes, you're right.
>>
>>> And why can links not run as DRM master mode? If it renders to the=20
>>> terminal,
>>> it should act like a composer. In that case it almost certainly wants=
=20
>>> master
>>> status.
>>>
>>> Best regards
>>> Thomas
>>
>> How can a userspace program acquire master mode without being suid?
>=20
> For my understanding, there's no easy solution to that. :/
>=20
> I guess we (DRM devs) have to treat fbdev as the solution for use cases=
=20
> such as ours.

s/ours/yours

>=20
> For the unplug issue, I'll try to reproduce and fix it.
>=20
> For the performance problems, we might be able to squeeze a few more=20
> cycles out of it.
>=20
> Best regards
> Thomas
>=20
>>
>> Is there some "Hello World!" program that shows how to use DRM? I'm=20
>> not an
>> expert in DRM, but if there were some tutorial+documentation, I could
>> consider porting "links" to it.
>>
>> Mikulas
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--g2nXcqKmfiVdxBUkyf25Q6uypK25c8Smd--

--4QEmHYAmn97ipMvLKAVzidpTp0CzotVig
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/HSfYFAwAAAAAACgkQlh/E3EQov+A4
pA/9GS90vDzxsEuokb7l3rmAoNSPBWVxht2CUEgFRopOrQZZOh2rB6tgE32ODTnwpXTsvw+b4ABb
X3Nt0YCUAecSvDo0Vb2Tvf+dgidnT2HPtc8G6Lq7Y+QgYJTYmBq/xAxjbqjHoBLqMf2VBxCETyDl
ARepztWJkNE1ZIa2nkwIQdJZPid4GU99BXVT/eRUZyY5L9gtMPdYNe0mmyHm1JSgjgTf58gN6Pae
RCFK2lLY0rPmQH0vXj7Ery1kJFnB+/jBjSvVdJXhoqDuMJuaLf4e8otAc4KQqiLINgyTxAKFOk75
VMa2L3uRFG3wU00b6OPeujEKa5FSgOeJk4aSiWvCFhX0eLLk9EJIhnziyJewP6ZgWonTbXwPRM4S
a/IvZqnZmnf+a46nUel5UNca1xUW9EvSrkDUSVd5nUZYXPEnTk+fjpKvmE28YIgOJfRxb5jFVtWA
revA/u6Ar5SHPpmazbcdzKYIyji8cAIoE/ASvKE5JZVgvyPzOfET0Fw/RmqWQc4OKBXLBtwbkULh
N+siqkDxADGwiVvIyBB3WDyhFfM/jy3fh70jHAbo3FqHw8Qt3dluUu7P0mw1xrwE9sPTTSV9uoZE
7TrPsyaeQL57GHO1An+TkFb79UwgDWqex/1xhqV+GDLmQFFTPlHRU+gQ9iA9rU/5xa6PtyVZfGId
e4E=
=mSnb
-----END PGP SIGNATURE-----

--4QEmHYAmn97ipMvLKAVzidpTp0CzotVig--

--===============0186385085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0186385085==--
