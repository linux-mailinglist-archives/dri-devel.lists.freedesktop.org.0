Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB703D6794
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 21:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD756ECD4;
	Mon, 26 Jul 2021 19:39:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251E26FFDB
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 19:39:22 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 3673ef93-ee49-11eb-8d1a-0050568cd888;
 Mon, 26 Jul 2021 19:39:37 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id DA428194B06;
 Mon, 26 Jul 2021 21:39:40 +0200 (CEST)
Date: Mon, 26 Jul 2021 21:39:19 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Zheyu Ma <zheyuma97@gmail.com>
Subject: Re: [PATCH v2 0/3] Error out if 'pixclock' equals zero
Message-ID: <YP8PZ8ZrDP4NJMDQ@ravnborg.org>
References: <1627293835-17441-1-git-send-email-zheyuma97@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1627293835-17441-1-git-send-email-zheyuma97@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, adaplas@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Zheyu,
On Mon, Jul 26, 2021 at 10:03:52AM +0000, Zheyu Ma wrote:
> Zheyu Ma (3):
>   video: fbdev: asiliantfb: Error out if 'pixclock' equals zero
>   video: fbdev: kyro: Error out if 'pixclock' equals zero
>   video: fbdev: riva: Error out if 'pixclock' equals zero

Thanks for the quick respin, all patches applied to drm-misc-next.
They will show up in -next within a week or so.

	Sam
