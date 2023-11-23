Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6D17F651D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 18:18:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2A1C10E034;
	Thu, 23 Nov 2023 17:18:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D6410E034
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 17:18:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1B92F62272;
 Thu, 23 Nov 2023 17:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B6FEC433C9;
 Thu, 23 Nov 2023 17:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700759914;
 bh=4uuYv4ivuEW0QNa8dUnLLuSPDWYlT69BIfr2llFRLnY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VciWPKaDUoyUh1FepWZVBgnEAvCej2jGYm2TSGV21kR6rxT2wHdKYHWulmTMoEseV
 QJusH27Z2ZudBxQ1B7xUrUc9F4ScACAMaLstO7vxgwRI77pW+krMbgdRx0Rrp9b8Q1
 PNEsnqINMuYcAspPMGU0UN0hwXfgGqIxek4NNPZ/xITtRw2uXqBEuyw7S+v9NBAcFo
 L0HW1CeTZJra/bOWhtwwHUl9sKInrZ7VuduC4xYij7KkMbxYpWUawG84Z046Kzoo14
 R4WVMicENkQ6N3XbwHcxg/0VgPHaVVXdNT7du6iXWx1pXsOn8M4QQRqCGmpN4EhRX6
 VePnpFLDsd0nQ==
Date: Thu, 23 Nov 2023 17:18:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: display: mediatek: dsi: add compatible
 for MediaTek MT8195
Message-ID: <20231123-wipe-starch-741e674c1f54@spud>
References: <20231123133749.2030661-1-mwalle@kernel.org>
 <20231123133749.2030661-2-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gjaPXcNp/j7dUovY"
Content-Disposition: inline
In-Reply-To: <20231123133749.2030661-2-mwalle@kernel.org>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, Xinlei Lee <xinlei.lee@mediatek.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--gjaPXcNp/j7dUovY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 02:37:46PM +0100, Michael Walle wrote:
> Add the compatible string for MediaTek MT8195 SoC, using the same DSI
> block as the MT8183.
>=20
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--gjaPXcNp/j7dUovY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV+JYwAKCRB4tDGHoIJi
0k5mAQDNhAGJgE8ZQcNenl97mgSMbjnMQQZT1j8Z6HsCMI1JeQEAm8dsDuvsCcp8
mPJKmSYIoy4Aes//J8lAQpbhat4N6wY=
=3Y9w
-----END PGP SIGNATURE-----

--gjaPXcNp/j7dUovY--
