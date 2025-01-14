Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B69CAA1028B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 10:00:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B305C10E892;
	Tue, 14 Jan 2025 09:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aCpw5Jgr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2942410E892
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 09:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736845229; x=1768381229;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yZ5d/nVqx+qpgL3lDMpIGr7gNyZD1ymCo91Kc3S/cQ8=;
 b=aCpw5JgrdcfZFMbX+CZUbXz9ijzTlTxvinD7aiPnENwJnnTpgEtEA1H7
 N/4A4k4gX7sR5RBuUo8WOnzkT6jAEF+dQCp+Fu6SuOvZ4XzDhi3aNRi90
 /ciIybvg3+3J4Vmqn1YSQ0iE9RQU22ovPY8u2Mk2eRyDLC7AgTbDOTcx0
 tNaWAshQOFQn+/dsVSG8ssrNvaixg/uuZTlrHNQSO2YNAqj4UFsZEQISX
 0E0L+2Pk/XplQtRsMQbRqor6ogV6Lc/3+CkasvZ6gVk+cZ6GryjPkOi/s
 uwmsb0cmZtKNnK630kMwu/btPIvjObesZNACvvGUwd+Ekp8+hFgJ/9Lyi A==;
X-CSE-ConnectionGUID: U0D2+halQS+F0cfivX56qw==
X-CSE-MsgGUID: xoiptFGgTVCgeR7yMOi6CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="54673576"
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; d="scan'208";a="54673576"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 01:00:28 -0800
X-CSE-ConnectionGUID: w0hQc6OASnyj2VnoSscjEA==
X-CSE-MsgGUID: JwRIWBirQ56g30/g9V5d4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109372467"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.85.43])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 01:00:27 -0800
Date: Tue, 14 Jan 2025 10:00:24 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, oded.gabbay@gmail.com,
 quic_jhugo@quicinc.com, maciej.falkowski@linux.intel.com
Subject: Re: [PATCH] MAINTAINERS: Update intel_vpu maintainer list
Message-ID: <Z4YnqBXfJAc7Xmsy@linux.intel.com>
References: <20250114084436.1326127-1-jacek.lawrynowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114084436.1326127-1-jacek.lawrynowicz@linux.intel.com>
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

On Tue, Jan 14, 2025 at 09:44:36AM +0100, Jacek Lawrynowicz wrote:
> Slawek moved to another project and Maciej will be replacing him.
> 
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 33fe500bf3ae6..8f2a266a6c404 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7054,7 +7054,7 @@ F:	include/linux/power/smartreflex.h
>  
>  DRM ACCEL DRIVERS FOR INTEL VPU
>  M:	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> -M:	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> +M:	Maciej Falkowski <maciej.falkowski@linux.intel.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Supported
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> -- 
> 2.45.1
> 
