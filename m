Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A861B51218
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 11:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0782210E8A3;
	Wed, 10 Sep 2025 09:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xx87bPCY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6440010E8A3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 09:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757495046; x=1789031046;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/dQKJ415JA64orSCrpw3lxTglpk0aRMAoLgsvAO2BU8=;
 b=Xx87bPCYKGbxVQqT9VrrJjnUnJucOQz0vHv2MwxUZLo5sb0Sb8VN9InN
 3qNM8azioqCwPs9CkA0vDOsdZ2JT8Y3bZaRsraRmusJz1onrCFWTffRLH
 ChqjanvgIjiVSg73JVUIxJmDoO/DONWIxOxFXxgR5mkk9Yc234Wehq+DR
 0lOawfGDENeLNurn+Aa2HHH3dklA2zqDzDOe4DEG0+2xJPkv4hAmkE0ff
 hBcilHOJLete3A76tOsUjU+mGETG40kacRS0H5BfB6EUIP26CSSTDVpoS
 PjR2FRwhAQ5PvRrYukmvX78wq6bcW8I75hcRp8m5s/FX60MFypSacLsdp g==;
X-CSE-ConnectionGUID: KYMCdHlhQb2tKN7qO1JPLA==
X-CSE-MsgGUID: /QI9DqTbTWCo83PgBih4tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="63428177"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="63428177"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 02:04:06 -0700
X-CSE-ConnectionGUID: reF0l9NjTYmXGn0TJFLNvQ==
X-CSE-MsgGUID: VJKW6NOWRPmqa6iPE/qj2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="177662970"
Received: from unknown (HELO [10.217.180.72]) ([10.217.180.72])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 02:04:04 -0700
Message-ID: <3177f73e-8cd8-43bb-b2b8-4f7b67682420@linux.intel.com>
Date: Wed, 10 Sep 2025 11:04:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Remove Jacek Lawrynowicz as intel_vpu
 maintainer
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com,
 maciej.falkowski@linux.intel.com
References: <20250910085526.230458-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250910085526.230458-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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

Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>

On 9/10/2025 10:55 AM, Jacek Lawrynowicz wrote:
> Remove myself from the intel_vpu driver maintainer list as I'm
> moving to another company. Time to let someone else deal with
> the NPU bugs while I pretend to know what I'm doing elsewhere!
>
> Thanks to everyone for the great collaboration (and for putting up
> with my creative interpretations of what "minor fixes" means).
>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 402fe14091f15..8f8c91144cc2d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7490,7 +7490,6 @@ F:	drivers/soc/ti/smartreflex.c
>  F:	include/linux/power/smartreflex.h
>  
>  DRM ACCEL DRIVERS FOR INTEL VPU
> -M:	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>  M:	Maciej Falkowski <maciej.falkowski@linux.intel.com>
>  M:	Karol Wachowski <karol.wachowski@linux.intel.com>
>  L:	dri-devel@lists.freedesktop.org
