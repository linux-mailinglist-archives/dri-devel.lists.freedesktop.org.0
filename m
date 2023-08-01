Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E1676B8E0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 17:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1AD410E416;
	Tue,  1 Aug 2023 15:42:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F6610E406
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 15:42:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 47D3061617;
 Tue,  1 Aug 2023 15:42:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A6CFC433C9;
 Tue,  1 Aug 2023 15:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690904539;
 bh=SHVhw9HvXwaezqu60GF2nIB9S98q5r6biy/LMA0uFUg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ehPXkd2v6ltImtj/9QJihxdG7v5K8sdBPJipN4LxWPzP1M7z091bCY6KpZKlPLWNp
 CxITtBSzexoKNvHytrvDNv2cvL8ZoryM3CLl7CBvU868uTg1WIZTP2lIcL+qXNc51r
 avBjfabSydNWsMfG0flsbwmx2hP2RMV8mTiyax6Cn+WcSQc/oSxlICYtilk3UOhPy9
 jOCCzxtnQZS9SUSWzdmMShMVKjhmZA4AYN4J7+lAckn82rpzt2rgk1Zy7xPhOT0YdF
 mNrO8dFHEvOkDLt2y8+yebREYJ0Oi7fFJl7/2dVbip4Q/Rg7xBc/sndBfGnCyF6mGt
 Xsj3FFtnqz6Ow==
Date: Tue, 1 Aug 2023 16:42:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: Add Innolux
 G156HCE-L01 panel
Message-ID: <20230801-apostle-blurt-db4683b4cf95@spud>
References: <20230731210258.256152-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jjUB96C1fTz4exbo"
Content-Disposition: inline
In-Reply-To: <20230731210258.256152-1-marex@denx.de>
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
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--jjUB96C1fTz4exbo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 31, 2023 at 11:02:57PM +0200, Marek Vasut wrote:
> Add entry for Innolux G156HCE-L01 15.6" 1920x1080 24bpp
> dual-link LVDS TFT panel. Documentation is available at [1].
>=20
> [1] https://www.distec.de/fileadmin/pdf/produkte/TFT-Displays/Innolux/G15=
6HCE-L01_Rev.C3_Datasheet.pdf
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--jjUB96C1fTz4exbo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMkn1gAKCRB4tDGHoIJi
0mSNAQCmJf/MDKi8E5ssDuJ72CzVx+gx8YKDAbBj/bMAKdbrJQD+LuFAEB7F78lt
MV8IpJsczC6qnz8ZzLQix5kvxtBkfgk=
=HghL
-----END PGP SIGNATURE-----

--jjUB96C1fTz4exbo--
