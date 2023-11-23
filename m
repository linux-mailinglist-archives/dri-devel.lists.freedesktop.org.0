Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 300BA7F6510
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 18:17:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2657F10E2D7;
	Thu, 23 Nov 2023 17:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B2010E2D7
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 17:17:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1A1B8CE2B93;
 Thu, 23 Nov 2023 17:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B184FC433CC;
 Thu, 23 Nov 2023 17:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700759840;
 bh=eW+CaP4BT2sNRyEoRgqQyByj/UxBL0nOsR4Sy6KWAB8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b4+pi29bIwN67/0/212NMFo+i0rNMY2++XhQ3BSe0x7cAv7zqJlXtL4V3ReslEQW1
 XaJxbGtNBNmPyY5wGbWd9MSXUrCUN9q2c51w2+nQU2jwTmj5db8sJbgxyz4OlFbYQm
 Mf4kM1iB5+MKa/xpJUf9Sgc6waDiauIIuibWUXcwAyVO0RQc0St1TMbH7V7sOeF2eI
 hj/nu7RC4ckUBO0tgiVH+csJMCV9WN/OsoRMVF4AvKSG6LcZVetRPzE9zjBNBmgvVb
 nfJ8fdqaexbkuL0CIv/PXR5KjfjMohP6mPtkBP+pnqqOUI4vgTw5yDvwdoI4vkQO0W
 1cqkQ52sCsXFw==
Date: Thu, 23 Nov 2023 17:17:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: mediatek: dsi: remove Xinlei's mail
Message-ID: <20231123-reply-runny-87d16e39f9f5@spud>
References: <20231123134927.2034024-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BrmG9mhQOAkPRD4C"
Content-Disposition: inline
In-Reply-To: <20231123134927.2034024-1-mwalle@kernel.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--BrmG9mhQOAkPRD4C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 02:49:27PM +0100, Michael Walle wrote:
> Xinlei Lee's mail is bouncing:
>=20
> <xinlei.lee@mediatek.com>: host mailgw02.mediatek.com[216.200.240.185] sa=
id:
>     550 Relaying mail to xinlei.lee@mediatek.com is not allowed (in reply=
 to
>     RCPT TO command)
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--BrmG9mhQOAkPRD4C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV+JGgAKCRB4tDGHoIJi
0pFxAQCyKVuk2eJSY49HrTBq2484vkMJ8MFxC/6EHrUG8IP+jQEAvJ6e6guZQQ5H
M4/Y0irGropjfjLwrA8b4j9bXOhM8AI=
=9maz
-----END PGP SIGNATURE-----

--BrmG9mhQOAkPRD4C--
