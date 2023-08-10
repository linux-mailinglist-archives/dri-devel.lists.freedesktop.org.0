Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1251D778131
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 21:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CDAC10E5E5;
	Thu, 10 Aug 2023 19:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF55F10E5EC
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 19:17:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EC5D866746;
 Thu, 10 Aug 2023 19:17:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF6FC433C7;
 Thu, 10 Aug 2023 19:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691695045;
 bh=BEW2jASDS4rCTYII7Gtbu6vmjY7RNQbJDS5D5sl005Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KdQoAU1dMrq0CC8Q3kNXiSnzvj2R4RX8lDsbc/jr6avYjVr6yny1s+409UljpZJVj
 rW8zXfiyFnAllNfBg/63HqTh0aUZVvzKIiICTrtU9q+ubjb+UDNWIAppwTuFeFrIub
 KVtISknSQTPxMI0qNgTuchkTHVKMwuI4iZfLIM9NZI9rz3pzdVc6YqZOkVLPLSd4oj
 nz1ylRwoTxSBk2d8QaNNiyrJXhVdS3a8zLkXPvfILuu1VAdcEmbBQ10ylpxJrlk34q
 sWmPYL+jz3SsU4vWTaTT3vpzNZIWqZY59OFfUvUwX0b8ohyaYUHWIDViPF9rHfJ+hV
 i3vDoHRAG5E8g==
Date: Thu, 10 Aug 2023 20:17:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: add ShenZhen New
 Display Co.
Message-ID: <20230810-flaccid-unable-5b92d0403bb1@spud>
References: <20230810144116.855951-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KxGH0TYv7LlPmNgB"
Content-Disposition: inline
In-Reply-To: <20230810144116.855951-1-luca.ceresoli@bootlin.com>
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--KxGH0TYv7LlPmNgB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2023 at 04:41:14PM +0200, Luca Ceresoli wrote:
> ShenZhen New Display Co., Limited is the manufacturer of the
> NDS040480800-V3 LCD panel according the datasheet.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--KxGH0TYv7LlPmNgB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNU3wAAKCRB4tDGHoIJi
0uHmAP9xJDKYbXnFX6pwt4y4eKVct7i+zN97G50i09uVOi4CoQD8DTou+qPZK5kv
DfgGMq9q6XIF3iViQ1QpC/t7OzL9awY=
=qFX8
-----END PGP SIGNATURE-----

--KxGH0TYv7LlPmNgB--
