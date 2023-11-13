Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8ED57E9DC5
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 14:50:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E168D10E377;
	Mon, 13 Nov 2023 13:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90C010E377
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 13:50:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1C6BB60EE9;
 Mon, 13 Nov 2023 13:50:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8833BC433C8;
 Mon, 13 Nov 2023 13:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699883401;
 bh=qhyALmG42/AQmB5Z41yLwINy+Y9Ggr/s8g4n3K7PPig=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OJ3miYrbR1FHCDQqp99GzBvvh8EqNkjgMmet6VngYo9QVGM0f55xKDs8zRqNz4Aw8
 sGaKujEzuBfjS6FLEJU0zFAT7jyMhk4I+NwdyNYrPos7xhSt2NJYuzkLgbyUrC08fX
 P+M7j4XFhhmHlJe0LB2ysC9SbrI8WvB5E+iT+5+jnyXWGXOoCaoTFY2s4azkTIYAkt
 cCpB/I4rWaLkgvpd4v9I2I7wefuINYiGeZgj6JHjvEsg+MS2MoyV2siveM9twApx0t
 6uMMRz0Js+q35SQrzZgMOvM/wf4yLabEzde+U4YXazR7cOJEWFBVMi+6sOkgE+ejd/
 GO+YxeZulhFxg==
Date: Mon, 13 Nov 2023 13:49:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 4/5] dt-bindings: gpu: samsung-g2d: constrain iommus and
 power-domains
Message-ID: <20231113-showbiz-onyx-abaf76317c31@squawk>
References: <20231112184403.3449-1-krzysztof.kozlowski@linaro.org>
 <20231112184403.3449-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wuAMwvZz2Mwnz2Kh"
Content-Disposition: inline
In-Reply-To: <20231112184403.3449-4-krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wuAMwvZz2Mwnz2Kh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 12, 2023 at 07:44:02PM +0100, Krzysztof Kozlowski wrote:
> Provide specific constraints for iommus and power-domains, based on
> current DTS.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--wuAMwvZz2Mwnz2Kh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVIpgwAKCRB4tDGHoIJi
0utDAQCjLlryiqd4C5tAN7mBPG1Vtfy9ryR5V2NwUzIP1hUgsQEA0YnDszj+kC63
aQVdBf7uSCJ/2QVNbdJYlyJnfCBIxgM=
=3qea
-----END PGP SIGNATURE-----

--wuAMwvZz2Mwnz2Kh--
