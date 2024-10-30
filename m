Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE17C9B6833
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 16:45:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F5F10E2C1;
	Wed, 30 Oct 2024 15:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="R5AsID29";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EFD010E2C1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 15:45:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4787FFF802;
 Wed, 30 Oct 2024 15:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730303126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pWAxgoZYI1pfmWshgDre1Pr8RFLo7+a26Y7vxVfIHVs=;
 b=R5AsID29kdZm6T6OFmy3YTQF0i6CamYjBF4kcpLGY2X7HguZU+U1Cx/cOMAEUUL9H0EyEp
 srmqG2enB4lrAeH2nAanmQnmFX6TwklnY2eUw81b/2b3w/Vd4g8UqkjPf9AhfL2wnS54vJ
 f/QUbr36Z/pElGRkmltqwET6e6mJwOCtamzGM43C+GK22FYCH5ASrTYhtjXNfjZoCCaEMq
 7OXpZ2In1bJ6qTMWckOiGMs8dEDs7Cs5/MMuTMPF+Fb7ZM06xcuVSqS0bFSiUs3Cw8pIwd
 2/myquTOrxvNS+RlzuzOpHruKCx34Wgk++J9DRrkOeOUIzG/2YOGnlc986+hOQ==
Date: Wed, 30 Oct 2024 16:45:24 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>
Cc: Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] MAINTAINERS: Remove myself as a VKMS maintainer
Message-ID: <ZyJUlP4jRpwb0NsU@louis-chauvet-laptop>
References: <20241014145009.3360515-1-mairacanal@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241014145009.3360515-1-mairacanal@riseup.net>
X-GND-Sasl: louis.chauvet@bootlin.com
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

On 14/10/24 - 11:50, Maíra Canal wrote:
> I haven't been able to properly review the work on the driver for a while.
> Hence, this commit removes me from the maintainers list.
> 
> Signed-off-by: Maíra Canal <mairacanal@riseup.net>

Acked-by: Louis Chauvet <louis.chauvet@bootlin.com>

Thanks,
Louis Chauvet

> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7d0b4335e263..23ac5fbf5e1c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7466,7 +7466,6 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	drivers/gpu/drm/udl/
>  
>  DRM DRIVER FOR VIRTUAL KERNEL MODESETTING (VKMS)
> -M:	Maíra Canal <mairacanal@riseup.net>
>  M:	Louis Chauvet <louis.chauvet@bootlin.com>
>  R:	Haneen Mohammed <hamohammed.sa@gmail.com>
>  R:	Simona Vetter <simona@ffwll.ch>
> -- 
> 2.46.2
> 
