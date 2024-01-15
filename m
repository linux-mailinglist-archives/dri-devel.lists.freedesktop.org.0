Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1630F82D506
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 09:25:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5611A10E208;
	Mon, 15 Jan 2024 08:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974EE10E20E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 08:25:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BE522CE0A1A;
 Mon, 15 Jan 2024 08:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC49C433C7;
 Mon, 15 Jan 2024 08:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705307133;
 bh=bkFxuxf0iCghKC8GrzWqXKXAFsRRBXSZ7feexi45UVk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CoV0R374tK5kCtzfve7eyQAekaInOpN0kUMbDADJ0KXk63eiqZTQu9MWzErWMYAfj
 BDp82RgAyoC0OgaHWM5EFeBKTwr8e+VuBEiW9BLrJAQoXyQcvdypB5Jg9rqF3Eto5u
 u+EbR/pWzZwUzdc53sIOnvkoHlbqKwwykR0GFpAgmNhCKrLV97kkbrFH0THj6m9hNd
 rlhyTBEwVAXw3ZeYbwAxM/EyfKlfjSXTiTQg5oBwZxiTqrTSdiuaD5tS8mwlRYdcK1
 J5IYOw8SdFTdWr6BorUsL3PvlYJxuPS7BKs7hxmNaGe84+JruinkUhmnF8916wcMt5
 vzHB0zIfM8/Ew==
Date: Mon, 15 Jan 2024 09:25:30 +0100
From: Maxime Ripard <mripard@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: Re: [PATCH RFC v2 04/11] ARM: dts: omap4: Add device tree entry
 for SGX GPU
Message-ID: <vpcgccul53oibwoqb3barj3rjxoyskoldjyfvjdzmytic3tonm@wq4aqsenk7rp>
References: <20240108183302.255055-1-afd@ti.com>
 <20240108183302.255055-5-afd@ti.com>
 <122DC5ED-2AA7-46A0-845F-083922458385@goldelico.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5bv4mdxrrdvnbudo"
Content-Disposition: inline
In-Reply-To: <122DC5ED-2AA7-46A0-845F-083922458385@goldelico.com>
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
 Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
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
 linux-kernel@vger.kernel.org, Andrew Davis <afd@ti.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--5bv4mdxrrdvnbudo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jan 12, 2024 at 06:33:58PM +0100, H. Nikolaus Schaller wrote:
> > Am 08.01.2024 um 19:32 schrieb Andrew Davis <afd@ti.com>:
> >=20
> > Add SGX GPU device entry to base OMAP4 dtsi file.
> >=20
> > Signed-off-by: Andrew Davis <afd@ti.com>
> > ---
> > arch/arm/boot/dts/ti/omap/omap4.dtsi | 9 +++++----
> > 1 file changed, 5 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/arch/arm/boot/dts/ti/omap/omap4.dtsi b/arch/arm/boot/dts/t=
i/omap/omap4.dtsi
> > index 2bbff9032be3e..559b2bfe4ca7c 100644
> > --- a/arch/arm/boot/dts/ti/omap/omap4.dtsi
> > +++ b/arch/arm/boot/dts/ti/omap/omap4.dtsi
> > @@ -501,10 +501,11 @@ sgx_module: target-module@56000000 {
> > #size-cells =3D <1>;
> > ranges =3D <0 0x56000000 0x2000000>;
> >=20
> > - /*
> > - * Closed source PowerVR driver, no child device
> > - * binding or driver in mainline
> > - */
> > + gpu@0 {
>=20
> I wonder why we don't add a "gpu:" label here.
>=20
> Almost all other subsystem nodes have one (e.g. emif:, aes:, dss:, dsi:, =
hdmi:, etc.),
> obviously for convenience when using a .dtsi file.
>=20
> It would allow a board-specific DTS to easily add status =3D "disabled" t=
o avoid driver
> probing or disabling the GPU (e.g. if there is no display).

There's no reason to disable it in the DT: the hardware block would
still be there and it's rendering to memory so it still could be useful.

If there's no display on the board and you really don't want the GPU
driver, then you can disable the driver or block the module loading, but
it should be a distro / package / user decision, not a DT / kernel one
still.

Maxime

--5bv4mdxrrdvnbudo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZaTr7AAKCRDj7w1vZxhR
xSybAP96mNxOy9DrBryPZmmu4a4Y6AfuRKXr9+Uh2C3OhAPO3QEA1j3KoeAhpYrF
0pDWtJkRFUHwyOTCz3HpiAeRG3RSqwM=
=GRcK
-----END PGP SIGNATURE-----

--5bv4mdxrrdvnbudo--
