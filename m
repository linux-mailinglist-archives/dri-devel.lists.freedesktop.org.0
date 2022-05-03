Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2263F518A40
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 18:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3E5112051;
	Tue,  3 May 2022 16:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0955112051
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 16:42:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9812561772;
 Tue,  3 May 2022 16:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDCEFC385AF;
 Tue,  3 May 2022 16:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651596146;
 bh=RdmnwE+iucpL+/8qT85xaKQLpnn8IQBlp7A0PPpBkjc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MBuAO2xSVQR0Es2Khy87In4R8Y100/OP9420inSPVtGjNodMGqIXGDeoQHgu0zdtp
 ZSMtkeQgwnC2B29WSRQCYL/O4jCHnME+f80aw4Fo5XWoHHVCVGx/BOqioVIUben+m7
 dAMycifIRkxwmDNlXwHi1GwZNR0O1uzfUUGAcwMMFdw8KhKSWf9AkZmD379wvLv9fh
 Uaih7P0/38fdDXOhFQTx4yM432rKEcsSGfyxP2ivUAyVZhwEsQe0HLwzNoIPwQXGpI
 dxuPOzqD0QB+YJpXI7AwZY3EEZfQI0H8Fxh83x1xt1dkQXlECEzWDKnz//DiA0KIY/
 DnUedifNgT+/g==
Date: Tue, 3 May 2022 17:42:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Drop redundant 'maxItems/minItems' in
 if/then schemas
Message-ID: <YnFbZaARRe13BqEU@sirena.org.uk>
References: <20220503162738.3827041-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Ie5Q9u0aDDvYlHNh"
Content-Disposition: inline
In-Reply-To: <20220503162738.3827041-1-robh@kernel.org>
X-Cookie: Drop that pickle!
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-phy@lists.infradead.org,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
 linux-rtc@vger.kernel.org, Abel Vesa <abel.vesa@nxp.com>,
 Anson Huang <Anson.Huang@nxp.com>, Richard Weinberger <richard@nod.at>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 Wolfgang Grandegger <wg@grandegger.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-pm@vger.kernel.org,
 linux-can@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Han Xu <han.xu@nxp.com>,
 Alessandro Zummo <a.zummo@towertech.it>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-mmc@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Dario Binacchi <dariobin@libero.it>, netdev@vger.kernel.org,
 Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--Ie5Q9u0aDDvYlHNh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 03, 2022 at 11:27:38AM -0500, Rob Herring wrote:
> Another round of removing redundant minItems/maxItems when 'items' list is
> specified. This time it is in if/then schemas as the meta-schema was
> failing to check this case.

Acked-by: Mark Brown <broonie@kernel.org>

--Ie5Q9u0aDDvYlHNh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJxW2QACgkQJNaLcl1U
h9AhOwgAgCQAzTimr9tUAEV2YxMIwidmRC9yH7j14TLxr45y9aG5gyGDcabEWvNT
1G+vE5DtD9PAsO0tkipn9eZam4zgKttaLGOTql3iSuyYP4IJZLz5B0UQdfH/Rblq
lwN3vZgGQIDC0Bq4GZFntPO4DgtMJRUjLYBkqZ9VRrAc0BtdLx0s2eLXna86GqsS
JRPrW4CqJ9evXkLhz4oWrns5IFYbbkZQBRDahnYbYEShXBVarN07FHDyJR7e563l
wHOqrXEThke2dA9JPWeaBTp7h9SiE6UhFUpzyFAd9YF+0t0k3slgr1oj89o28M6t
855bZNK3+42p+Ytiewlr25+J4xL31Q==
=Z4ML
-----END PGP SIGNATURE-----

--Ie5Q9u0aDDvYlHNh--
