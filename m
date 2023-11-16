Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 460587EE649
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 18:58:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77CBF10E294;
	Thu, 16 Nov 2023 17:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A799610E294
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 17:58:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 666EECE214C;
 Thu, 16 Nov 2023 17:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DFC6C433C7;
 Thu, 16 Nov 2023 17:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700157510;
 bh=NjZTWXhX6tYOsHS9g+R+JRPWbqHvVjLp4SgC77GdIxw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p555UH18g6sDDJjACITrbyiY0nDmXqCmx1ke7jvceBy3ZSFpDYGLMA7RFLY/WVZfj
 BTmGw38amtDapGnFvHtmKE3jk6/LBsO+spr61d6XCUpxnYdQn/hca+kWeoK6w+uqY8
 hVv/rcB8ICh+2iD1vUmjLaVFUJiNcsESGYgOy3qNn0xnfn6jsgfR3YfQ5Q6RW+e3EL
 3VY3cxr0kD/XBBC1V24C0ezHYqAJZlj22/e1UgOQJEAkKLYGRZag7xXq6oBrUoURfw
 wEXclue7LPHJqgFECBuZgwJ/rBvWsfcmY0bNtuAmAIinkpx14XebNgx4B8Wd6ugj6Z
 IN+eOa0FtVYgQ==
Date: Thu, 16 Nov 2023 18:58:27 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v14 4/4] MAINTAINERS: Create entry for Renesas RZ DRM
 drivers
Message-ID: <gqbxdb2un7s2hqttzb4ryhcwpwvsxj244ubaifzpugryioj6bg@6dleflere7oo>
References: <20231116141608.252452-1-biju.das.jz@bp.renesas.com>
 <20231116141608.252452-5-biju.das.jz@bp.renesas.com>
 <eywaoaudaqtrv5ky46ahenapkjwk4tajxdrkuentehezw4ajid@aioncg5rahws>
 <CAMuHMdXZjft3AVEF7cPnhH4pz_2+9U51jnSg-tFJ-ppfi7GTZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xs47cj4uibzuyjcu"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXZjft3AVEF7cPnhH4pz_2+9U51jnSg-tFJ-ppfi7GTZw@mail.gmail.com>
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
Cc: Biju Das <biju.das.au@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xs47cj4uibzuyjcu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 16, 2023 at 05:04:03PM +0100, Geert Uytterhoeven wrote:
> On Thu, Nov 16, 2023 at 4:58=E2=80=AFPM Maxime Ripard <mripard@kernel.org=
> wrote:
> > On Thu, Nov 16, 2023 at 02:16:08PM +0000, Biju Das wrote:
> > > Create entry for Renesas RZ DRM drivers and add my self as a maintain=
er.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.=
com>
> > > ---
> > > v13->v14:
> > >  * Now SHMOBILE has maintainer entries. So dropped updating
> > >    DRM DRIVERS FOR RENESAS RCAR AND SHMOBILE.
> > >  * Updated comment header and description.
> > >  * The above changes are trivial, so kept the Rb tag from Laurent.
>=20
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -7154,6 +7154,14 @@ F:     Documentation/devicetree/bindings/displ=
ay/renesas,shmobile-lcdc.yaml
> > >  F:   drivers/gpu/drm/renesas/shmobile/
> > >  F:   include/linux/platform_data/shmob_drm.h
> > >
> > > +DRM DRIVERS FOR RENESAS RZ
> > > +M:   Biju Das <biju.das.jz@bp.renesas.com>
> > > +L:   dri-devel@lists.freedesktop.org
> > > +L:   linux-renesas-soc@vger.kernel.org
> > > +S:   Maintained
> > > +F:   Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > > +F:   drivers/gpu/drm/renesas/rz-du/
> >
> > Any particular reason you want to opt-out of drm-misc?
>=20
> IIRC, you opted all Renesas drivers out in commit 5a44d50f00725f31
> ("MAINTAINERS: Update drm-misc entry to match all drivers")?

That's not exactly what happened. I excluded it from that list because
rcar-du has never been maintained in drm-misc.

> Probably that should be restricted to drivers/gpu/drm/renesas/rcar-du/?

Sure, either within that patch if there's a new version, or as a follow-up

Maxime

--xs47cj4uibzuyjcu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZVZYQwAKCRDj7w1vZxhR
xWsYAP9UUkc8Nei2d8KODGDqiL1dG2G4LJdfiNGFO4nuDJ/EkAD/aUPdE/HGNi23
OsmdYERv5LFe4hTjpl3UV37vrQYbrg8=
=VH9i
-----END PGP SIGNATURE-----

--xs47cj4uibzuyjcu--
