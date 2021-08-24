Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBE73F6A24
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 21:59:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14AE16E0CD;
	Tue, 24 Aug 2021 19:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0E66E0CD
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 19:59:13 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id b7f3984d-0515-11ec-b37b-0050568c148b;
 Tue, 24 Aug 2021 19:58:58 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 6FFFA194B3F;
 Tue, 24 Aug 2021 21:59:21 +0200 (CEST)
Date: Tue, 24 Aug 2021 21:59:04 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Stephan Gerhold <stephan@gerhold.net>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/panel: Add Sony Tulip Truly NT35521 driver
Message-ID: <YSVPiBLrZMQDURPJ@ravnborg.org>
References: <20210809051008.6172-1-shawn.guo@linaro.org>
 <20210809051008.6172-3-shawn.guo@linaro.org>
 <20210824025831.GB22595@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210824025831.GB22595@dragon>
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

On Tue, Aug 24, 2021 at 10:58:31AM +0800, Shawn Guo wrote:
> On Mon, Aug 09, 2021 at 01:10:08PM +0800, Shawn Guo wrote:
> > It adds a DRM panel driver for Sony Tulip Truly NT35521 5.24" 1280x720
> > DSI panel, which can be found on Sony Xperia M4 Aqua phone.  The panel
> > backlight is managed through DSI link.
> > 
> > The driver is built using linux-mdss-dsi-panel-driver-generator[1], and
> > additionally modeling the 5V control GPIOs with regulators and adding
> > Backlight GPIO support.
> > 
> > [1] https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
> > 
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> 
> Sam, Stephan,
> 
> Thank you for the review comments on v1!  How does v2 look to you?

I will not have time until next week - sorry.
Please ping me if you have no feedback i one week from now.

	Sam
