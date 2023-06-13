Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B32B72ED8D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 23:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83CD10E123;
	Tue, 13 Jun 2023 21:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DBFD10E123
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 21:03:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3B93963AFF;
 Tue, 13 Jun 2023 21:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 402ADC433C8;
 Tue, 13 Jun 2023 21:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686690194;
 bh=cF+TfzFe0MycEoX9ZmraaTaY2ChOoxWjfNfdgDrwSWo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rcl0/pDQyZucBLdSG9aXvlUWBa3rJ2NmWw95mqBbfE4mh40KH9Iu0Zlt1JTZDFJcy
 9UKxpqkmT0rfJrs8lyAutKHzFVl8AhMJh3IPkZepSKXXlLESlVaOmpB0UwY2eaaD+g
 m2ZEELut7MoHvlF8nx1xfBsp2yKhmL//hO30+8ggVJljWP4fGwuhEyHbK9eLtT1bxn
 7ZmOx3Z2enmkZWFcbzLdpFV2D8C8POjvhrTGt8qn1cQinQKWC7CFOQMuZwNWcOEDeT
 7wb+mVeOtU65eOON9hevcjdgfJoBh2eo6vBTpBjlh00xEs+tYLG7X3pYTsiKi+UAL2
 oNQqgyLefUimw==
Date: Tue, 13 Jun 2023 22:03:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: backlight: kinetic,ktz8866: Add missing
 type for "current-num-sinks"
Message-ID: <20230613-truce-unflawed-e6b091e528d5@spud>
References: <20230613201022.2823392-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="T6hh2g3NBkjZXkBj"
Content-Disposition: inline
In-Reply-To: <20230613201022.2823392-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jianhua Lu <lujianhua000@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--T6hh2g3NBkjZXkBj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 02:10:22PM -0600, Rob Herring wrote:
> "current-num-sinks" is missing a type, add it.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--T6hh2g3NBkjZXkBj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIjZjQAKCRB4tDGHoIJi
0n/wAPwLSgz6x8e47r9gpp+j/WGN2jBUiWYJxYZzARfefe2F5wEAl4k63nzlFTyb
MVdaEHqnsmKnYkDMhQStYypjZ9pCUQU=
=6dKP
-----END PGP SIGNATURE-----

--T6hh2g3NBkjZXkBj--
