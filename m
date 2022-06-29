Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D96CB560100
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 15:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A512F10ECE9;
	Wed, 29 Jun 2022 13:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5DE10ECE9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 13:11:18 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id CA9FA1C0BCC; Wed, 29 Jun 2022 15:03:33 +0200 (CEST)
Date: Wed, 29 Jun 2022 15:03:33 +0200
From: Pavel Machek <pavel@denx.de>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 4.9 05/13] video: fbdev: skeletonfb: Fix syntax
 errors in comments
Message-ID: <20220629130333.GC13395@duo.ucw.cz>
References: <20220628022657.597208-1-sashal@kernel.org>
 <20220628022657.597208-5-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="IpbVkmxF4tDyP/Kb"
Content-Disposition: inline
In-Reply-To: <20220628022657.597208-5-sashal@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-fbdev@vger.kernel.org, Xiang wangx <wangxiang@cdjrlc.com>,
 daniel.vetter@ffwll.ch, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, geert@linux-m68k.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, bhelgaas@google.com,
 cssk@net-c.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--IpbVkmxF4tDyP/Kb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Xiang wangx <wangxiang@cdjrlc.com>
>=20
> [ Upstream commit fc378794a2f7a19cf26010dc33b89ba608d4c70f ]
>=20
> Delete the redundant word 'its'.

Calling typo in comment "syntax error" is ... interesting. Anyway, we
don't need this in stable.

Best regards,
								Pavel

> +++ b/drivers/video/fbdev/skeletonfb.c
> @@ -96,7 +96,7 @@ static struct fb_fix_screeninfo xxxfb_fix =3D {
> =20
>      /*
>       * 	Modern graphical hardware not only supports pipelines but some=
=20
> -     *  also support multiple monitors where each display can have its =
=20
> +     *  also support multiple monitors where each display can have
>       *  its own unique data. In this case each display could be =20
>       *  represented by a separate framebuffer device thus a separate=20
>       *  struct fb_info. Now the struct xxx_par represents the graphics
> --=20
> 2.35.1

--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--IpbVkmxF4tDyP/Kb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYrxNpQAKCRAw5/Bqldv6
8gI/AJwOATMguvVavkA6qthRvcBNeklk7gCgrMYEh/s4HDh+efnrHln00b0Oi7E=
=GTfr
-----END PGP SIGNATURE-----

--IpbVkmxF4tDyP/Kb--
