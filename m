Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F44832D72
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 17:45:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8546F10EA36;
	Fri, 19 Jan 2024 16:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D83D10EA36
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 16:45:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6BDABCE22CB;
 Fri, 19 Jan 2024 16:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2CBBC433F1;
 Fri, 19 Jan 2024 16:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705682685;
 bh=QRRwKq5LqVnkhPlBmuRkLsTSp0aAGvhbAw+sw+G5rKE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CwrBjiJIY6u280JXIzDtHkBHRzWVPvj21WBA3CEh+/RxwVDkP1q76R9RcGOAEyyRK
 as+ANa1c06TpMg4CSg3jgI/b6cHETC2nV29hrJr/oCc2F4jC0QyHxo5j3CW/6xeQS4
 2/LhaIaaszvyl5bZLnRvvN3nLgKCAYbpZfcIFEEXQ350rEcRG2RgHKJCnZLeg/8v6w
 JtuC7tca0XPKKcYmAMa1YjrUPxYJg22gsmy55XF+vjJIA79MEhx/IPY+PiDnwlW7H9
 9O61Ux0CCCSlgDQ027Dydc5dIrvEJeStSAxt9wKgDpDsIe7mqT7guLB6toTJZZ90sQ
 XVPPRdo7GkE3w==
Date: Fri, 19 Jan 2024 16:44:39 +0000
From: Conor Dooley <conor@kernel.org>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: media: mediatek: mdp: Change
 mediatek,gce-events to reference
Message-ID: <20240119-surrender-both-21c64f5149c4@spud>
References: <20240119063224.29671-1-jason-jh.lin@mediatek.com>
 <20240119063224.29671-3-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="R17Or0wU+thr7YJr"
Content-Disposition: inline
In-Reply-To: <20240119063224.29671-3-jason-jh.lin@mediatek.com>
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Shawn Sung <shawn.sung@mediatek.com>, devicetree@vger.kernel.org,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--R17Or0wU+thr7YJr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 19, 2024 at 02:32:23PM +0800, Jason-JH.Lin wrote:
> Change mediatek,gce-events property to reference mediatek,gce-props.yaml
> instead of defining itself.
>=20
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--R17Or0wU+thr7YJr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZaqm9wAKCRB4tDGHoIJi
0oxFAP426FO4m886BrM5F53nZ1cAx5WLgsXMYRGhDk8jJycBJAEA8wHMS3uLk1xV
EfgQYdDiX0aOUSswVeHTyrGZXsooNgA=
=xSy/
-----END PGP SIGNATURE-----

--R17Or0wU+thr7YJr--
