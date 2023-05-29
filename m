Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9874B714F42
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 20:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A278510E013;
	Mon, 29 May 2023 18:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B713410E013;
 Mon, 29 May 2023 18:20:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A6A8C61A40;
 Mon, 29 May 2023 18:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A9D2C433D2;
 Mon, 29 May 2023 18:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685384424;
 bh=7MpIpDU1CNrNOt/ZqprpU9B3GzC0GmpemsVfLWbSRfY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FQBSoGk13CHPbD1i+HoYN6Fd98SK4Kx5bnt7Ri64EZ6xyz5Q693vqQtrt6z8lR/z0
 eynffBTcoPELDuQHSHHIdBh9jBP6/PfhK+SUpBnITDG4kT/h7XqSUd+tEFXEs4vLAi
 bLhAvNEqRZpg+JIeDf01H/W6jN0sK33G9x5DspLs8QuFfuYMd8BBoW5ivH1xTQyuZu
 Kj7vGzaWAlW7LKpRnJG5hNeoUw/UOnuDYHN+bkkrtsZDcTY17vQABztP4CLytE2C+9
 YRvRSTSBtVHteNCsXxzSTvZUjX/Rqe+mOAaqygHHI7wc/J1LMA1C3jobFC2CFxlIBb
 yZ86Z+RUIJrwA==
Date: Mon, 29 May 2023 19:20:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Luca Weiss <luca@z3ntu.xyz>
Subject: Re: [PATCH 2/7] dt-bindings: display/msm: dsi-controller-main: Add
 msm8226 compatible
Message-ID: <20230529-opossum-powdered-b60cc970f512@spud>
References: <20230308-msm8226-mdp-v1-0-679f335d3d5b@z3ntu.xyz>
 <20230308-msm8226-mdp-v1-2-679f335d3d5b@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KvERIVUtKpYboQE3"
Content-Disposition: inline
In-Reply-To: <20230308-msm8226-mdp-v1-2-679f335d3d5b@z3ntu.xyz>
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


--KvERIVUtKpYboQE3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 29, 2023 at 11:43:59AM +0200, Luca Weiss wrote:
> Add the compatible for the DSI found on MSM8226.
>=20
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--KvERIVUtKpYboQE3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHTs4QAKCRB4tDGHoIJi
0gJxAP9g6+VXCSHKqz1Dcy+kVMyFENy8a9usGNKOXK3mcW573QEAzDGitMkl6s4w
uEoqf99Wl2Wpn+Nz3yXyk0bHQnA0ow8=
=9WvT
-----END PGP SIGNATURE-----

--KvERIVUtKpYboQE3--
