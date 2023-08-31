Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB0478E6BA
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 08:45:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525B910E035;
	Thu, 31 Aug 2023 06:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D8810E035
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 06:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=s31663417; t=1693464307; x=1694069107; i=j.neuschaefer@gmx.net;
 bh=YDHe3ibS11T8nF3ocTf88X/4bPZZBo6JF9SStUra4Hk=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=XCOMPC1MpBOMv8M2zn1iMjS2CmeCDIpP63q2qWrn28+/VkJweCrEJZh0X/JeDcyeHp+fvdG
 HqDDMhpZl4cNBoFAMPGcDQ/2k2mUWKhyl02ZjCNzLEofVmousCx1vMBvtJUJFnmDGtPwbCRE1
 UVuuZcuoLfyWA9N9PM+ilTbhc9FFveJPQ2VLNFf8NM4oSP0K1G8q2UqUPT1w4ciinHXVbKUC8
 e7dltqU3rvdRJCjWnPYCpWryydhcxvCj6WbwkzNjd2L8k1flJIgJl0tE9l70saX1RIa5oD6Y4
 hA0PNSjM67PRlSDYoefqjHJ7rK+GWEd2Pu8SyEn7keXzgSvn1Evw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([87.154.222.166]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MORAa-1qJVVd01p0-00Pu9d; Thu, 31
 Aug 2023 08:45:07 +0200
Date: Thu, 31 Aug 2023 08:44:59 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] fbdev: Update fbdev source file paths
Message-ID: <ZPA26xdbTRdfuveS@probook>
References: <20230829200253.1473891-1-j.neuschaefer@gmx.net>
 <d9a02d20-8b59-cbdd-d054-eac14f9771d2@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="61gvMeB4klPZ0LE6"
Content-Disposition: inline
In-Reply-To: <d9a02d20-8b59-cbdd-d054-eac14f9771d2@suse.de>
X-Provags-ID: V03:K1:YN6hA2pipnB/LXgD3D6FB3XD/XV2ApQtg1Gl2emx7q4JFOmIzo2
 ob6XmirzZ/fR7rpCb7VKiemUi3sjoUP5J4M/1OFZSTKXGqdx5skiQP2Ts6rdOZ8lxkWwllS
 P/V9TsrAy02cBPEhq4Cfi7kJ8aKuiH+tnX1a+e1ryYyi6rw9sofshSPHRS4lbuH1epJ5tD2
 KGBxW2jq/hjoazWPS3WmQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7uYDAgx4GK0=;fnI+DBYs1JXOUhRWd/YF0tyANGA
 BAtZAGKZujgbDymtxmVeZXIMkjS+tUTMV3C9CoBxKnj8hNN3s6f1qjv0dWHvS0JbpKd4G2Rdk
 h5olINI+fmdRlq1NP3FPu7W/Nus+ZI1WXEzazcni3AwGi3QWVmrBY1hxcNWXO/MoRru9CfeGg
 eks9SHMXWGKhkAVHPFEsvJJ1VMKqYxa5/KJaId5pp4tpm1aCs2M8/EWm+KfyG7G715Hht4T4k
 0U/v4RW7sYLGwQEnedchwvhcAgOmlG6iukPD5EcUEt20XRat8jlXzGVdd9VQ8gsS1LGYSALrD
 BvzqNS5z/6dbGlyr8EIU9ivAeupQ6oD1ySlgBZzrlhbf3Qc6ATTsq2bM3OyIWvmEyeUpm1ean
 d3kMnW6n+oiDE9xRXaNKUcrqEobfJOZeEtlBxl+pv0qncQ06sXkUIM0ae1yNRot+FxPVpG4y0
 HwlEJcX6CNvzQe+eIUbQoiUpgRDWqcHQnu5Gli+DXXr6awFEj+ugsrlZ0GWc9dWPmYMFNgMPW
 ufcYxecjhq84V98glT/5KQTHWWMB+A3ZSPaibt1uzpWxo0LpmQjdumbAyLjjhcWddJH4pQmcT
 X15dACKBDFU21dhiHI+QsfE4lCMpaYpufHtfmfnn9x3jx4b2CXTJcElo+udWJhWsHOc3sYjl3
 JcPmgfkU9LFN2PR1lqmOI+unmxjqOPyyuu8bb0R7JP9sMwsF+dvW9Q7b++pa10sBNFDlNWOo8
 5X9WyPzseAkeHoxJt3v9MUBoiENJXFjLA66gva40SxutSTCOVMc5KDeLHlUB4tjZqjX/tbNQ9
 pUCShdedl674G7VdJ+4+2UIn70kIAym6j02E+URqRNBC5s/DaJxlDJRavGFLG0OXhz15meXgt
 Amryy/D94Tutpg/U5rctl77LyPQllS/9PnM8dLtEhUJqUMdo09NAP6wcZUe0omHISxQM8PZd4
 G8dc+/ESUwBI5G0gjUfSx5bFlio=
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Jingoo Han <jg1.han@samsung.com>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--61gvMeB4klPZ0LE6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 30, 2023 at 09:10:26AM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 29.08.23 um 22:02 schrieb Jonathan Neusch=C3=A4fer:
> > The files fbmem.c, fb_defio.c, fbsysfs.c, fbmon.c, modedb.c, and
> > fbcmap.c were moved to drivers/video/fbdev, and subsequently to
> > drivers/video/fbdev/core, in the commits listed below.
> >=20
> > Reported by kalekale in #kernel (Libera IRC).
> >=20
> > Fixes: f7018c213502 ("video: move fbdev to drivers/video/fbdev")
> > Fixes: 19757fc8432a ("fbdev: move fbdev core files to separate director=
y")
> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
>=20
> IMHO these comments might just be removed.

I think it's nice to have some sort of visual separation between groups
of functions in fb.h, which these comments provide at the moment.
Therefore I'm currently leaning towards my patch as it is, but I'm
willing to have my mind changed and do a v2 which just removes the
comments.


Thanks

>=20
> Best regards
> Thomas
>=20
> > ---
> >   include/linux/fb.h | 12 ++++++------
> >   1 file changed, 6 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/include/linux/fb.h b/include/linux/fb.h
> > index ce7d588edc3e6..3cda5b9f2469b 100644
> > --- a/include/linux/fb.h
> > +++ b/include/linux/fb.h
> > @@ -592,7 +592,7 @@ extern ssize_t fb_sys_write(struct fb_info *info, c=
onst char __user *buf,
> >   	__FB_DEFAULT_SYS_OPS_DRAW, \
> >   	__FB_DEFAULT_SYS_OPS_MMAP
> >=20
> > -/* drivers/video/fbmem.c */
> > +/* drivers/video/fbdev/core/fbmem.c */
> >   extern int register_framebuffer(struct fb_info *fb_info);
> >   extern void unregister_framebuffer(struct fb_info *fb_info);
> >   extern int fb_prepare_logo(struct fb_info *fb_info, int rotate);

--61gvMeB4klPZ0LE6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmTwNsIACgkQCDBEmo7z
X9tvbRAAsO2oUGtTVNk9irtcdEBvhsF/pwPMV+PMmjLZl6u7R0ANKB62mvrX57rJ
uT2lHBORu4DG6pL89TEJjv6nvVXbiz2bC7g7/Ej07U6ebSgFJ2MBcCUfp9IcLmF3
YLNfIYBrXg9dzOJFt2SbgsxZ/07pDKUbj59lroPdiVcMwZTfm7Rm4nPCJaCzuqPr
HBZgtVhkIZHifdyElC1Ccat3QNAyYzJ+5R45mV/Nah34JBmZk10dCtmwRYuQ8dXs
ci3EI8eHZiFf5mvR7Hc6hED5PgsMpKwbI+MJxLz3+N2Z9DL2cFvGn+Z35SCrS2ed
IycjY9mKlOwm3zhUHDOvGHhAiDvIXFHlIWSNe0ARhTqvvI+DFdy1MdmLk46hbeWg
utlsA9Iyi8wt3UhWShNWga5FyJVgV78yXEcNHC8ER2TGps2XcSblktgANyVYsWS+
KvlaPRZ4xE0T3aoeHcjfxSKEdPBv1r6nbuOqq7DGmVM2U2nTZWA4bhndiCyCaoo6
2JZkx7z2MLoCx96gnM479FBqiEutZ5N9PvBvKmSOB0leem0XfxpjwN1TAR54Ge7f
66BJ+6KQokqa7XqL0hzJUROjCPseIVxH+3VvvyEo9jKkvPyjyshqMVp6gH1B0tAA
KStDEv5oAu26Oqa6glA7IvNZlY2T6BAL3ZiGEzcEQKmosdZWmn8=
=I5hY
-----END PGP SIGNATURE-----

--61gvMeB4klPZ0LE6--
