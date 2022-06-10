Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D488D546E6C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 22:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D02113B60;
	Fri, 10 Jun 2022 20:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2116 seconds by postgrey-1.36 at gabe;
 Fri, 10 Jun 2022 20:28:09 UTC
Received: from 5.mo561.mail-out.ovh.net (5.mo561.mail-out.ovh.net
 [87.98.178.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251E7113B60
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 20:28:09 +0000 (UTC)
Received: from player787.ha.ovh.net (unknown [10.109.146.132])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 7223723602
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 19:52:51 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
 (Authenticated sender: steve@sk2.org)
 by player787.ha.ovh.net (Postfix) with ESMTPSA id C17712BA6FB0A;
 Fri, 10 Jun 2022 19:52:43 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R00590c0b8eb-a28d-41b2-a5b9-2a9d9c025f35,
 3EA6D779A65D7DCBA15D92F127CD72011C01B2E3) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
Date: Fri, 10 Jun 2022 21:52:36 +0200
From: Stephen Kitt <steve@sk2.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 2/3] drm/panel: panel-dsi-cm: Use backlight helpers
Message-ID: <20220610215236.0d5d47b7@heffalump.sk2.org>
In-Reply-To: <YqObYPttYuRDikrO@ravnborg.org>
References: <20220607182026.1121992-1-steve@sk2.org>
 <20220607182026.1121992-3-steve@sk2.org>
 <20220609215236.ojxw6l2vkf652hgu@mercury.elektranox.org>
 <20220610194720.485cf7be@heffalump.sk2.org>
 <YqObYPttYuRDikrO@ravnborg.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/h3C.i8DgeSuOC0V+IcexQeD";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Ovh-Tracer-Id: 11606620668290696838
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudegtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhfogggtsehgtderreertdejnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeeiheevvdeugeejffefteffvefhieegjeevhfekjeejvdelgfefkeehhfdufffhjeenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejkeejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdfovfetjfhoshhtpehmohehiedu
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
Cc: David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/h3C.i8DgeSuOC0V+IcexQeD
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 10 Jun 2022 21:28:32 +0200, Sam Ravnborg <sam@ravnborg.org> wrote:
> Hi Stephen.
> On Fri, Jun 10, 2022 at 07:47:20PM +0200, Stephen Kitt wrote:
> > Hi Sebastian,
> >=20
> > On Thu, 9 Jun 2022 23:52:36 +0200, Sebastian Reichel
> > <sebastian.reichel@collabora.com> wrote: =20
> > > On Tue, Jun 07, 2022 at 08:20:25PM +0200, Stephen Kitt wrote: =20
> > > > diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c
> > > > b/drivers/gpu/drm/panel/panel-dsi-cm.c index
> > > > b58cb064975f..aa36dc6cedd3 100644 ---
> > > > a/drivers/gpu/drm/panel/panel-dsi-cm.c +++
> > > > b/drivers/gpu/drm/panel/panel-dsi-cm.c @@ -86,16 +86,10 @@ static
> > > > void dsicm_bl_power(struct panel_drv_data *ddata, bool enable) retu=
rn;
> > > > =20
> > > >  	if (enable) {
> > > > -		backlight->props.fb_blank =3D FB_BLANK_UNBLANK;
> > > > -		backlight->props.state =3D ~(BL_CORE_FBBLANK |
> > > > BL_CORE_SUSPENDED);
> > > > -		backlight->props.power =3D FB_BLANK_UNBLANK;
> > > > +		backlight_enable(backlight);
> > > >  	} else {
> > > > -		backlight->props.fb_blank =3D FB_BLANK_NORMAL;
> > > > -		backlight->props.power =3D FB_BLANK_POWERDOWN;
> > > > -		backlight->props.state |=3D BL_CORE_FBBLANK |
> > > > BL_CORE_SUSPENDED;
> > > > +		backlight_disable(backlight);
> > > >  	}   =20
> > >=20
> > > The brackets can be removed now. Otherwise: =20
> >  =20
> > >=20
> > > Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com> =20
> >=20
> > Thanks, I=E2=80=99ll wait a little more to see if there are any other r=
eviews of
> > the patches and then push a v2 with that fix. =20
> It would be very nice if you could kill all uses of FB_BLANK in the
> drivers/gpu/drm/panel/* drivers, and post them as one series.
> This is long overdue to introduce the backlight helpers.
>=20
> The three you posted is already a nice step forward, and there may be
> more panel drivers I have missed.

With this series on top of 5.19-rc1, the only remaining .fb_blank reference=
 is
in acx565akm_backlight_init() in panel-sony-acx565akm.c; I was planning on
nuking that along with the other .fb_blank initialisers in a series removing
.fb_blank entirely from backlight_properties. I=E2=80=99ll add it as a four=
th patch
for drm/panel if that makes things easier!

There will still be references to FB_BLANK constants since they=E2=80=99re =
used for
backlight_properties.power values. Would it make sense to rename those?

Regards,

Stephen

--Sig_/h3C.i8DgeSuOC0V+IcexQeD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEnPVX/hPLkMoq7x0ggNMC9Yhtg5wFAmKjoQQACgkQgNMC9Yht
g5w1wA/+LN0+/CDVxZV49N+eebrd08Wh2wSZNW/GHE4YOp6TbzDidFX2NCp7PDG3
huw6ptYSS5zwufLv/oLE4HlshS6+5fVyvZyungOSpwfto4Ay5KR211xsCbxpdFk/
QDNRR6pn81hWzRxmdLle79HO1oWx1f2k1rVGSIYwt5LyxImdn3qS3CmNxYTR8ful
H8Yu2CJ+udrhSxflQW74mpYzVTs7elnXL5MIhJ9noG1QJ9Ymn2fFth33sHNd6sWV
S/SR0K1UUobBXVP37CyjldxTdxGYiu50kKrdiBEecp9RmE9fM3Gayzqep62mtBX4
0SZncfWuiR5rB/+nvXgpvrjl+4Acas1lgfr+YwyXGnXNINUWcQBhZBPXx45dcFPP
dosuSR+mkegJTcWjJgDarBAHNuYZfQ+3q0IB+M33D+oAkcgFhDZrgKJSK7peVi8n
3i32dooNuMa6ljSStEkVW1N6ixNI2uhBcUydD3aB4SiDDGgfc5C1wTMTaVEFbkqT
CUOZ1uTauftmBUyVIOEQ8Zij0p9+6AznP1kXfAA/qRm+xg1NDdkBo0198ToPnCDz
Y5ykpmQ8wdj9IH/xlAwXNEdX1NtyuLPbx/GnpLx7m5g6m+f77DueJcXQhzz4WMDd
Cy9/Jm5zVEw49ziokdLjhgYGx+qnQLm2hx+F/fzZAjF8fLDtzKg=
=qbaU
-----END PGP SIGNATURE-----

--Sig_/h3C.i8DgeSuOC0V+IcexQeD--
