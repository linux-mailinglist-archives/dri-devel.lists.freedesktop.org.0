Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 096858D61E2
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 14:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F286210E12F;
	Fri, 31 May 2024 12:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Vj5OC9oR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com
 [91.218.175.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC8F10E12F
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 12:37:30 +0000 (UTC)
X-Envelope-To: sam@ravnborg.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1717159047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yczjo5MHTimOXgq3FrdmWsC2nWS5tf5pOmPXVNbEEh8=;
 b=Vj5OC9oR/S7PepOfHJvU3Roy1WRI+uGfLZwUGERuxcuV2XBRPFT2Vhd++AiQpcBDZtVDUQ
 nfFvPUIMwlglAibBd1moguVpJJRfkrhKnAvPOim0K+0CNGdNv5TrG/Fu8c1/bVrjHa5L71
 O3SV59q0skUBpft6b4faG4sN5B6MFfE=
X-Envelope-To: dri-devel@lists.freedesktop.org
Message-ID: <daece23f-031e-4d8a-8805-08206061b569@linux.dev>
Date: Fri, 31 May 2024 20:37:18 +0800
MIME-Version: 1.0
Subject: Re: MAINTAINERS: drm: Drop sam as panel reviewer
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
References: <20240530211402.GA1660596@ravnborg.org>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240530211402.GA1660596@ravnborg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi,

On 5/31/24 05:14, Sam Ravnborg wrote:
> Drop myself as reviewer of panel patches, to reflect the reality.


We lost one kindness reviewer for drivers of panel, unhappy!
Not sure if it is proper to give you a NAK here. :(

Best regards,
Sui

> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   MAINTAINERS | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ac285040578e..38978699bef5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7567,7 +7567,6 @@ F:	include/drm/gpu_scheduler.h
>   DRM PANEL DRIVERS
>   M:	Neil Armstrong <neil.armstrong@linaro.org>
>   R:	Jessica Zhang <quic_jesszhan@quicinc.com>
> -R:	Sam Ravnborg <sam@ravnborg.org>
>   L:	dri-devel@lists.freedesktop.org
>   S:	Maintained
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git


