Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A27CA6B005D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 09:00:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9102D10E5A6;
	Wed,  8 Mar 2023 08:00:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 460 seconds by postgrey-1.36 at gabe;
 Wed, 08 Mar 2023 07:41:57 UTC
Received: from h-241.webit.at (h-241.webit.at [213.208.138.241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62ED610E59E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 07:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=winischhofer.net; s=rsa1; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=np2VeMjbFObtnEPKwHULGC9atl9R6YcO1ecS1ymUv9w=; b=NUwKJgdS/D7HyEhaJ8BQic2610
 7+RzyW6H8ns30uSFexbfPEAN/sZmaUUhdOrMqW6MOsmLpfXt2V8OJ4TZN9gL6jmeInz+uWDFvoD76
 ZH0lD4Cvw/nABr5LHHynklz8et3O2M0VWK53cd7qFfOeFvoXt3SGiPKiMlJdOT9IyMwU=;
Message-ID: <59fee461-5aa5-dc66-2470-df55eaf0fe76@winischhofer.net>
Date: Wed, 8 Mar 2023 08:33:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH] MAINTAINERS: orphan SIS FRAMEBUFFER DRIVER
Content-Language: en-US
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230308071921.10963-1-lukas.bulwahn@gmail.com>
From: Thomas Winischhofer <thomas@winischhofer.net>
In-Reply-To: <20230308071921.10963-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 08 Mar 2023 08:00:29 +0000
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Confirm.

/Thomas


On 08.03.23 08:19, Lukas Bulwahn wrote:
> This was triggered by the fact that the webpage:
> 
>   http://www.winischhofer.net/linuxsisvga.shtml
> 
> cannot be reached anymore.
> 
> Thomas Winischhofer is still reachable at the given email address, but he
> has not been active since 2005.
> 
> Mark the SIS FRAMEBUFFER DRIVER as orphan to reflect the current state.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  MAINTAINERS | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5d8f46f35aa4..354577534aef 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19191,9 +19191,7 @@ W:	http://www.brownhat.org/sis900.html
>  F:	drivers/net/ethernet/sis/sis900.*
>  
>  SIS FRAMEBUFFER DRIVER
> -M:	Thomas Winischhofer <thomas@winischhofer.net>
> -S:	Maintained
> -W:	http://www.winischhofer.net/linuxsisvga.shtml
> +S:	Orphan
>  F:	Documentation/fb/sisfb.rst
>  F:	drivers/video/fbdev/sis/
>  F:	include/video/sisfb.h
