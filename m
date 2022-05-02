Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA261516A76
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 07:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BAC10F560;
	Mon,  2 May 2022 05:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEDCA10F560
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 05:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7fJ9FC3Qno5tFEUnlyBb3wmrZphQZEoyWWZfn7M02T0=; b=i2K4n7QytcnPYdEVTuJp2DmrS1
 OwuRYnwRkPAp6Er9QDXLfOjHvWhCVKtOugvv1YC1sFXT/o29MTZ0RwImZLvc/ZDGMr4/TE+LyBEZ5
 n01WDyP5B+Dt2PRGZoMkyvRv9RHGDed9buZ6+NZcj/NSNYwFOfOPj1mjH0G5y3xXWG4UA2Xe77OA6
 GrcuUmTzzDlbbEDGmcj8NPG87f51DsQB3/E/PA4+l2bpZv27uO9yHnl1zugWXQZBRwzmGhbdboja3
 93DS8X1iKMaC0797hW/w7znOAV+RA+8LiRliAi/MLbQnHc1thK0v9csNNxFIpnQq6oxkyDnQBa0JS
 tYfkJo5g==;
Received: from 217.49.60.213.dynamic.reverse-mundo-r.com ([213.60.49.217]
 helo=zeus) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nlP1i-000AQf-3V; Mon, 02 May 2022 07:55:18 +0200
Message-ID: <92ceb26a1477788763c9f8e532af9658dca2600d.camel@igalia.com>
Subject: Re: [PATCH] MAINTAINERS: add Melissa to V3D maintainers
From: Iago Toral <itoral@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Emma Anholt <emma@anholt.net>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>
Date: Mon, 02 May 2022 07:55:08 +0200
In-Reply-To: <20220429193317.ol3u4e5jpt5jucox@mail.igalia.com>
References: <20220429193317.ol3u4e5jpt5jucox@mail.igalia.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
Cc: jmcasanova@igalia.com, jasuarez@igalia.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Iago Toral Quiroga <itoral@igalia.com>

On Fri, 2022-04-29 at 18:33 -0100, Melissa Wen wrote:
> I've been contributing to v3d through improvements, reviews, testing,
> debugging, etc. So, I'm adding myself as a co-maintainer of the V3D
> driver.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9b2b0dc44506..0a854b7f2491 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6714,6 +6714,7 @@ F:	drivers/gpu/drm/omapdrm/
>  
>  DRM DRIVERS FOR V3D
>  M:	Emma Anholt <emma@anholt.net>
> +M:	Melissa Wen <mwen@igalia.com>
>  S:	Supported
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml

