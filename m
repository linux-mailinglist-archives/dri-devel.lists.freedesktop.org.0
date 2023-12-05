Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B832D804AC7
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 07:58:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8544B10E169;
	Tue,  5 Dec 2023 06:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A218A10E169
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 06:58:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BEA706157C;
 Tue,  5 Dec 2023 06:58:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E66ECC433C8;
 Tue,  5 Dec 2023 06:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701759481;
 bh=zU7bTrxdpBYUmSDNAlUUH1oAlR/IAxzg27ffUEN0aqg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F2nj7YexWsNxGq1DW0G+3ScWUIilUHilBq/5ctjgR9pfK+8AbSPMb5Z4AOxi1s4s6
 j7Qy6xxw9Epswxmbxh6NDRdPu8JKiTg4vB/JdcJ32GWgjPHOOWH7MI4xfqv3RAPWKI
 Gk9WocRqObcfOlG9R840rGCtyoXnhEqxSPAyBJOcegTZMARz32V8t7M1hvHpR5pqer
 dv42RHxrXnzHdvuNOYirCcLiJFswHZMlWgLFZvdIYCJi0OxiRKyaq+oH+lQTkxQEX0
 X2fDC6nUBL+CqpI0Hci+a+Jsr8Nw28iVqoLbdue2UHEbMrc5hXnSJkDwIsVr0mtt+T
 PRb2rNZzFUnEg==
Date: Tue, 5 Dec 2023 07:57:58 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Andrew Davis <afd@ti.com>
Subject: Re: [PATCH RFC 01/10] dt-bindings: gpu: Add PowerVR Series5 SGX GPUs
Message-ID: <23livt5mcc64bb6lkeec2uxp5cyn4wfekwaj6wzrjnrkndvwgj@6tveqglqpr4v>
References: <20231204182245.33683-1-afd@ti.com>
 <20231204182245.33683-2-afd@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="y3drixbas2c643fb"
Content-Disposition: inline
In-Reply-To: <20231204182245.33683-2-afd@ti.com>
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
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tony Lindgren <tony@atomide.com>, "H . Nikolaus Schaller" <hns@goldelico.com>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Donald Robson <donald.robson@imgtec.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Matt Coster <matt.coster@imgtec.com>, Rob Herring <robh+dt@kernel.org>,
 linux-omap@vger.kernel.org, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Tero Kristo <kristo@kernel.org>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--y3drixbas2c643fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 04, 2023 at 12:22:36PM -0600, Andrew Davis wrote:
> The Imagination PowerVR Series5 "SGX" GPU is part of several SoCs from
> multiple vendors. Describe how the SGX GPU is integrated in these SoC,
> including register space and interrupts. Clocks, reset, and power domain
> information is SoC specific.
>=20
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  .../devicetree/bindings/gpu/img,powervr.yaml  | 69 +++++++++++++++++--
>  1 file changed, 63 insertions(+), 6 deletions(-)

I think it would be best to have a separate file for this, img,sgx.yaml
maybe?

Maxime


--y3drixbas2c643fb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZW7J9gAKCRDj7w1vZxhR
xeU2AP9mvBxXe/cJsKPcYEfxWRhpvRor2SswHRWF6NJUuqagJgEAibpTgY0sHnsx
bw4+3yY5CjgxLG+iw0A7d3xv1r1ZJwI=
=8RNH
-----END PGP SIGNATURE-----

--y3drixbas2c643fb--
