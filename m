Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AF62C83F7
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 13:15:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD1F6E488;
	Mon, 30 Nov 2020 12:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01DB76E488
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 12:15:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6D32FABD2;
 Mon, 30 Nov 2020 12:15:48 +0000 (UTC)
Subject: Re: [PATCH v2 14/28] video: fbdev: pm2fb: Fix kernel-doc warnings
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-15-sam@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <c20689bd-1d50-0b73-391e-23517d4f280e@suse.de>
Date: Mon, 30 Nov 2020 13:15:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201128224114.1033617-15-sam@ravnborg.org>
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
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
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
Content-Type: multipart/mixed; boundary="===============1139161751=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1139161751==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="rXV1tR4t5jcxNikGkjWXe7xPSIfubEDwM"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rXV1tR4t5jcxNikGkjWXe7xPSIfubEDwM
Content-Type: multipart/mixed; boundary="djqdHyhfJTlFCJrYXDWGppmkRhXNkS1uF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Cc: Aditya Pakki <pakki001@umn.edu>,
 Alexander Klimov <grandmaster@al2klimov.de>,
 Alex Dewar <alex.dewar90@gmail.com>, Antonino Daplas <adaplas@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Evgeny Novikov <novikov@ispras.ru>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 George Kennedy <george.kennedy@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gustavo Silva <gustavoars@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 Jason Yan <yanaijie@huawei.com>, Jingoo Han <jingoohan1@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Joe Perches <joe@perches.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mike Rapoport <rppt@kernel.org>, Nathan Chancellor
 <natechancellor@gmail.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Peter Rosin <peda@axentia.se>, Qilong Zhang <zhangqilong3@huawei.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>, Xiaofei Tan <tanxiaofei@huawei.com>
Message-ID: <c20689bd-1d50-0b73-391e-23517d4f280e@suse.de>
Subject: Re: [PATCH v2 14/28] video: fbdev: pm2fb: Fix kernel-doc warnings
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-15-sam@ravnborg.org>
In-Reply-To: <20201128224114.1033617-15-sam@ravnborg.org>

--djqdHyhfJTlFCJrYXDWGppmkRhXNkS1uF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 28.11.20 um 23:41 schrieb Sam Ravnborg:
> Fixed a few kernel-doc issues to fix the warnings.
>=20
> v2:
>    - Updated subject (Lee)
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Lee Jones <lee.jones@linaro.org>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/video/fbdev/pm2fb.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/pm2fb.c b/drivers/video/fbdev/pm2fb.c
> index 27893fa139b0..c68725eebee3 100644
> --- a/drivers/video/fbdev/pm2fb.c
> +++ b/drivers/video/fbdev/pm2fb.c
> @@ -1508,8 +1508,8 @@ static const struct fb_ops pm2fb_ops =3D {
>    *
>    * Initialise and allocate resource for PCI device.
>    *
> - * @param	pdev	PCI device.
> - * @param	id	PCI device ID.
> + * @pdev:	PCI device.
> + * @id:		PCI device ID.
>    */
>   static int pm2fb_probe(struct pci_dev *pdev, const struct pci_device_=
id *id)
>   {
> @@ -1715,7 +1715,7 @@ static int pm2fb_probe(struct pci_dev *pdev, cons=
t struct pci_device_id *id)
>    *
>    * Release all device resources.
>    *
> - * @param	pdev	PCI device to clean up.
> + * @pdev:	PCI device to clean up.
>    */
>   static void pm2fb_remove(struct pci_dev *pdev)
>   {
> @@ -1756,7 +1756,7 @@ MODULE_DEVICE_TABLE(pci, pm2fb_id_table);
>  =20
>  =20
>   #ifndef MODULE
> -/**
> +/*
>    * Parse user specified options.
>    *
>    * This is, comma-separated options following `video=3Dpm2fb:'.
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--djqdHyhfJTlFCJrYXDWGppmkRhXNkS1uF--

--rXV1tR4t5jcxNikGkjWXe7xPSIfubEDwM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/E4nIFAwAAAAAACgkQlh/E3EQov+Da
xQ//bG5OLZ0L9wVGogQBOOCf0f8OB2Yue9GKDtXxfHaUyfcbr8GDC2sJQ+fx+WLG4tColsVO/z0q
xHij0Y/sSiQA+Yumeg9qyMHZlnU/33VP3+9gD+0439s1lG24338fjuZaGXyhf/v2+vhHWGVgTSuN
PFV/bdgwG4fgFiWg2JTublif/5e+51lcl/KNltzUkFXwn04i5yrMLGe79h4/jJWVKY0aBzzhmtOZ
2KEY4/ffBbkJk6JS/jSbdALo0NH0lC2rtOUXHjK7XMMDSmuT6Zn96cdVPwWVfy/9pdPzZf9gjq6U
cVTFOU9TPaTOnlDXJGPDo0vxESbnvQv7deVtqAWsHQdL6ocWYsm5zYi3WmtVK2YI4FOq4FRQCEdO
iD70I40Nq/I5sFr/Twk52eVQ1lcemP13gAY2+IjQVdj4lyo/NsVRh3hK/nJA2N69LIuwhPXcG2Tn
vKS3dg00aA0RCxegoOy+gfMvLRZWiAPc9EIsUA0o+9f3VQhGT6KwRGhCsOBdUV9/MaQvOOjApt+F
vBK0WybdvL9y1+spvDIXCMedXask1wkfjXhJICFDpSYReReFdbnbxX+hXbTkEVqpOXpZfX0KT9Tv
P7L6lP4+oSWeUE95UWz7NyOsB1oxWLtFbIFwQMTSfIyoYpJrzsSl9+dL1YS9e3CgLF2L3T8MlF6d
JoY=
=IOD4
-----END PGP SIGNATURE-----

--rXV1tR4t5jcxNikGkjWXe7xPSIfubEDwM--

--===============1139161751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1139161751==--
