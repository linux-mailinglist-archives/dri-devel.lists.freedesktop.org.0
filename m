Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CF93E1BB8
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 20:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0430D6E8AE;
	Thu,  5 Aug 2021 18:53:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 211796E8AE
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 18:53:03 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 66c56193-f61e-11eb-8d1a-0050568cd888;
 Thu, 05 Aug 2021 18:53:19 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 0FFAF194B1F;
 Thu,  5 Aug 2021 20:53:27 +0200 (CEST)
Date: Thu, 5 Aug 2021 20:52:59 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] mainline panels used on Skov boards
Message-ID: <YQwziwzNJoFgJTcK@ravnborg.org>
References: <20210805111944.13533-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210805111944.13533-1-o.rempel@pengutronix.de>
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

Hi Oleksij,

On Thu, Aug 05, 2021 at 01:19:42PM +0200, Oleksij Rempel wrote:
> changes v2:
> - set connector_type to DRM_MODE_CONNECTOR_DPI for the
>   logictechno_lttd800480070_l6wh_rt panel
> 
> Sam Ravnborg (1):
>   drm/panel: simple: add Multi-Innotechnology MI1010AIT-1CP1
> 
> Søren Andersen (1):
>   drm/panel: simple: add LOGIC Technologies LTTD800480070-L6WH-RT

Thanks for taking care of these. They have been on my TODO list for far
too long.
Applied to drm-misc-next.

I edited Co-Developed-by => Co-developed-by to make checkpatch happy.
To keep the history I have s-o-b the patches twice. When authored and
now when applying as I thought this was the correct way to document the
path of the patch.

	Sam
