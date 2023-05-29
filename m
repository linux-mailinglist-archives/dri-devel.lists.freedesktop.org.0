Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D998714F4D
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 20:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3968F10E2DB;
	Mon, 29 May 2023 18:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E81810E2DA;
 Mon, 29 May 2023 18:20:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B45AF616BD;
 Mon, 29 May 2023 18:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29F19C433EF;
 Mon, 29 May 2023 18:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685384445;
 bh=AfMTqnV6KwWgP9v31k1mR5V6z9ajfdSJ5Uc7ep7WELc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qzcuUbHYXi5b8AieT0vvopPB8x1y0ptKWFGt7GXfu21AxNyp+wZAPEeRGfkTorgOK
 je+2oKlEhvKsX11vgIVBXgDnYu30Ja34yTAI691s/NNEEFB7GBjxy0E+xy9yh0CRix
 dkkSD+cO+Mb1ismH3JhFIKH1N38Kp7rBBxzJLvHnl1Knav9Dyc0GzTvlHUxzBvtSMw
 tlnyx6wejkhiE8Tdd0+LEkG4DpHzKaCNfl80r5/jWBzPisoCInzW04zNf9P1mS0nc+
 a4oYS49Pyy6mJoX25WxNvMML7wvIpEAw+Kdd2OCBv8jgC4ZOUXRxI6ip/C0P/p0Xvm
 ZUnfWL5yBmcZA==
Date: Mon, 29 May 2023 19:20:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Luca Weiss <luca@z3ntu.xyz>
Subject: Re: [PATCH 3/7] dt-bindings: display/msm: qcom,mdp5: Add msm8226
 compatible
Message-ID: <20230529-roundish-illusion-cceae48e06df@spud>
References: <20230308-msm8226-mdp-v1-0-679f335d3d5b@z3ntu.xyz>
 <20230308-msm8226-mdp-v1-3-679f335d3d5b@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fe9MgKxA38lwE2Ic"
Content-Disposition: inline
In-Reply-To: <20230308-msm8226-mdp-v1-3-679f335d3d5b@z3ntu.xyz>
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
Cc: freedreno@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, phone-devel@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--fe9MgKxA38lwE2Ic
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 29, 2023 at 11:44:00AM +0200, Luca Weiss wrote:
> Add the compatible for the MDP5 found on MSM8226.
>=20
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--fe9MgKxA38lwE2Ic
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHTs9gAKCRB4tDGHoIJi
0ocUAP9/IR/9aIDPmdHRZs6ORpYOiGSrg1oL9tZZ6WZEJZyfcwEA4SROMwhv0i2f
/mF0Fxr2WxYpLn4VIY5ctZx937GZCQw=
=u1qd
-----END PGP SIGNATURE-----

--fe9MgKxA38lwE2Ic--
