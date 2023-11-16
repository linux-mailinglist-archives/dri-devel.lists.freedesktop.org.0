Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F027EE4DB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 16:58:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4312210E623;
	Thu, 16 Nov 2023 15:58:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6602710E623
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 15:58:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 54532B81DAB;
 Thu, 16 Nov 2023 15:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36831C433C8;
 Thu, 16 Nov 2023 15:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700150295;
 bh=qjPCYaBA8/IUh3/zH+wJB4HYv8bpOynQzXs9Y1jF654=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a8QDYMBTgArH0HBA/rV4I+Ir63N/bJcJFy5hCdTrQE1h1H0k5njERnhxkpLrdy94H
 W94aBt4Xs+hEEk7AbAfxy4K7s2tPcnNxfmfB6OZdo5p/pGcNxjJyAjGe0mXZzzL88U
 dBuKoNBXLBNIuc9PFcGkcgA6Zj3QdxAeGFgp7idmRSJTG07f8f+Pj89uj/Fr3PEFEt
 QIvBTY7h0Bs4PIgyefcmUHpegM4sCa4271tlrfhBaTnH3M7Bb3MyGkgmAnh5apwBo4
 OO+4SHN4s4hT6p8SQPMQ5WJyIDDb3LjDOx5C3JFabesbT6UAtlUxR/dAw1tmFyLpfx
 qJyiNGkFLVrRQ==
Date: Thu, 16 Nov 2023 16:58:12 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v14 4/4] MAINTAINERS: Create entry for Renesas RZ DRM
 drivers
Message-ID: <eywaoaudaqtrv5ky46ahenapkjwk4tajxdrkuentehezw4ajid@aioncg5rahws>
References: <20231116141608.252452-1-biju.das.jz@bp.renesas.com>
 <20231116141608.252452-5-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hq4btskxfnn24xgh"
Content-Disposition: inline
In-Reply-To: <20231116141608.252452-5-biju.das.jz@bp.renesas.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--hq4btskxfnn24xgh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 16, 2023 at 02:16:08PM +0000, Biju Das wrote:
> Create entry for Renesas RZ DRM drivers and add my self as a maintainer.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> v13->v14:
>  * Now SHMOBILE has maintainer entries. So dropped updating
>    DRM DRIVERS FOR RENESAS RCAR AND SHMOBILE.
>  * Updated comment header and description.
>  * The above changes are trivial, so kept the Rb tag from Laurent.
> v12->v13:
>  * No change.
> v11->v12:
>  * No change.
> v10->v11:
>  * No change.
> v9->v10:
>  * No change.
> v8->v9:
>  * Added Rb tag from Laurent.
>  * Updated entries for common parts(Makefile and Kconfig).
> v8:
>  * New patch
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8a70be8f08ee..d4e21fe54fe0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7154,6 +7154,14 @@ F:	Documentation/devicetree/bindings/display/renes=
as,shmobile-lcdc.yaml
>  F:	drivers/gpu/drm/renesas/shmobile/
>  F:	include/linux/platform_data/shmob_drm.h
> =20
> +DRM DRIVERS FOR RENESAS RZ
> +M:	Biju Das <biju.das.jz@bp.renesas.com>
> +L:	dri-devel@lists.freedesktop.org
> +L:	linux-renesas-soc@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> +F:	drivers/gpu/drm/renesas/rz-du/

Any particular reason you want to opt-out of drm-misc?

Maxime

--hq4btskxfnn24xgh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZVY8FAAKCRDj7w1vZxhR
xbpdAP9/LacrlhGa6pJCGA6gqnkOZC5BCnKotC4dBUiaygTycAD9HpwzTjOXqi/i
jRvrPq8ZUEHdx+AQQEkWDpSSUm9SSwY=
=ZAo4
-----END PGP SIGNATURE-----

--hq4btskxfnn24xgh--
