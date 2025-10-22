Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4569FBFD97B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 19:31:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE6D10E820;
	Wed, 22 Oct 2025 17:31:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q4W58T1S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0775810E81E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 17:31:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EA8CA6053D;
 Wed, 22 Oct 2025 17:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C831AC4CEE7;
 Wed, 22 Oct 2025 17:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761154315;
 bh=fswy1rZQ0TLFPMGWN5XwIyYhQmDROE4MdTqHp9R8548=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q4W58T1ScAlNqCXHBlJyvdgAHsiT/d+HYtZF/vFSI4Xdxe2f722w6JBJitnVBTveT
 nSxttsD9pW/7B4iMSolH7q9lZr2LyYMBb5aSLDQO3IbMTtj40qhCj+zUpyq57x6yC1
 YB3xIXqErAEx7gzsPQomhEsugG1c2vjegHBbqZ+K00JCg4d85hNaHVurIh2IHX1cO4
 ykLL4dNCsee+LXMTqXsR3YY7bNLPnRsQnG9gSNukSJAErAdCk9kLGvqzA7G3+JdUdT
 x5bxeo8l1ow/GGui21KgNSBJDaH2Bwn5DyIszC61UZ1dXVPkQd85eXMDH+gBtAkToZ
 xSnCiJh3dkjVA==
Date: Wed, 22 Oct 2025 18:31:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
 airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: display: panel: Add Tianma
 TL121BVMS07-00 panel
Message-ID: <20251022-lukewarm-commode-8be0ccc896c8@spud>
References: <20251022124628.311544-1-yelangyan@huaqin.corp-partner.google.com>
 <20251022124628.311544-2-yelangyan@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ilTfaP2sXYTf7i3+"
Content-Disposition: inline
In-Reply-To: <20251022124628.311544-2-yelangyan@huaqin.corp-partner.google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ilTfaP2sXYTf7i3+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 08:46:27PM +0800, Langyan Ye wrote:
> Add device tree bindings for the Tianma TL121BVMS07-00 12.1-inch
> MIPI-DSI TFT LCD panel. The panel is based on the Ilitek IL79900A
> controller.
>=20
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--ilTfaP2sXYTf7i3+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPkVBgAKCRB4tDGHoIJi
0lC7AQDmkB81fazzC9jXb8LdRa2lTC16MefC7XvYeA1h68HhQgD+O8lHMyMHtoK9
o/xLobdgK9idVdHl1BIT5BRFt0DcXgg=
=ACIW
-----END PGP SIGNATURE-----

--ilTfaP2sXYTf7i3+--
