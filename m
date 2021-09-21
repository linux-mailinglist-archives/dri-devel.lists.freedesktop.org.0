Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F90A412E25
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 07:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C1F6E8F7;
	Tue, 21 Sep 2021 05:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E385A6E8F7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 05:20:37 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id a0e785cb-1a9b-11ec-a02a-0050568c148b;
 Tue, 21 Sep 2021 05:20:26 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 2C96A194BE2;
 Tue, 21 Sep 2021 07:20:27 +0200 (CEST)
Date: Tue, 21 Sep 2021 07:20:32 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Philip Chen <philipchen@chromium.org>, LKML <linux-kernel@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 2/2] drm/bridge: parade-ps8640: Add support for AUX
 channel
Message-ID: <YUlroGk9RxCAv4OL@ravnborg.org>
References: <20210918102058.v5.1.I2351df94f18d5d8debc22d4d100f36fac560409a@changeid>
 <20210918102058.v5.2.Ifcb5df5de5b1cead7c99e0f37b044ef5cfc69eda@changeid>
 <YUZMNIYbT7KL3qJR@ravnborg.org>
 <CAD=FV=WXSdaTn1K+qCYPpyo-fP8FHQOjrKn17yd8hrZzf65zHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=WXSdaTn1K+qCYPpyo-fP8FHQOjrKn17yd8hrZzf65zHg@mail.gmail.com>
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

On Mon, Sep 20, 2021 at 02:42:09PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Sat, Sep 18, 2021 at 1:29 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > Hi Philip,
> > On Sat, Sep 18, 2021 at 10:21:17AM -0700, Philip Chen wrote:
> > > Implement the first version of AUX support, which will be useful as
> > > we expand the driver to support varied use cases.
> > >
> > > Signed-off-by: Philip Chen <philipchen@chromium.org>
> >
> > Patch is:
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> 
> I'm curious: did you mean "Signed-off-by" or "Acked-by" here?
Should have been - thanks for noticing.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
