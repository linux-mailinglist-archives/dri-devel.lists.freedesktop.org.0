Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E864C35E6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 20:30:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A6710E13A;
	Thu, 24 Feb 2022 19:30:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2-1.smtp.larsendata.com (mx2-1.smtp.larsendata.com
 [91.221.196.218])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05BB310E13A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 19:30:09 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 37e75c49-95a8-11ec-b2df-0050568cd888;
 Thu, 24 Feb 2022 19:30:26 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id BDB88194B5A;
 Thu, 24 Feb 2022 20:30:10 +0100 (CET)
Date: Thu, 24 Feb 2022 20:30:03 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v5 2/5] drm/modes: Remove trailing whitespace
Message-ID: <Yhfcu44V5LO4qZ/9@ravnborg.org>
References: <20220224152708.14459-1-noralf@tronnes.org>
 <20220224152708.14459-3-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220224152708.14459-3-noralf@tronnes.org>
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
Cc: devicetree@vger.kernel.org, david@lechnology.com,
 dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 24, 2022 at 04:27:05PM +0100, Noralf Trønnes wrote:
> Remove trailing whitespace from a comment.
> 
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/drm_modes.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index 96b13e36293c..77a4c8dd0bb8 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -127,7 +127,7 @@ EXPORT_SYMBOL(drm_mode_probed_add);
>   * according to the hdisplay, vdisplay, vrefresh.
>   * It is based from the VESA(TM) Coordinated Video Timing Generator by
>   * Graham Loveridge April 9, 2003 available at
> - * http://www.elo.utfsm.cl/~elo212/docs/CVTd6r1.xls 
> + * http://www.elo.utfsm.cl/~elo212/docs/CVTd6r1.xls
>   *
>   * And it is copied from xf86CVTmode in xserver/hw/xfree86/modes/xf86cvt.c.
>   * What I have done is to translate it by using integer calculation.
> -- 
> 2.33.0
