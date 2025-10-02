Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1E5BB4E1C
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 20:32:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422D510E841;
	Thu,  2 Oct 2025 18:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="U/ut6hEz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B4910E37E;
 Thu,  2 Oct 2025 18:32:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3507C44D39;
 Thu,  2 Oct 2025 18:32:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9772AC4CEF4;
 Thu,  2 Oct 2025 18:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759429973;
 bh=8/EctaIvBAC4cuOpvHH7s9ZrDbZHwtpR0omC5FZZBJc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U/ut6hEzMveKDfP1w2YF2/WvXNMyUgcHPL6lK+hHXTgdYeSL6hzlK25tI27Ek0lxY
 +WuOKlGfs4vaTzEjE33ZoSQJnRI2QV9ZrWsuDq2B2mTrWF1Z48jpuU0DRusRz3Nn3X
 sd+ceB0d5G0rS8ERJVSqcM9FzN3hwmFVTzFNprOwoyeQ81ftIbze5BVRnLLOdB59Xv
 RV4RMsmHAgDIflo7o9sxWG0yp71Zy+Y/QhFEmAvY9WQC+742pCNEUOQsTwNnfn2kt/
 tnnay0NbOFGKQpbxMTkW5vXFGfGwlH5puer2zLUA6/ZwOcDZSh1WzgmMgZ1WubKlSe
 N07tJypzsRxug==
Date: Thu, 2 Oct 2025 19:32:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Junjie Cao <caojunjie650@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>,
 Eugene Lepshy <fekz115@gmail.com>, Jun Nie <jun.nie@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH 1/3] dt-bindings: display: panel: Add Novatek NT36532
Message-ID: <20251002-winking-dominion-2494f66a1e3b@spud>
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-2-caojunjie650@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3Z1VwQ8rSct1DuFI"
Content-Disposition: inline
In-Reply-To: <20251001135914.13754-2-caojunjie650@gmail.com>
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


--3Z1VwQ8rSct1DuFI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--3Z1VwQ8rSct1DuFI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaN7FTgAKCRB4tDGHoIJi
0iBjAQC5DDfCt/kJwQ2LJdvzcDtHWODcXvYqbKvn4pox8Y/dHgEAqlSPz6kDyXf6
fRIKaTdO3qWuO005Ae9eLxfA8mqhTg4=
=tVsY
-----END PGP SIGNATURE-----

--3Z1VwQ8rSct1DuFI--
