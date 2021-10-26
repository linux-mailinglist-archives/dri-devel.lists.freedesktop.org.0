Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D104143BA71
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 21:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5455A89E19;
	Tue, 26 Oct 2021 19:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1079189E19
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 19:13:19 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id cbdd36ae-3690-11ec-9c3f-0050568c148b;
 Tue, 26 Oct 2021 19:13:26 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 2ABEA194B90;
 Tue, 26 Oct 2021 21:13:17 +0200 (CEST)
Date: Tue, 26 Oct 2021 21:13:15 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Paul Boddie <paul@boddie.org.uk>, list@opendingux.net,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v3 0/6] drm/ingenic: Various improvements v3
Message-ID: <YXhTS4vIRZg++3F9@ravnborg.org>
References: <20211026181240.213806-1-paul@crapouillou.net>
 <4CBF748C-DA58-4E8B-A6E4-A7CE653F2C52@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4CBF748C-DA58-4E8B-A6E4-A7CE653F2C52@goldelico.com>
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

Hi Nikolaus,
On Tue, Oct 26, 2021 at 08:50:19PM +0200, H. Nikolaus Schaller wrote:
> Hi Paul,
> 
> > Am 26.10.2021 um 20:12 schrieb Paul Cercueil <paul@crapouillou.net>:
> > 
> > Hi,
> > 
> > I resend the V3 of my patchset for drm/ingenic, verbatim.
> > 
> > The previous submission of my V3 received a lot of replies, but none of
> > these replies were actually talking about the patches themselves.
> 
> Indeed. And since we have finally managed to add jz4780 HDMI support
> (I didn't find to work in the latest comments) on top of the series as is,
> please go ahead and add my
> 
> tested-by: Nikolaus Schaller <hns@goldelico.com>
Capital T, but I expect Paul to fix it.

If you have read the patches it would be good if you could add an
Acked-by: or Reviewed-by: tag on the individual patches.
Paul are not supposed to apply the patches until someone claims they have
looked at the patches, documented by one of these tags.

And I have no head to do so myself today.

	Sam
