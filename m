Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E57B5A104
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 21:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0FBC10E12C;
	Tue, 16 Sep 2025 19:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Xpoy/I++";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D17810E12C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 19:11:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5119A601B3;
 Tue, 16 Sep 2025 19:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84F31C4CEEB;
 Tue, 16 Sep 2025 19:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758049908;
 bh=77LfXigEtGlbgD9o+XCEovUBSCV7wv0QPbV2QyOTQ74=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xpoy/I++lGP4rRlLa+mbG+YXAQcVFWba92OSiuz6fksltvX59u6uUZiU0MqRbTAK4
 1bBEGJ5alG/ARQintuFBaRx1v6jb4L3uM0Go0xzo/kVYZPPhRDst4UV6WSA/dwwTdP
 nO/PhE/kIHj66LcLqrfIG9I69x00Qs6nB+oQL8/7weTODHjg/H9m19IYSzU5DXpntC
 3iAK7sufS9Bm5+zkzenff1IJb57AJMbWOqgRjtRQl4H0wFjNqDh6rITBoFnlV4tTvU
 SHnrlYB+kV0ZGUOSKCU/ypaBBNX7DPRuLSXUtdHglNa/v74nG7lyib5pNTq//6E5Is
 01JquE6PHMfuA==
Date: Tue, 16 Sep 2025 20:11:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
 Amir Dahan <system64fumo@protonmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: display: panel: panel-simple: Add
 lg,sw49410 compatible
Message-ID: <20250916-lazily-postage-f673a5cc6a26@spud>
References: <20250915-judyln-panel-v2-0-01ab2199fea5@postmarketos.org>
 <20250915-judyln-panel-v2-3-01ab2199fea5@postmarketos.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="0DFJbOukSxWiYyHE"
Content-Disposition: inline
In-Reply-To: <20250915-judyln-panel-v2-3-01ab2199fea5@postmarketos.org>
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


--0DFJbOukSxWiYyHE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--0DFJbOukSxWiYyHE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMm2bgAKCRB4tDGHoIJi
0saIAP0Se5/ZuR1n68jiyM3j4srO+TBLhsWyZ2N+aqiYkKml6gEA2nMhDo+He3bJ
NbVdDObz6e5yqG1+j59AkbmHVZCkuwk=
=rbRy
-----END PGP SIGNATURE-----

--0DFJbOukSxWiYyHE--
