Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F853AF514
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 20:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96556E3AE;
	Mon, 21 Jun 2021 18:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1766E3AE
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 18:28:22 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 7d83b997-d2be-11eb-a36f-0050568cd888;
 Mon, 21 Jun 2021 18:28:35 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id EC66E194B7E;
 Mon, 21 Jun 2021 20:28:24 +0200 (CEST)
Date: Mon, 21 Jun 2021 20:28:18 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: Re: [RESEND PATCH 1/3] drm/panel: Add connector_type and bus_format
 for AUO G104SN02 V2 panel
Message-ID: <20210621182818.GA842708@ravnborg.org>
References: <20210621150930.86617-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621150930.86617-1-s.riedmueller@phytec.de>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stefan.

On Mon, Jun 21, 2021 at 05:09:28PM +0200, Stefan Riedmueller wrote:
> The AUO G104SN02 V2 is an LVDS display which supports 6 and 8 bpc PSWG.
> Add the corresponding connector type and 8 bpc as default bus_format.
> 
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Hi,
> I added the reviewed-by tag from Laurent Pinchart for the RESEND, hope
> that is ok.
> https://lore.kernel.org/dri-devel/YNChySKddg%2FJsMZv@pendragon.ideasonboard.com/
Thanks, thats a help so I did not have to add it.
All three patches applied to drm-misc-next now.

	Sam
