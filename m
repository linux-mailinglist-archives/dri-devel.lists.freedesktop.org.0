Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8354472ED9F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 23:07:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB86E10E148;
	Tue, 13 Jun 2023 21:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6288C10E148
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 21:07:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C62B06185C;
 Tue, 13 Jun 2023 21:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46289C433C0;
 Tue, 13 Jun 2023 21:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686690438;
 bh=dg1OBeira/SOkCADIAIlkIHpK6iLT9wV4cEyypcTp+Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l3wgzqqsVNJ7u2ppnUdieLBBiPZhWiKrR5Wp6DSKONfg8YxKms3srkxzLPMAkNsyr
 eDiWE8kGi1rCK+e+rcV5FwKjia3r5IXLCxn3ko54T13e/VWrzsc4h8N9r3WdwTT94P
 m92AqmVUgDZzsccLAYdQyRzHD1yl4hYC6uQ9RMIfAaHJno+iVxkQtJQI8uvx2l5wES
 vVNhUYt81b2VV2lA1/cuUTp1GeexGNr9DxkT2j4qvTlDSruVAVNcxGS/ujosnC6P3t
 UyXLSLXFd9GQYrJDKjaTVJUA6iFIa8WvT/qGnyVus5kMQ6xfTRl0a06mPhy+309PmN
 2B8KtohPhBIWw==
Date: Tue, 13 Jun 2023 22:07:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: Add missing property types
Message-ID: <20230613-stand-dainty-b3bb31d83192@spud>
References: <20230613201114.2824626-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="A/78unTD0TIXk5Vq"
Content-Disposition: inline
In-Reply-To: <20230613201114.2824626-1-robh@kernel.org>
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
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--A/78unTD0TIXk5Vq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 02:11:14PM -0600, Rob Herring wrote:
> A couple of display bridge properties are missing a type definition. Add
> the types to them.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.


--A/78unTD0TIXk5Vq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIjagAAKCRB4tDGHoIJi
0rfmAQDbP6Tjg5xc2FjaR9cJeQpufTo4mGa03A3AzVhICSgIiwD9E8wvLpm7Udq9
cj05X+hFncK/KDC1u2zOJwoIKoysjwo=
=sFZ3
-----END PGP SIGNATURE-----

--A/78unTD0TIXk5Vq--
