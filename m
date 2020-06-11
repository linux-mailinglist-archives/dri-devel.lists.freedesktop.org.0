Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D29E1F6DC8
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 21:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36D16E1B8;
	Thu, 11 Jun 2020 19:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FACC6E1B8
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 19:11:10 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id BC42B5C8F7A;
 Thu, 11 Jun 2020 21:11:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1591902667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ATNrMoOCpot31bSx/AeWJcCLOucIwzYd5rPz6P5oikM=;
 b=ktYVPV7FMUQDO3g9I2y/g+lHQzVG2SFIX1KuHdEtgPb172y294eALCkRExzhrAG39abMRD
 POsI808Gjtp5nxXI5QzSLYAeb18LkhnfX4P+a9a9KNTjD0Y64cB7gOMN1wHt3lkG1HXv+2
 aBAVkr+3GwhoEM6A0V2ja2SK0a6GF3I=
MIME-Version: 1.0
Date: Thu, 11 Jun 2020 21:11:06 +0200
From: Stefan Agner <stefan@agner.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 21/22] drm: mxsfb: Remove unnecessary spaces after tab
In-Reply-To: <20200530031015.15492-22-laurent.pinchart@ideasonboard.com>
References: <20200530031015.15492-1-laurent.pinchart@ideasonboard.com>
 <20200530031015.15492-22-laurent.pinchart@ideasonboard.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <0386007735113375f4dc6574a3abfb63@agner.ch>
X-Sender: stefan@agner.ch
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
Cc: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
 linux-imx@nxp.com, kernel@pengutronix.de, robert.chiras@nxp.com,
 leonard.crestez@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-05-30 05:10, Laurent Pinchart wrote:
> This is a cosmetic change only, no code change is included.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Stefan Agner <stefan@agner.ch>

> ---
>  drivers/gpu/drm/mxsfb/mxsfb_drv.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> index 607a6a5e6be3..f883b56caed3 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> @@ -16,11 +16,11 @@
>  struct clk;
>  
>  struct mxsfb_devdata {
> -	unsigned int	 transfer_count;
> -	unsigned int	 cur_buf;
> -	unsigned int	 next_buf;
> -	unsigned int	 hs_wdth_mask;
> -	unsigned int	 hs_wdth_shift;
> +	unsigned int	transfer_count;
> +	unsigned int	cur_buf;
> +	unsigned int	next_buf;
> +	unsigned int	hs_wdth_mask;
> +	unsigned int	hs_wdth_shift;
>  };
>  
>  struct mxsfb_drm_private {
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
