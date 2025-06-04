Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CB1ACE5BA
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 22:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D296710E1E0;
	Wed,  4 Jun 2025 20:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lQFxG6UP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A5310E1E0;
 Wed,  4 Jun 2025 20:23:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 376065C5788;
 Wed,  4 Jun 2025 20:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37247C4CEE4;
 Wed,  4 Jun 2025 20:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749068593;
 bh=5GFhbHqFprf6AI7bpRC7glklZOYiHyJKzCGuN9tSXF4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lQFxG6UP3Zn447X6eKMhgJY9o7q9BOtJYaQtUZQK881d8Xqao0SDklxonXgKbm/Vi
 CUPdpGxmzsBQyb3MZCHxf/af40CVu1AYpzrDQKB/4hqJMsGaA7nR42DiyXMNEWXAmF
 SQ7zEQBOZe0FIhqIzcztS0EfhLOeZJAMMlb/CPFluzxLymhJETgIcffgDv5wMv9Yv2
 uFELbAXfnVPgT7q7eTUJgqspIcY3kyDASOLLkcYNvd/Z0FrzfFhoo/kvySTHX8L+iN
 rp9zQSvc9VSkwyDnF+azqrfR5RVkDBT52V4vrqEKikFdlAJvrC9BkV0mJyU9f3gGmD
 jmxz7klL6Iqmw==
Date: Wed, 4 Jun 2025 15:23:11 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>, 
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: .mailmap: update Rob Clark's email address
Message-ID: <gqlhinly7mkos5ejypbhjzyefcrevok4unz7qlmwngx742p37n@hiuyb55tbncb>
References: <20250604175600.89902-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604175600.89902-1-robdclark@gmail.com>
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

On Wed, Jun 04, 2025 at 10:55:58AM -0700, Rob Clark wrote:
> From: Rob Clark <robin.clark@oss.qualcomm.com>
> 
> Remap historical email addresses to @oss.qualcomm.com.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Welcome,
Bjorn

> ---
>  .mailmap    | 2 ++
>  MAINTAINERS | 6 +++---
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/.mailmap b/.mailmap
> index 6a6aa09e244b..b72a164280ea 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -633,6 +633,8 @@ Richard Genoud <richard.genoud@bootlin.com> <richard.genoud@gmail.com>
>  Richard Leitner <richard.leitner@linux.dev> <dev@g0hl1n.net>
>  Richard Leitner <richard.leitner@linux.dev> <me@g0hl1n.net>
>  Richard Leitner <richard.leitner@linux.dev> <richard.leitner@skidata.com>
> +Rob Clark <robin.clark@oss.qualcomm.com> <robdclark@chromium.org>
> +Rob Clark <robin.clark@oss.qualcomm.com> <robdclark@gmail.com>
>  Robert Foss <rfoss@kernel.org> <robert.foss@linaro.org>
>  Rocky Liao <quic_rjliao@quicinc.com> <rjliao@codeaurora.org>
>  Rodrigo Siqueira <siqueira@igalia.com> <rodrigosiqueiramelo@gmail.com>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ee57fc5d48f8..5dd1a3234cc5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7567,7 +7567,7 @@ F:	Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
>  F:	drivers/gpu/drm/tiny/panel-mipi-dbi.c
>  
>  DRM DRIVER for Qualcomm Adreno GPUs
> -M:	Rob Clark <robdclark@gmail.com>
> +M:	Rob Clark <robin.clark@oss.qualcomm.com>
>  R:	Sean Paul <sean@poorly.run>
>  R:	Konrad Dybcio <konradybcio@kernel.org>
>  L:	linux-arm-msm@vger.kernel.org
> @@ -7586,7 +7586,7 @@ F:	drivers/gpu/drm/msm/registers/adreno/
>  F:	include/uapi/drm/msm_drm.h
>  
>  DRM DRIVER for Qualcomm display hardware
> -M:	Rob Clark <robdclark@gmail.com>
> +M:	Rob Clark <robin.clark@oss.qualcomm.com>
>  M:	Abhinav Kumar <quic_abhinavk@quicinc.com>
>  M:	Dmitry Baryshkov <lumag@kernel.org>
>  R:	Sean Paul <sean@poorly.run>
> @@ -20287,7 +20287,7 @@ F:	drivers/soc/qcom/icc-bwmon.c
>  F:	drivers/soc/qcom/trace_icc-bwmon.h
>  
>  QUALCOMM IOMMU
> -M:	Rob Clark <robdclark@gmail.com>
> +M:	Rob Clark <robin.clark@oss.qualcomm.com>
>  L:	iommu@lists.linux.dev
>  L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
> -- 
> 2.49.0
> 
> 
