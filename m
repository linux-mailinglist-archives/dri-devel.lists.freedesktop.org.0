Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6792C86D132
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 18:54:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB23A10E28C;
	Thu, 29 Feb 2024 17:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="r7dVqRy9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F1210E28C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 17:54:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 23744612C3;
 Thu, 29 Feb 2024 17:54:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C54BC433C7;
 Thu, 29 Feb 2024 17:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709229255;
 bh=/UMEnyyhRyF9Pjefi/dD8N9hm6l2W4RsvKVlb5y5evo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r7dVqRy9GIaUv6QtQsaFe5PfURVdXM1AshXWiT9ZJk3hepfHhWf2+eOuJkSfHGUkx
 qKWFnAcghZd6QgXCnaput2tZ3AwmvJK93Ygdl7JI0P/HmjfiOzSW1F6Aq87edhAE4V
 bEu3w6l7MXSRUz8zBHNTUWhJ5Sz52Ujwytby7Bvg4GFZynIF0LvzeJnN7EkBVe0qUp
 H/hXkUGZuFHfSdPLw7pnbiprrkd138ETnbAOkjCIhC1r0GwxxfNO0EH+DZHooZB70i
 WsgC+07jq6CPfp2vJZbzBsxT8F35mqwy85gwHEUiXR6hBMt5HaH3wbDYa2Vhbc3JDj
 B1myWaajAeJKA==
Date: Thu, 29 Feb 2024 17:54:10 +0000
From: Conor Dooley <conor@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: =?iso-8859-1?Q?J=E9r=E9mie?= Dautheribes <jeremie.dautheribes@bootlin.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Yen-Mei Goh <yen-mei.goh@keysight.com>
Subject: Re: [PATCH 1/3] dt-bindings: Add Crystal Clear Technology vendor
 prefix
Message-ID: <20240229-woven-lively-1d90687b2d03@spud>
References: <20240223134517.728568-1-jeremie.dautheribes@bootlin.com>
 <20240223134517.728568-2-jeremie.dautheribes@bootlin.com>
 <20240223-prepay-stadium-f09044e3e123@spud>
 <23832e29-5bf4-4dab-ac00-4a4090233c3f@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="q7xXagaWtGMrPzGa"
Content-Disposition: inline
In-Reply-To: <23832e29-5bf4-4dab-ac00-4a4090233c3f@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--q7xXagaWtGMrPzGa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 09:54:59AM +0100, Neil Armstrong wrote:
> Hi J=E9r=E9mie,
>=20
> On 23/02/2024 19:22, Conor Dooley wrote:
> > On Fri, Feb 23, 2024 at 02:45:15PM +0100, J=E9r=E9mie Dautheribes wrote:
> > > Update Documentation/devicetree/bindings/vendor-prefixes.yaml to
> > > include "cct" as a vendor prefix for "Crystal Clear Technology". CCT =
is
> > > the vendor of the CMT430B19N00 TFT-LCD panel.
> > >=20
> >=20
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > And add a
> > Link: http://www.cct.com.my/
> > as that actually explains why "cct" is the right choice.
>=20
> Can you send a v2 with this change ?

Does your workflow not allow you to pick up Link: tags while applying
patches?

--q7xXagaWtGMrPzGa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZeDEwQAKCRB4tDGHoIJi
0gOYAQD8gdAfyltMcKsTe8gtkAcHUuFJ103breikb9/WgYuaKgD8Cwb3P1gxWrRS
Gs+AZRfEnLD5LcwisP3RADU1M85cfQw=
=867m
-----END PGP SIGNATURE-----

--q7xXagaWtGMrPzGa--
