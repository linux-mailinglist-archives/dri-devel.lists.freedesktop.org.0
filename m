Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5203C52DF12
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 23:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A74911A629;
	Thu, 19 May 2022 21:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B19B11A774
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 21:20:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8BB9761D2A;
 Thu, 19 May 2022 21:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79C6FC385AA;
 Thu, 19 May 2022 21:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652995205;
 bh=SvQDWvHaw/Ro4+sDEA3LzYO4ioj59uSH1d5BBRvD684=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lZPvgxQ/0GEOJbdI/RsIgFr7yLZfcUJvpqzkwIfYr6DnYL+2Rhom2zrrp9ZJYTqpF
 2BbR9KFYoHbcXxtwZrm5jEIxoonOr6uHesOrfW2SzdnjGAFe7wRyLtBeOLomEHF142
 GyhjeqDrl/+/XblALv6RzMdFZz//uCum30g8tGHTm+Jh2eHBkWU+fpxNxNOYIVKpdO
 Yz+zapxuT0saXPNbmmikHL5VGRFl3k5i/okcNGRFGOcWY43CajAV5gIwlk5K91/tPl
 FY3nh2Cq1LMWd9FJmk7x7tKje3C8gCWlhNIHrrazJdMY61SXsJMc302TGt3KV0Bc7z
 VYeES8NTlFwKw==
Date: Thu, 19 May 2022 22:19:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Fix properties without any type
Message-ID: <Yoa0egr9vhTHcxjp@sirena.org.uk>
References: <20220519211411.2200720-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eXFy+XxgE7404o6q"
Content-Disposition: inline
In-Reply-To: <20220519211411.2200720-1-robh@kernel.org>
X-Cookie: Some restrictions may apply.
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
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, Guenter Roeck <groeck@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, chrome-platform@lists.linux.dev,
 Herbert Xu <herbert@gondor.apana.org.au>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
 linux-gpio@vger.kernel.org, Matt Mackall <mpm@selenic.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Peter Rosin <peda@axentia.se>,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--eXFy+XxgE7404o6q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 19, 2022 at 04:14:11PM -0500, Rob Herring wrote:
> Now that the schema tools can extract type information for all
> properties (in order to decode dtb files), finding properties missing
> any type definition is fairly trivial though not yet automated.
>=20
> Fix the various property schemas which are missing a type. Most of these
> tend to be device specific properties which don't have a vendor prefix.
> A vendor prefix is how we normally ensure a type is defined.

Acked-by: Mark Brown <broonie@kernel.org>

--eXFy+XxgE7404o6q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKGtHkACgkQJNaLcl1U
h9CTcgf/YrxaonL9unlOXD9rVNzVh2gBFZV2wTefQuNDSwkIM40MNQLcoafgcXo5
gFwpnXnCULN4HW9E4gsxeDnj3lcvR/bPgnNtrHetwyPKH/I99KJSgtm6605GyKWF
4d5cVzASF5iCk9z6tn51f2x6jCCLVkVoAOOohCc3nYr1YbXRtQSnKKS8vYaNyqVq
/sELkTEEdwMdl9AML+9S0amyFoPS92ZdcFlFWZIjjzPmidXQxZuL7tGvs9O56vj+
QUESokWc4u2ziIcTQT9X0XXb9dDJjhXWaFiHNc38F7o+ad3kBXAhgzzBzMC/6fLI
/352XipOMFDBOV9MMA03nK4kEtXQBA==
=MbOe
-----END PGP SIGNATURE-----

--eXFy+XxgE7404o6q--
