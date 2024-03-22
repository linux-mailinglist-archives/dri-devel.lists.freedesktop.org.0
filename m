Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53797886B51
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 12:34:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D0810ED2C;
	Fri, 22 Mar 2024 11:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="okH1hJuq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com
 [95.215.58.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C524A10ED2C
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 11:34:05 +0000 (UTC)
Message-ID: <3140f17b-f7b4-4705-877f-df2c0af460d2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1711107243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t678LVHSCoxay4XYSJ0VwadhX/XRd8hTe6DYJoC6mOo=;
 b=okH1hJuq01MrIEXSupw5A53MiUW/2sSEI/CQAe86vH5rhfU/RMX0OWgs5aFfX1JjGmV2GW
 SLYsrw6Wch8TknYz3eqO+exU46APFpUXiNS0KqhsZ8WqnLI/kjuUBetNm2TSieVCaO4XK3
 p0X42SIwucnQ0gwKMSL3lOtd9lGMAVM=
Date: Fri, 22 Mar 2024 19:33:56 +0800
MIME-Version: 1.0
Subject: Re: [next] drm/gma500: Fix spelling mistake "patter" -> "pattern"
To: Colin Ian King <colin.i.king@gmail.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240314163511.2372458-1-colin.i.king@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240314163511.2372458-1-colin.i.king@gmail.com>
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


On 2024/3/15 00:35, Colin Ian King wrote:
> There is a spelling mistake in a DRM_DEBUG_KMS message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>


Reviewed-by:Sui Jingfeng <sui.jingfeng@linux.dev>

-- 
Best regards,
Sui

