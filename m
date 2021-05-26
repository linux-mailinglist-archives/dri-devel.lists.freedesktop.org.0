Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8DA3915DD
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 13:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E2886EC88;
	Wed, 26 May 2021 11:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF076EC88
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 11:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZZ29t9rWQM4OHKScJo66H518G9wk4b5EkUEydCzI4Y8=; b=P1lTnzGRnD6xJwViIxs2la/hmZ
 aLW8qo6s0YSEySGWYLrL9g/N7VCscyCT9z2V8VztvKYpidgHTEP9P7AA1hG2wBJZkbalafJod5ino
 R5WUr/PCJdJHYLWghQcE7V6KxGS5EUjbOc1/X1oVS9wSR4TvP1JwrxcbwLEAEDqcMDOM=;
Received: from 94.196.90.140.threembb.co.uk ([94.196.90.140]
 helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <broonie@sirena.org.uk>)
 id 1llqvh-005xmI-5B; Wed, 26 May 2021 10:38:25 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id F01C7D05865; Wed, 26 May 2021 11:38:59 +0100 (BST)
Date: Wed, 26 May 2021 11:38:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 04/12] ASoC: hdmi-codec: Add iec958 controls
Message-ID: <YK4lQ1WJ+bBAwnDz@sirena.org.uk>
References: <20210525132354.297468-1-maxime@cerno.tech>
 <20210525132354.297468-5-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VHjauBDPfRurBChP"
Content-Disposition: inline
In-Reply-To: <20210525132354.297468-5-maxime@cerno.tech>
X-Cookie: Ahead warp factor one, Mr. Sulu.
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
Cc: alsa-devel@alsa-project.org, Tim Gover <tim.gover@raspberrypi.com>,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-rpi-kernel@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org, Dom Cobley <dom@raspberrypi.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--VHjauBDPfRurBChP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 25, 2021 at 03:23:46PM +0200, Maxime Ripard wrote:
> The IEC958 status bits can be exposed and modified by the userspace
> through dedicated ALSA controls.

Acked-by: Mark Brown <broonie@kernel.org>

--VHjauBDPfRurBChP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCuJUMACgkQJNaLcl1U
h9BbiAf9FlorXmTGbHpwvZBlli/cOILFyMcqSLtmFjeQQEQ/Hw/zi+ovr1CDHxx7
GGjEpFOC3ThNwPXOMCPBcJ9KI7dkJL5rk+Hb4nChrNno8iZLrEy9O73H5iATxn5o
HTnqWXd2c9DDAFeNnYPkXrqH4jntmdlprTBBwHaCfX216S7uK1+3y+wGGN2ssCoq
Icvel1+KQ/o9MdMhs9cuDRw6e3GYNVqEK82wOLfKL6AstDOmVt6IJ+PvOG/h4NSD
mRSQ/XDsW/iXataTHhEjyihRhDEjSQ9MXd7gCtKitVBetbKUhO6EDY/hY7aV3J1i
OpnoP0ODzC13oVmNXUGkksNvsjhFgw==
=vtry
-----END PGP SIGNATURE-----

--VHjauBDPfRurBChP--
