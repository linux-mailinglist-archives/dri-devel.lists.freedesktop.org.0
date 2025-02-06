Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 011AEA2ADE5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 17:34:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7942110E8C9;
	Thu,  6 Feb 2025 16:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gu7zYGA5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A8910E8C9
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 16:34:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BD5485C6568;
 Thu,  6 Feb 2025 16:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD1F8C4CEDD;
 Thu,  6 Feb 2025 16:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738859695;
 bh=+ivOAUv3shutbdSTgc0/oz/8/mZOlkgY1F9fFkCvfs0=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=gu7zYGA5Ha68MTmNlxhrXGN574w4P+3IrB6nJY6x6RCRin7jR2+BUffeyQCVyQg67
 oW8ak31pVFpVSGXhsDClOI6YtrD9/qezzRzEzmcd8/D3NYzad4cZ4fi0eOvJ/494Cw
 wPBO3uhkBDiaiU86eCnw57sqaxpHrVavnOJSTKLEadIx3e+n66hfBaexQQsJhQVzUV
 JhnaBJF471QlXMkwrEvInOngEHEi+lb6wG+HhT+sPwpw2njYwbp2aNjLOVvl+MoRzE
 4gdu9o8kDKwg4EJknCp+ftTdP9XhRKP+3WkWfJ7HAudTs0YHUXTb1wirn7KFRcHVKM
 eBG+69YkGgOZw==
Message-ID: <895aa2097cb7e57560c70ca53aba4abb@kernel.org>
Date: Thu, 06 Feb 2025 16:34:52 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>
Subject: Re: Re: [PATCH v8 13/19] MAINTAINERS: Add maintainer for i.MX8qxp
 Display Controller
In-Reply-To: <7a03ebbf-5ee3-45d3-a58c-8832bd0f8960@nxp.com>
References: <7a03ebbf-5ee3-45d3-a58c-8832bd0f8960@nxp.com>
Cc: agx@sigxcpu.org, airlied@gmail.com, aisheng.dong@nxp.com,
 conor+dt@kernel.org, devicetree@vger.kernel.org, dmitry.baryshkov@linaro.org,
 dri-devel@lists.freedesktop.org, festevam@gmail.com, francesco@dolcini.it,
 frank.li@nxp.com, imx@lists.linux.dev, kernel@pengutronix.de,
 kishon@kernel.org, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, p.zabel@pengutronix.de,
 robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org, simona@ffwll.ch,
 tglx@linutronix.de, tzimmermann@suse.de, u.kleine-koenig@baylibre.com,
 vkoul@kernel.org, "Maxime Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: 7bit
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

On Wed, 5 Feb 2025 10:39:10 +0800, Liu Ying wrote:
> Hi Dmitry, Maxime,
> 
> On 12/30/2024, Liu Ying wrote:
> > Add myself as the maintainer of i.MX8qxp Display Controller.
> > 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
