Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAC5291020
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 08:28:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CAA96E086;
	Sat, 17 Oct 2020 06:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD6F6E086
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Oct 2020 06:28:11 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id BDB6780575;
 Sat, 17 Oct 2020 08:28:09 +0200 (CEST)
Date: Sat, 17 Oct 2020 08:28:08 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jason Yan <yanaijie@huawei.com>
Subject: Re: [PATCH] video: fbdev: sis: remove unneeded semicolon
Message-ID: <20201017062808.GG2242298@ravnborg.org>
References: <20200910140536.1191150-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910140536.1191150-1-yanaijie@huawei.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fu7ymmwf c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=i0EeH86SAAAA:8 a=7hbD3mbysdTtokiVcH4A:9
 a=CjuIK1q_8ugA:10
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com,
 thomas@winischhofer.net, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 10, 2020 at 10:05:36PM +0800, Jason Yan wrote:
> Eliminate the following coccicheck warning:
> 
> drivers/video/fbdev/sis/sis_accel.h:143:72-73: Unneeded semicolon
> drivers/video/fbdev/sis/sis_accel.h:144:72-73: Unneeded semicolon
> drivers/video/fbdev/sis/sis_accel.h:145:72-73: Unneeded semicolon
> drivers/video/fbdev/sis/sis_accel.h:273:75-76: Unneeded semicolon
> drivers/video/fbdev/sis/sis_accel.h:274:75-76: Unneeded semicolon
> drivers/video/fbdev/sis/sis_accel.h:275:73-74: Unneeded semicolon
> drivers/video/fbdev/sis/sis_accel.h:276:75-76: Unneeded semicolon
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Applied to drm-misc-next.
checkpatch was not happy with the patch - but I ignored these warnings
as this is an old code base.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
