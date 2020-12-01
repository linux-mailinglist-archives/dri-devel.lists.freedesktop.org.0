Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D95E2CA574
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 15:23:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B400F6E546;
	Tue,  1 Dec 2020 14:23:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398126E546
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 14:23:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B1D85ACF9;
 Tue,  1 Dec 2020 14:23:34 +0000 (UTC)
Subject: Re: [PATCH v2 28/28] video: fbdev: s1d13xxxfb: Fix kernel-doc and set
 but not used warnings
To: Sam Ravnborg <sam@ravnborg.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-29-sam@ravnborg.org>
 <18caca15-a6e7-cb4b-3028-c010922bda80@suse.de>
 <20201129215257.GD1162850@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <a32b8eee-320c-41d1-0dbc-da808a8013bb@suse.de>
Date: Tue, 1 Dec 2020 15:23:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201129215257.GD1162850@ravnborg.org>
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
Cc: linux-fbdev@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee.jones@linaro.org>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>, Jiri Slaby <jirislaby@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>, Peter Rosin <peda@axentia.se>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: multipart/mixed; boundary="===============0276028832=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0276028832==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="uC4n5puZvzGbl5J1Nts9KjlVbVlSY3yhK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uC4n5puZvzGbl5J1Nts9KjlVbVlSY3yhK
Content-Type: multipart/mixed; boundary="i13jButsR3WrwqSFoHvTEMrYN0qQqZ16D";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-fbdev@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>, Lee Jones <lee.jones@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap
 <rdunlap@infradead.org>, Gustavo Silva <gustavoars@kernel.org>,
 Peilin Ye <yepeilin.cs@gmail.com>, George Kennedy
 <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>,
 Jingoo Han <jingoohan1@gmail.com>, Joe Perches <joe@perches.com>,
 Peter Rosin <peda@axentia.se>, Mike Rapoport <rppt@kernel.org>
Message-ID: <a32b8eee-320c-41d1-0dbc-da808a8013bb@suse.de>
Subject: Re: [PATCH v2 28/28] video: fbdev: s1d13xxxfb: Fix kernel-doc and set
 but not used warnings
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-29-sam@ravnborg.org>
 <18caca15-a6e7-cb4b-3028-c010922bda80@suse.de>
 <20201129215257.GD1162850@ravnborg.org>
In-Reply-To: <20201129215257.GD1162850@ravnborg.org>

--i13jButsR3WrwqSFoHvTEMrYN0qQqZ16D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Sam

Am 29.11.20 um 22:52 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
> On Sun, Nov 29, 2020 at 10:59:22AM +0100, Thomas Zimmermann wrote:
>>
>>
>> Am 28.11.20 um 23:41 schrieb Sam Ravnborg:
>>> Fix following W=3D1 warnings:
>>> - Fix set but not nused variables which was used only for logging.
>>
>> s/nused/used
>>
>> s/which was/that were
>>
>> Otherwise
>>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> Fixed and applied to drm-misc-next.
>=20
> Thanks for the a-b's and r-b. Are you up to take a look at the remainin=
g
> 24 patches? It is all simple patches so should be doable in limited tim=
e.

I think I had a question on one or two of them. If I forgot a patch,=20
just put it into the next iteration and I'll take a look.

Best regards
Thomas

>=20
> 	Sam
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


--i13jButsR3WrwqSFoHvTEMrYN0qQqZ16D--

--uC4n5puZvzGbl5J1Nts9KjlVbVlSY3yhK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/GUeQFAwAAAAAACgkQlh/E3EQov+C8
mRAAgKTI4hQAij/Gj2k3EHUj64BVkyckIi1SeSKAJuebffndhajDKU2Vg5pXdJ2pG7f/tfn8e1a/
WVZNpky4fFhl4xfIjBqZ3wQFk5lsT+1BYN4MDMd9MA9LG+8QrxyBXdr5pqi99Uh43YYtvNfc4E/X
C0J8BbU2HkqHwZ0sfmgkT/Z4kjpHn8sD1S3uN3FJHzYsgXpxxKhtfOsugvoC8I6IAVRG8I01Tcqf
xkU/SneEO0sP8+sE+AHpNV3Ad4hkV0nsctf2FqAy9ouxBGxxa6edTyd9m6IRNjD7jMp0d6bnBjC7
On6YRPWHs77v+oXkgvJZdl5FONG2JZFc3wpRbjz8Ujwg2KBUWfMwscDaSmvIS+eZE5ce368LHkmn
RAw2ZblrCgjMQvK5yi9Q9wkmmAIidof20kxMoGRShUiFGpW7VSweb7Grl6e2F6hw+6sHI1G0a01L
wny40TdLfQnQyNo7ZjhcBx+6OToK65qk9zGwbDkEiwSDdykch4X3Py6Y3/lwAdYBvDLxfpuuOjyh
DsgnWy/UC6stb4j9vQjE3liWxJ3AdsX0FX40rzYOUYxGL8COIE9YBBg+bojXCbflmwGmopXXy70h
C9F9hU0p2mpuWXSjyJey1+42FTTHYtICph9NWdBVKUKqNASV/nOSh0bKbkXh4twTQrPNCTHvqfJD
A6c=
=Cck6
-----END PGP SIGNATURE-----

--uC4n5puZvzGbl5J1Nts9KjlVbVlSY3yhK--

--===============0276028832==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0276028832==--
