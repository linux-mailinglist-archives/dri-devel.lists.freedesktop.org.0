Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD272D0BA9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:21:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67AD789E8C;
	Mon,  7 Dec 2020 08:21:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692B289E8C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 08:21:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E88DCAC90;
 Mon,  7 Dec 2020 08:21:38 +0000 (UTC)
Subject: Re: [PATCH v3 06/13] video: fbdev: sparc drivers: fix kernel-doc
 warnings for blank_mode
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
References: <20201206190247.1861316-1-sam@ravnborg.org>
 <20201206190247.1861316-7-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <6efe8d54-05a0-f013-e927-441660251dbb@suse.de>
Date: Mon, 7 Dec 2020 09:21:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201206190247.1861316-7-sam@ravnborg.org>
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
Cc: Rich Felker <dalias@libc.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Gustavo A R Silva <gustavoars@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Peter Jones <pjones@redhat.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Ellerman <mpe@ellerman.id.au>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 linux-arm-kernel@lists.infradead.org, Qilong Zhang <zhangqilong3@huawei.com>,
 Randy Dunlap <rdunlap@infradead.org>, Douglas Anderson <dianders@chromium.org>,
 Tony Prisk <linux@prisktech.co.nz>, Thierry Reding <thierry.reding@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: multipart/mixed; boundary="===============0281393199=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0281393199==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="1LKf2HwVRYrHtBJAwraoNECvP0pH4WHlh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1LKf2HwVRYrHtBJAwraoNECvP0pH4WHlh
Content-Type: multipart/mixed; boundary="lGJdGHWHP6Fdpj3ZKybeVbw69TCvLMtca";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Cc: Alexander Klimov <grandmaster@al2klimov.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Colin Ian King <colin.king@canonical.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Douglas Anderson <dianders@chromium.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Gustavo A R Silva <gustavoars@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-arm-kernel@lists.infradead.org, Michael Ellerman <mpe@ellerman.id.au>,
 Mike Rapoport <rppt@kernel.org>, Peter Jones <pjones@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Qilong Zhang
 <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Rich Felker <dalias@libc.org>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Tony Prisk <linux@prisktech.co.nz>
Message-ID: <6efe8d54-05a0-f013-e927-441660251dbb@suse.de>
Subject: Re: [PATCH v3 06/13] video: fbdev: sparc drivers: fix kernel-doc
 warnings for blank_mode
References: <20201206190247.1861316-1-sam@ravnborg.org>
 <20201206190247.1861316-7-sam@ravnborg.org>
In-Reply-To: <20201206190247.1861316-7-sam@ravnborg.org>

--lGJdGHWHP6Fdpj3ZKybeVbw69TCvLMtca
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 06.12.20 um 20:02 schrieb Sam Ravnborg:
> Fix kernel-doc warnings caused by a wrong parameter name
> blank_mode =3D> blank
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/video/fbdev/bw2.c   | 2 +-
>   drivers/video/fbdev/cg3.c   | 2 +-
>   drivers/video/fbdev/cg6.c   | 2 +-
>   drivers/video/fbdev/ffb.c   | 2 +-
>   drivers/video/fbdev/leo.c   | 2 +-
>   drivers/video/fbdev/p9100.c | 2 +-
>   drivers/video/fbdev/tcx.c   | 2 +-
>   7 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/bw2.c b/drivers/video/fbdev/bw2.c
> index 0d9a6bb57a09..e7702fe1fe7d 100644
> --- a/drivers/video/fbdev/bw2.c
> +++ b/drivers/video/fbdev/bw2.c
> @@ -116,7 +116,7 @@ struct bw2_par {
>  =20
>   /**
>    *      bw2_blank - Optional function.  Blanks the display.
> - *      @blank_mode: the blank mode we want.
> + *      @blank: the blank mode we want.
>    *      @info: frame buffer structure that represents a single frame =
buffer
>    */
>   static int
> diff --git a/drivers/video/fbdev/cg3.c b/drivers/video/fbdev/cg3.c
> index 77f6470ce665..bdcc3f6ab666 100644
> --- a/drivers/video/fbdev/cg3.c
> +++ b/drivers/video/fbdev/cg3.c
> @@ -179,7 +179,7 @@ static int cg3_setcolreg(unsigned regno,
>  =20
>   /**
>    *      cg3_blank - Optional function.  Blanks the display.
> - *      @blank_mode: the blank mode we want.
> + *      @blank: the blank mode we want.
>    *      @info: frame buffer structure that represents a single frame =
buffer
>    */
>   static int cg3_blank(int blank, struct fb_info *info)
> diff --git a/drivers/video/fbdev/cg6.c b/drivers/video/fbdev/cg6.c
> index a1c68cd48d7e..97ef43c25974 100644
> --- a/drivers/video/fbdev/cg6.c
> +++ b/drivers/video/fbdev/cg6.c
> @@ -511,7 +511,7 @@ static int cg6_setcolreg(unsigned regno,
>   /**
>    *	cg6_blank - Blanks the display.
>    *
> - *	@blank_mode: the blank mode we want.
> + *	@blank: the blank mode we want.
>    *	@info: frame buffer structure that represents a single frame buffe=
r
>    */
>   static int cg6_blank(int blank, struct fb_info *info)
> diff --git a/drivers/video/fbdev/ffb.c b/drivers/video/fbdev/ffb.c
> index 948b73184433..b3d580e57221 100644
> --- a/drivers/video/fbdev/ffb.c
> +++ b/drivers/video/fbdev/ffb.c
> @@ -667,7 +667,7 @@ static int ffb_setcolreg(unsigned regno,
>  =20
>   /**
>    *	ffb_blank - Optional function.  Blanks the display.
> - *	@blank_mode: the blank mode we want.
> + *	@blank: the blank mode we want.
>    *	@info: frame buffer structure that represents a single frame buffe=
r
>    */
>   static int ffb_blank(int blank, struct fb_info *info)
> diff --git a/drivers/video/fbdev/leo.c b/drivers/video/fbdev/leo.c
> index 40b11cce0ad6..3eb0f3583f4f 100644
> --- a/drivers/video/fbdev/leo.c
> +++ b/drivers/video/fbdev/leo.c
> @@ -308,7 +308,7 @@ static int leo_setcolreg(unsigned regno,
>  =20
>   /**
>    *      leo_blank - Optional function.  Blanks the display.
> - *      @blank_mode: the blank mode we want.
> + *      @blank: the blank mode we want.
>    *      @info: frame buffer structure that represents a single frame =
buffer
>    */
>   static int leo_blank(int blank, struct fb_info *info)
> diff --git a/drivers/video/fbdev/p9100.c b/drivers/video/fbdev/p9100.c
> index 6da672e92643..4e88a0a195ad 100644
> --- a/drivers/video/fbdev/p9100.c
> +++ b/drivers/video/fbdev/p9100.c
> @@ -175,7 +175,7 @@ static int p9100_setcolreg(unsigned regno,
>  =20
>   /**
>    *      p9100_blank - Optional function.  Blanks the display.
> - *      @blank_mode: the blank mode we want.
> + *      @blank: the blank mode we want.
>    *      @info: frame buffer structure that represents a single frame =
buffer
>    */
>   static int
> diff --git a/drivers/video/fbdev/tcx.c b/drivers/video/fbdev/tcx.c
> index 34b2e5b6e84a..1638a40fed22 100644
> --- a/drivers/video/fbdev/tcx.c
> +++ b/drivers/video/fbdev/tcx.c
> @@ -196,7 +196,7 @@ static int tcx_setcolreg(unsigned regno,
>  =20
>   /**
>    *      tcx_blank - Optional function.  Blanks the display.
> - *      @blank_mode: the blank mode we want.
> + *      @blank: the blank mode we want.
>    *      @info: frame buffer structure that represents a single frame =
buffer
>    */
>   static int
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--lGJdGHWHP6Fdpj3ZKybeVbw69TCvLMtca--

--1LKf2HwVRYrHtBJAwraoNECvP0pH4WHlh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/N5hAFAwAAAAAACgkQlh/E3EQov+Ct
uxAAmakIlON3jq/3ppsDSLDZAawoEmph9GNUMalVcXk7Mj3w2ecbMonCKKTcbduqKQ5mrooqIe9O
zuarqStn1g1ITa46F7typpZS0Q75KdYno8U4Ywgj5qaT3XKS3ddv6k4kyk4vIR9uPul2HvKpjXaj
2J/OAmzIH0CC22kLvhwOMugQCQNzl84KBuM8h5Tfi501Yfc7XY6m4zr5fdTg67LK5SxKPZ3XBSGc
QCn41T0eRA2NVH67ZD0X39r7+BFKiFTqFHKrLH1FU8NfwVAyZMFYFWTtM6XO4utv9Co6F/CrSHkZ
N5pHBi0pZ8JepE81YvX/UX9VlGnPAmamkcYakFiOSiTLPKeyVXQd6CN3SVSTn6cafFZBt0DfD6Ni
+AmimYRu3M2gSu1fOaos2pcEp/8UV3UxNW+FFgyF0o20ajlpfUJpIjwgE1Q9LxJ8NyjwilFGeMeF
80pMdoxWDkmXv7rf6bE8TkBInPLDRgm1zBKjGtWuuf6c6N5hOcbYlFQL2Snt9EMBVXclcGNVXhtO
fXGvaI0DtaU9IEzi5SrJxNzQ5sGlA6ykaXxXKZrkAOG5Zk/h+/77uye0+t1npKOuA1N19EQqL0C2
PSux61PtTpydsqg1y3dbnsQZRj/cHozVVAOm1gil6LTekeRWQ35fcGaNARLhPVRtA1n8DuK6hGp0
xWk=
=WxgV
-----END PGP SIGNATURE-----

--1LKf2HwVRYrHtBJAwraoNECvP0pH4WHlh--

--===============0281393199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0281393199==--
