Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C70B70FE75
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 21:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1C410E5E4;
	Wed, 24 May 2023 19:21:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012D910E5E4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 19:21:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 036A46404B;
 Wed, 24 May 2023 19:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5FB2C4339B;
 Wed, 24 May 2023 19:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684956099;
 bh=Sd1Ura2M9buJQSOCvciUHD2sqlFtpG56/2/gPbm9J28=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qok6UoeSp3jwvMlC7HfMf2T3bU/c9zak6yUZL8CGMvuQ7/qSRGAgchHhGYUnyXlpp
 xTj3foph1OeS7CC+H+W6Bdu6AAE9adZArZ8y7q3KOD1hcbSdZFZP9xHG/IYrIBgbo7
 c/x7++wsglFYVGCF3wtUw8l/DjCmA6FAikwWnMe/pJhW5+7ayOnC5ImDJd88RE02R/
 3TRQd9kdynkgbUq4KVSL+ruUKb6GajJX3WYzIdHcxTh8PCeTZgqw8uB9QBDY4CANX7
 M5gODvF+r9M8b9I9WHSRQf1lQMrin8Gh/IcbNhI2X3qVgDAZo/1+qMbdTLi9DPkibu
 ZaWIzBUmgq7QQ==
Date: Wed, 24 May 2023 20:21:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel-simple: Add Ampire
 AM-800480L1TMQW-T00H
Message-ID: <20230524-posing-pouncing-f197846768ac@spud>
References: <cover.1684931026.git.geert+renesas@glider.be>
 <422adef8c4941fa56fdadacb3d362a9fb387455e.1684931026.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NKQCStFFZ1gwgZRL"
Content-Disposition: inline
In-Reply-To: <422adef8c4941fa56fdadacb3d362a9fb387455e.1684931026.git.geert+renesas@glider.be>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--NKQCStFFZ1gwgZRL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 24, 2023 at 02:32:10PM +0200, Geert Uytterhoeven wrote:
> Document support for the Ampire AM-800480L1TMQW-T00H 5" WVGA TFT LCD
> panel.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--NKQCStFFZ1gwgZRL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG5jvgAKCRB4tDGHoIJi
0oO/AQDeTcFWWpQENvchjFkwbz1TuanTTaaJI3Nk9bUVe0a0HwD+O53CJKVeO+hr
x/Cbf/39qxSEbaY36E6RZ371qVEk5wU=
=6wyM
-----END PGP SIGNATURE-----

--NKQCStFFZ1gwgZRL--
