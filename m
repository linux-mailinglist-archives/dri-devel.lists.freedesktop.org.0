Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EFF7E57BA
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 14:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E528210E74E;
	Wed,  8 Nov 2023 13:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE6510E74E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 13:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=huUjePIdE7+jopVnr7p4qD4S3goUHOxn+ZsTIkksxvo=; b=lCZ+pdvE7PmyHXN7wsVZiEbpht
 P32JiH1AZt3KuYCTem8gF38EGeYO2bUznfPX6x17Ng1EOVwQbSQ+OpF5WslnFgzT+lVCiVkeuhPK4
 454eSAnq7nlZrwLSbb97c8syrJrxmQDzVuSNUCPtdASen1kUz2wQrHwIijwZng/n6XiN7GZ40655b
 j2Ee3HzSpzqsfssFpFAmI6KcO2umiHYJFD1bNehlGypC74hYDkUEl+8XJnjt07soaSGZyLaF9xIIZ
 5ts6F8/2wy58cHOWUKcPKjJ40znAon5jWWYVM1LDX6/s5Aaynrw65DmiWOEUszhM5jKZK1IF++oEr
 g59PTbrQ==;
Received: from [102.213.205.115] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r0iFJ-000pqB-SK; Wed, 08 Nov 2023 14:05:26 +0100
Date: Wed, 8 Nov 2023 12:05:21 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH] MAINTAINERS: Add Maira to V3D maintainers
Message-ID: <20231108130333.azkvg5yqhdt45af3@mail.igalia.com>
References: <20231106134201.725805-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231106134201.725805-1-mcanal@igalia.com>
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
Cc: kernel-dev@igalia.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 Iago Toral <itoral@igalia.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/06, Maíra Canal wrote:
> I've been contributing to V3D with improvements, reviews, testing and
> debugging. Therefore, add myself as a co-maintainer of the V3D driver.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Acked-by: Melissa Wen <mwen@igalia.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f13e476ed803..3213563756cb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7108,6 +7108,7 @@ F:	drivers/gpu/drm/omapdrm/
>  DRM DRIVERS FOR V3D
>  M:	Emma Anholt <emma@anholt.net>
>  M:	Melissa Wen <mwen@igalia.com>
> +M:	Maíra Canal <mcanal@igalia.com>
>  S:	Supported
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> --
> 2.41.0
> 
