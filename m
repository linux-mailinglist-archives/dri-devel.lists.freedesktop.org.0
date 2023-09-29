Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 787D57B33F6
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 15:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD2E10E126;
	Fri, 29 Sep 2023 13:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21AC10E126
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 13:46:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 51410CE2427;
 Fri, 29 Sep 2023 13:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18334C433CA;
 Fri, 29 Sep 2023 13:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695995215;
 bh=nOoINXbCtXHi03H4Jfyw8P2HWSbPAKaj4dwA0naO4lQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XLMxc/a7E6FFcjSVAv8Ki5QEuCMxlMosA51LtXvxn1KFynWOWQSZpaIfO3wLEcOvm
 WIyx0oEVtSzKjPshvhipvne2PXEJRD9cECYwRNt+VXSZff7LDEsSUhmrJ4qYZjjVz1
 nfHfqj94RoDkdzxvv538OLZCR7Qf2ah51rfHVV1Cg5FJgfzP6jdmUfOrWvHkYJxM5S
 CxsAcpVK//7axEU1de2swnqL6ECwQq1xZ4BN0DG4iJC2IQr+1swlWEgZZpgzqaGNi7
 KZD8t8pLlo/Ot7AQeLzwj0B9IgptcHWovkzJlGRtHSpotetCu6rUBduoJL3PkJ0/dn
 +3gS0F2QvKM/Q==
Date: Fri, 29 Sep 2023 15:46:52 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Ying Liu <victor.liu@nxp.com>
Subject: Re: [PATCH v14 RESEND 1/6] dt-bindings: display: imx: Add
 i.MX8qxp/qm DPU binding
Message-ID: <aaxikc6gowwpjhhsmfeu3djepwuqovebojveil4judk2glazii@53j5bulxwud3>
References: <AM7PR04MB7046598DF5621D73152AB1E898E8A@AM7PR04MB7046.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="abx4pgmbvnft3cjd"
Content-Disposition: inline
In-Reply-To: <AM7PR04MB7046598DF5621D73152AB1E898E8A@AM7PR04MB7046.eurprd04.prod.outlook.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "Laurentiu Palcu \(OSS\)" <laurentiu.palcu@oss.nxp.com>,
 Guido =?utf-8?Q?G=C3=BCnther?= <guido.gunther@puri.sm>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--abx4pgmbvnft3cjd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 05, 2023 at 03:44:23AM +0000, Ying Liu wrote:
> On Thursday, August 24, 2023 5:48 PM, Maxime Ripard <mripard@kernel.org> =
wrote:=20
> > On Wed, Aug 23, 2023 at 08:47:51AM +0000, Ying Liu wrote:
> > > > > This dt-binding just follows generic dt-binding rule to describe =
the DPU
> > IP
> > > > > hardware, not the software implementation.  DPU internal units do=
 not
> > > > > constitute separate devices.
> > > >
> > > > I mean, your driver does split them into separate devices so surely=
 it
> > > > constitutes separate devices.
> > >
> > > My driver treats them as DPU internal units, especially not Linux dev=
ices.
> > >
> > > Let's avoid Linuxisms when implementing this dt-binding and just be s=
imple
> > > to describe necessary stuff exposing to DPU's embodying system/SoC, l=
ike
> > > reg, interrupts, clocks and power-domains.
> >=20
> > Let's focus the conversation here, because it's redundant with the rest.
> >=20
> > Your driver registers two additional devices, that have a different
> > register space, different clocks, different interrupts, different power
> > domains, etc. That has nothing to do with Linux, it's hardware
> > properties.
> >=20
> > That alone is a very good indication to me that these devices should be
> > modeled as such. And your driver agrees.
> >=20
> > Whether or not the other internal units need to be described as separate
> > devices, I can't really tell, I don't have the datasheet.
>=20
> i.MX8qxp and i.MX8qm SoC reference manuals can be found at(I think
> registration is needed first):
> https://www.nxp.com/webapp/Download?colCode=3DIMX8DQXPRM
> https://www.nxp.com/webapp/Download?colCode=3DIMX8QMRM

I tried, but the registration is buggy. The email takes longer than the
timeout to be sent.

> Sorry for putting this in a short way, but the DPU is one IP, so one dt-b=
inding.
>=20
> >=20
> > But at least the CRTC and the interrupt controller should be split away,
> > or explained and detailed far better than "well it's just convenient".
>=20
> CRTC is Linuxisms, which cannot be referenced to determine dt-binding.
>=20
> DPU as Display Controller is listed as a standalone module/IP in RM.
> This is how the IP is designed in the first place, not for any convenient
> purpose.

Sure, but pushing that argument further, the entire SoC has been
designed as a single entity.

Every vendor out there designs its display pipeline in its entirety and
not block by block. This doesn't mean that it isn't composed of several
mostly discrete components.

If it has a separate address space, clock and interrupt, it's a
different device, no matter how it was designed or what the intent was.

Maxime

--abx4pgmbvnft3cjd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZRbVTAAKCRDj7w1vZxhR
xfZqAP9e8GEes903vpreo8t3DuJDR/u0I9fTrgVUjDE4SUwcgAEAicL2Oh4ELOb0
zfaeBFyPQsaR6hlxxvYsgLbT/A0yzwg=
=5kua
-----END PGP SIGNATURE-----

--abx4pgmbvnft3cjd--
