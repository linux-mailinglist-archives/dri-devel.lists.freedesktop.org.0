Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E777E560A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 13:17:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDEBE10E092;
	Wed,  8 Nov 2023 12:16:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4219C10E092
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 12:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gg1q9DQ21z6IRh05uI+45mwYOd+Yr5UGUt45/vxqkCY=; b=S4ewky4O/Kc+LOveKN7sfq9koU
 tJHgH2QeNSIQrASqBeIAKL8h/IsoByPgOx4G3brA5KL9H/xqVnB/izhLcVf8p5rDVxpyhDBvQ1Qdd
 EZTMG2hNys31wPZA6CUYw91T3ZoyBHFUdtqf6n/SRWyaw1VXX5ruEKxKFu9Ip0LWxDbGwcwXb3rAX
 MDdC1RvzcuksF7ITAoBIX6JB7ok4qWlqWLc1XeZbd6vj/wnEwb3zaZIeS3RoUyUlNfaqNvWW8C6GE
 UT05PaUIKG1VOnFmvyCYrhh2HRqHUKlpEFjaA001rSiUmNptanpbNMgeLlXY3sw/b5k469BCw0SFH
 MD42bD9A==;
Received: from gwsc.sc.usp.br ([143.107.225.16] helo=[172.20.23.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1r0hUK-000ojV-Iq; Wed, 08 Nov 2023 13:16:52 +0100
Message-ID: <a6d0d715-30b3-16bc-ed6a-2424edd13a6a@igalia.com>
Date: Wed, 8 Nov 2023 09:16:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] MAINTAINERS: Drop Emma Anholt from all M lines.
To: Emma Anholt <emma@anholt.net>, dri-devel@lists.freedesktop.org
References: <20231031181648.48675-1-emma@anholt.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20231031181648.48675-1-emma@anholt.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 10/31/23 15:16, Emma Anholt wrote:
> I am not active in the Linux kernel and don't want to see patches.
> 
> Signed-off-by: Emma Anholt <emma@anholt.net>

Applied to drm-misc/drm-misc-next!

Thanks,
- Maíra

> ---
>   MAINTAINERS | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 01fb9ee6b951..31854c48711e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5378,7 +5378,6 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>   F:	drivers/gpu/drm/sun4i/sun8i*
>   
>   DRM DRIVER FOR ARM PL111 CLCD
> -M:	Eric Anholt <eric@anholt.net>
>   S:	Supported
>   T:	git git://anongit.freedesktop.org/drm/drm-misc
>   F:	drivers/gpu/drm/pl111/
> @@ -5441,7 +5440,6 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>   F:	drivers/gpu/drm/tiny/gm12u320.c
>   
>   DRM DRIVER FOR HX8357D PANELS
> -M:	Eric Anholt <eric@anholt.net>
>   S:	Maintained
>   T:	git git://anongit.freedesktop.org/drm/drm-misc
>   F:	Documentation/devicetree/bindings/display/himax,hx8357d.txt
> @@ -5883,7 +5881,6 @@ F:	Documentation/devicetree/bindings/display/ti/
>   F:	drivers/gpu/drm/omapdrm/
>   
>   DRM DRIVERS FOR V3D
> -M:	Eric Anholt <eric@anholt.net>
>   S:	Supported
>   T:	git git://anongit.freedesktop.org/drm/drm-misc
>   F:	Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.txt
> @@ -5891,7 +5888,6 @@ F:	drivers/gpu/drm/v3d/
>   F:	include/uapi/drm/v3d_drm.h
>   
>   DRM DRIVERS FOR VC4
> -M:	Eric Anholt <eric@anholt.net>
>   S:	Supported
>   T:	git git://github.com/anholt/linux
>   T:	git git://anongit.freedesktop.org/drm/drm-misc
