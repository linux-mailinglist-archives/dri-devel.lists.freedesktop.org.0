Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 635787460CF
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 18:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB7C10E0A7;
	Mon,  3 Jul 2023 16:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A1610E0A7;
 Mon,  3 Jul 2023 16:37:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C54D260FCD;
 Mon,  3 Jul 2023 16:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D613C433C7;
 Mon,  3 Jul 2023 16:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688402234;
 bh=dQJizNDjV0On5jsPc5SMZQJc24JPH7DwKQhe7eOYpjQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OcWUi/sgVANfYuJYeddKHs4lsYxVTJ0o6uA/O/PPLLHo+0ak9l7GoaQht5MusPJYR
 qZkbgM5K6tXZVEA//tCW+sNb6e4XeUi75ZZGE+ckBKajEQWlaJr76mXD/ah6gyfjMp
 JNRc41GxrK8ctzMT632DFINJA7OPT+5EXV7NXe/JIwjF7iyFCgVgKaN0dH11AnrncN
 3uSKBoK7i7Hz4JGO7blvR7PiO/921+0tG89e3oUwKQctLMYQ+r5siGjNyG39h0/crT
 ll2x84Agc0UDDVR28uEGnFe2Q1NW1yqHbe5Hn+RzNUI8WUOHaPtwGP7JOkxRFObvWn
 k4lWRsdeMLtrA==
Date: Mon, 3 Jul 2023 17:37:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: cleanup DTS example whitespaces
Message-ID: <20230703-backwater-shrimp-83c4d7c85566@spud>
References: <20230702182308.7583-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UiJVV06vbWBe/tbL"
Content-Disposition: inline
In-Reply-To: <20230702182308.7583-1-krzysztof.kozlowski@linaro.org>
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
 linux-iio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 coresight@lists.linaro.org, linux-usb@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Leo Yan <leo.yan@linaro.org>, linux-phy@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-remoteproc@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--UiJVV06vbWBe/tbL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 02, 2023 at 08:23:08PM +0200, Krzysztof Kozlowski wrote:
> The DTS code coding style expects spaces around '=3D' sign.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--UiJVV06vbWBe/tbL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKL5MwAKCRB4tDGHoIJi
0mVgAQDNt2fzUk6TeyhRtqxRzkVNpebNdDOvWcdu/bIrTUmphAD+MWZmleneV77V
DMKAFWrQs6zsQ6eXYsq712V3/VRwiQg=
=CDKn
-----END PGP SIGNATURE-----

--UiJVV06vbWBe/tbL--
