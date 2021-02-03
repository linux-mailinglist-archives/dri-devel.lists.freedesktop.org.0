Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6B630D492
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 09:03:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA006E440;
	Wed,  3 Feb 2021 08:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8542F6E440
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 08:03:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BFCDFAEC3;
 Wed,  3 Feb 2021 08:03:48 +0000 (UTC)
To: Geert Uytterhoeven <geert@linux-m68k.org>, Daniel Vetter <daniel@ffwll.ch>
References: <20200916205434.GA10389@duo.ucw.cz>
 <87czyf5jjp.fsf@vps.thesusis.net>
 <CAHk-=wjsjC1h7fskwYaaRLykN1ms6ZtxGvucQgmL-zZTfxPdBA@mail.gmail.com>
 <CAKMK7uEGXOC_ci=Drm=Hz+xPGdcoxv8YZ-gcOckoPmu2XijiSA@mail.gmail.com>
 <CAMuHMdVzCjVim4A3eAZzztqUyjb6a2bjmSkgxUnaugQFv42qag@mail.gmail.com>
 <CAKMK7uEwHu5GLF16wn83PLZUjoJWgF0dcLXwsGkt_aBpOgLt+w@mail.gmail.com>
 <CAMuHMdUf3eeK=Fr_pasUdXkk_zuicFBqNY+jSnH6EgUgmG+3hA@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: fbcon: remove soft scrollback code (missing Doc. patch)
Message-ID: <7d666c65-80ea-905e-b50f-76af5a6dceb0@suse.de>
Date: Wed, 3 Feb 2021 09:03:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUf3eeK=Fr_pasUdXkk_zuicFBqNY+jSnH6EgUgmG+3hA@mail.gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Phillip Susi <phill@thesusis.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Pavel Machek <pavel@ucw.cz>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: multipart/mixed; boundary="===============1625924500=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1625924500==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="yfezKyx6UTf5mVJ1BQtTrApR6vxn8LUjj"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--yfezKyx6UTf5mVJ1BQtTrApR6vxn8LUjj
Content-Type: multipart/mixed; boundary="GDhN2qL2aB0rrSOiLw5PqylZkoxuD3V1N";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Daniel Vetter <daniel@ffwll.ch>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Phillip Susi <phill@thesusis.net>, Pavel Machek <pavel@ucw.cz>,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Message-ID: <7d666c65-80ea-905e-b50f-76af5a6dceb0@suse.de>
Subject: Re: fbcon: remove soft scrollback code (missing Doc. patch)
References: <20200916205434.GA10389@duo.ucw.cz>
 <87czyf5jjp.fsf@vps.thesusis.net>
 <CAHk-=wjsjC1h7fskwYaaRLykN1ms6ZtxGvucQgmL-zZTfxPdBA@mail.gmail.com>
 <CAKMK7uEGXOC_ci=Drm=Hz+xPGdcoxv8YZ-gcOckoPmu2XijiSA@mail.gmail.com>
 <CAMuHMdVzCjVim4A3eAZzztqUyjb6a2bjmSkgxUnaugQFv42qag@mail.gmail.com>
 <CAKMK7uEwHu5GLF16wn83PLZUjoJWgF0dcLXwsGkt_aBpOgLt+w@mail.gmail.com>
 <CAMuHMdUf3eeK=Fr_pasUdXkk_zuicFBqNY+jSnH6EgUgmG+3hA@mail.gmail.com>
In-Reply-To: <CAMuHMdUf3eeK=Fr_pasUdXkk_zuicFBqNY+jSnH6EgUgmG+3hA@mail.gmail.com>

--GDhN2qL2aB0rrSOiLw5PqylZkoxuD3V1N
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 15.01.21 um 09:06 schrieb Geert Uytterhoeven:
> Hi Daniel,
>=20
> On Thu, Jan 14, 2021 at 5:11 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>> On Thu, Jan 14, 2021 at 4:56 PM Geert Uytterhoeven <geert@linux-m68k.o=
rg> wrote:
>>> On Tue, Jan 12, 2021 at 5:00 PM Daniel Vetter <daniel@ffwll.ch> wrote=
:
>>>> On Sat, Jan 9, 2021 at 12:11 AM Linus Torvalds
>>>> <torvalds@linux-foundation.org> wrote:
>>>>> On Fri, Jan 8, 2021 at 11:13 AM Phillip Susi <phill@thesusis.net> w=
rote:
>>>>>>> Could we pause this madness? Scrollback is still useful. I needed=
 it
>>>>>>> today... it was too small, so command results I was looking for
>>>>>>> already scrolled away, but... life will be really painful with 0
>>>>>>> scrollback.
>>>>>>
>>>>>>> You'll need it, too... as soon as you get oops and will want to s=
ee
>>>>>>> errors just prior to that oops.
>>>>>>
>>>>>>> If it means I get to maintain it... I'm not happy about it but th=
at's
>>>>>>> better than no scrollback.
>>>>>>
>>>>>> Amen!  What self respecting admin installs a gui on servers?  What=
 do we
>>>>>> have to do to get this back in?  What was so buggy with this code =
that
>>>>>> it needed to be removed?  Why was it such a burden to just leave i=
t be?
>>>>>
>>>>> It really was buggy, with security implications. And we have no mai=
ntainers.
>>>>>
>>>>> So the scroll-back code can't come back until we have a maintainer =
and
>>>>> a cleaner and simpler implementation.
>>>>>
>>>>> And no, maintaining it really doesn't mean "just get it back to the=

>>>>> old broken state".
>>>>>
>>>>> So far I haven't actually seen any patches, which means that it's n=
ot
>>>>> coming back.
>>>>>
>>>>> The good news? If you have an actual text VGA console, that should
>>>>> still work just fine.
>>>
>>> IIRC, all of this was written for systems lacking VGA text consoles
>>> in the first place...
>>>
>>>> Also on anything that is remotely modern (i.e. runs a drm kernel
>>>> modesetting driver undearneath the fbdev/fbcon stack) there's a pile=

>>>> more issues on top of just the scrollback/fbcon code being a mess.
>>>
>>> Would it help to remove DRM_FBDEV_EMULATION (instead)?

Of the fbdev code, DRM's fbdev emulation is the cleanest. We now even=20
have test cases for the userspace I/O.

>>
>> It's a problem with the hardware. "Write some registers and done"
>> isn't how display blocks work nowadays. So your proposal amounts to
>> "no fbdev/fbcon for anything modern-ish".
>=20
> With "modern-ish" actually meaning: "desktop/gaming/mobile-style
> 3D-accelerated wide-color display hardware".  There's plenty of display=

> hardware that doesn't fall into that class, and is served by fbdev (als=
o
> out-of-tree due to the moratorium) because of that.

Userspace has been moving away from fbdev. Writing an fbdev driver locks =

you into a legacy userspace. I also found that DRM drivers are smaller,=20
because of all the DRM helper libraries. Using DRM + fbdev emulation is=20
a win in almost any case. We did have some complaints about performance=20
of the emulation. So that might be worth looking into.

Best regards
Thomas

>=20
>> Also I said "a pile more", most of the issues in fbcon/fbdev code
>> apply for all drivers.
>>
>>>> Specifically the locking is somewhere between yolo and outright
>>>> deadlocks. This holds even more so if the use case here is "I want
>>>> scrollback for an oops". There's rough sketches for how it could be
>>>> solved, but it's all very tricky work.
>>>
>>> When an oops happens, all bets are off.  At that point, all informati=
on
>>> you can extract from the system is valuable, and additional locking
>>> issues are moot.
>>
>> Except the first oops then scrolls aways because it's getting buried
>> under further fail. Your locking needs to be minimally good enough to
>> not make the situation worse.
>=20
> When an oops happens, all bets are off...
>=20
> Gr{oetje,eeting}s,
>=20
>                          Geert
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--GDhN2qL2aB0rrSOiLw5PqylZkoxuD3V1N--

--yfezKyx6UTf5mVJ1BQtTrApR6vxn8LUjj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAaWOMFAwAAAAAACgkQlh/E3EQov+Cv
hw//SDOkfXlIrcsAsBu8ZsbwQK8Lq+7RnfJckk3X89r/Zep1wil4Oot0XNNgIe2ZGq8yYTctgvbk
HePIWpAGcwgoMXRqnC2ZqkCTtfzwFCfmN9NrDUqdLWhrGloGhGIae5amB8bt8wOMVLRzC1n8OQTE
kayuQws+rJGWjt5GWUmL7aITrzgiDjIJA5TrQJFbu9B2MSxqn3E78pRbNtMpWKhMkLVGaEoZLNl0
PTlC9qHfz1PZxwJ+d+ZNFTBaWrni+R4OXz4I3NZBsVhH2uLc3zRSzFoux924x66zxxNcypG9120n
iSF6YCRy05aISl+7thtbL+/cQMVEnDR3vMUUKC2tLnZJi0a9ieDWZ08OdHdfl+GKKK3BzYjTxN6f
z8FKGJulkOlW7ezoVITsl0ovsB2URbtbEWGiUDS5sZ2o1QqxOYas0bJr2ErX4xygI5GcZlInzHep
huw+UPJv6OWF5/diHrcz0z3RudON+U7KcaWJ+bx2jeFbt03+MUKbC6ie8+CDGiO/fHL6nMeFLd6s
0DrAGSvcic6YlimNesJNP6KtlnxCQhpx6jo6xHof0vHvINDQiicHE7MTLaC9dcIYB4FzaGGyPaFu
ksWL6k4hHRmM9xr9ageJsZBC3iVsyR8pDNAhggKcmOWPyuej2TblmoyX0MaZDLtA+1jKdpmzrAcJ
zkA=
=h086
-----END PGP SIGNATURE-----

--yfezKyx6UTf5mVJ1BQtTrApR6vxn8LUjj--

--===============1625924500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1625924500==--
