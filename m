Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA7F2A4D18
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 18:35:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 820EA6E8C8;
	Tue,  3 Nov 2020 17:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1263D6E8C8
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 17:35:18 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3496621D91;
 Tue,  3 Nov 2020 17:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604424917;
 bh=d7GVDYNRB1nkxf2PedrfHEfVA3XJxfH6uOxe6MdezuI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DsK91wUdoGUZK4AOAEjAfqPztcJvbwC8CyX0S+vLU47sPGM5gelbPSEU3bUmDvfbu
 Z1Fq3KEu7l+Fp0lM3rQJaPZW07CbsytQcFapNYcotHlya3IusuyrV4D5W8SdJOrluK
 aeDX6YUY3YvZlmni1IvawcsMbL/osVIJe5RKz2WQ=
Date: Tue, 3 Nov 2020 17:35:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3] MAINTAINERS: add Dan Murphy as TI LP8xxx drivers
 maintainer
Message-ID: <20201103173508.GE5545@sirena.org.uk>
References: <20201103162832.14085-1-krzk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20201103162832.14085-1-krzk@kernel.org>
X-Cookie: I don't get no respect.
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-iio@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 linux-pm@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-fbdev@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Dan Murphy <dmurphy@ti.com>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org,
 Jonathan Cameron <jic23@kernel.org>
Content-Type: multipart/mixed; boundary="===============1486610853=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1486610853==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wchHw8dVAp53YPj8"
Content-Disposition: inline


--wchHw8dVAp53YPj8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 03, 2020 at 05:28:32PM +0100, Krzysztof Kozlowski wrote:
> Milo Kim's email in TI bounces with permanent error (550: Invalid
> recipient).  Last email from him on LKML was in 2017.  Move Milo Kim to
> credits and add Dan Murphy from TI to look after:
>  - TI LP855x backlight driver,
>  - TI LP8727 charger driver,
>  - TI LP8788 MFD (ADC, LEDs, charger and regulator) drivers.

Acked-by: Mark Brown <broonie@kernel.org>

--wchHw8dVAp53YPj8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+hlMsACgkQJNaLcl1U
h9DMeQf/S8R2hQl3+LVLzMNkd1Q6yWjRyQrQjxMjOqrmU4Cu/kQMMM5rQtHOGVQP
uJmOlkrRnY6uOizYGLkrzxmhWHN8as6hkWahJvRB45G7UEco3DuZaRvUZpY9vK6+
1NKh1ISoMhfCL9bq5EZgOacORZVXZF9kGV10il0adlO6EEIcYekefZMks2ESlvp+
jmeq8iNlqj7u/BVm7X1SWFsHlUfB+Y/7ekebQxFYq+4DUfkc0r+Q+cREBgDYbX2B
iUNK8o8/itBiJ2Wl84FaPjOMfyWRIUrwgo8UUhzsrtCFejjk8zFWiebFeFHeyFnV
gSMg/Ymsj/xcLfaDYPbktl5KWprRdg==
=Dr7Z
-----END PGP SIGNATURE-----

--wchHw8dVAp53YPj8--

--===============1486610853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1486610853==--
