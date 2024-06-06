Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66228FF18F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 18:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F66010E9E9;
	Thu,  6 Jun 2024 16:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hzsTIkIH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E18810E9E9
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 16:06:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 46C24CE1BC2;
 Thu,  6 Jun 2024 16:05:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61B8DC32786;
 Thu,  6 Jun 2024 16:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717689956;
 bh=B8oFRLGBFf9oUJJabHP/G1kxoGfOaFOryqLjdH+SGSk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hzsTIkIHDNCs2FiL9YqqvipwrMQRBtAazzckMC8ufaumBOyktcGli0kpYrEn3OWkH
 M9NbkCj/S8PjYfNnEkjjaVXmP5sceIWntZ54jdkNCXXn+6HjWQKWERLcUSO82NsCfD
 CKKZLMu/KcQ7rFxoPtFjb2JCknafyR23JkcyunF134Knz9DswZbsQ4f3Yhmcqr1o8m
 mDeezxCkbMrnqRyFZTwy1EcIGR9q6KIj/1gPlm4XLvFGvAexzDztghIS5WNuxnmv+G
 /NichS6snCrCEL2oJqeJ9k/f8k5R+UlNVz8eoMmR0ua8WSBnE0PB+8g1JqPRpWyrEV
 waU9JgGUPRwVw==
Date: Thu, 6 Jun 2024 17:05:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>, Sebastian Reichel <sre@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v2 2/3] dt-bindings: display: simple: Add PrimeView
 PM070WL4 panel
Message-ID: <20240606-widow-siberian-c68601929e3a@spud>
References: <20240606080104.3663355-1-primoz.fiser@norik.com>
 <20240606080104.3663355-2-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jmniVyf0f5Z3Hun/"
Content-Disposition: inline
In-Reply-To: <20240606080104.3663355-2-primoz.fiser@norik.com>
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


--jmniVyf0f5Z3Hun/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 06, 2024 at 10:01:03AM +0200, Primoz Fiser wrote:
> Add PrimeView PM070WL4 7.0" 800x480 TFT LCD panel compatible string.
>=20
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--jmniVyf0f5Z3Hun/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmHeXwAKCRB4tDGHoIJi
0ncXAQDMt6euY2YYZi9oiMgKaMustD63H2w1UmQ/Mamircx+WwEAwURL0IUhLdyN
k59gGQ4kRoEuKe/3upiVykYeA9CnoA0=
=BFmt
-----END PGP SIGNATURE-----

--jmniVyf0f5Z3Hun/--
