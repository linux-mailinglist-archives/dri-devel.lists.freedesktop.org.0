Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDE7916DFD
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 18:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C066910E6BE;
	Tue, 25 Jun 2024 16:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QgrbfoR9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88DC110E6BE
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 16:24:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8CCEACE1C22;
 Tue, 25 Jun 2024 16:24:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6CDCC32782;
 Tue, 25 Jun 2024 16:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719332665;
 bh=0QVvKqcwgvS3lPG925rDyCTxG1L91/pvChBSPlVGGlk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QgrbfoR9nl2pf3YsCEgrLtdYt03TOkClt+FHBwHFR27IogxDz+3H6bpqD2iTpit0H
 r8rAFweOKMdxn8aZsuL+PStcyMdasMLpNV/r99zDsMTymo3xfz/AYpu/J5aKUyp4MT
 VrZ4wORBzDUXVpLwH5yqjQamuBYnA+kuYQ90mmHD21V0sK0tq8LhHfFA4j9pal4umo
 eMawEEGfDCt55o1ZQuST4Q47ubrYnEmxar8PWtBtPALlGnvdcTCL8EwAG5Y8nd4Twv
 b54dKfaPzXX8CTcXIrFrakXDN4xjjW+7EwUtI1ilHxqzOSRDPv69JxFMJg/ucAoKEN
 R7xCWWCwiKKBg==
Date: Tue, 25 Jun 2024 17:24:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: add prefix for lincoln
Message-ID: <20240625-almighty-bunkbed-b86cc81b6f7d@spud>
References: <20240625142552.1000988-1-jbrunet@baylibre.com>
 <20240625142552.1000988-2-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tCHnCQa5ruuYmpM7"
Content-Disposition: inline
In-Reply-To: <20240625142552.1000988-2-jbrunet@baylibre.com>
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


--tCHnCQa5ruuYmpM7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 04:25:48PM +0200, Jerome Brunet wrote:
> Lincoln Technology Solutions is a design services and LCD integration
> company
>=20
> Link: https://lincolntechsolutions.com/
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--tCHnCQa5ruuYmpM7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnrvNAAKCRB4tDGHoIJi
0g6/AP9AwuiZKpmnLuQ+xLr4pB+Cp+y6NaM5yxpKRxqmfPhOIwD+OzslrIUxoNK7
obIe+hNh/+QUSpatoLxVBdcVucPlKAE=
=my+1
-----END PGP SIGNATURE-----

--tCHnCQa5ruuYmpM7--
