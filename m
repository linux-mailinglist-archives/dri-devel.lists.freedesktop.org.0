Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B2B3C2A91
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 22:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88BCC6EA8D;
	Fri,  9 Jul 2021 20:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8821C6EA90
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 20:58:10 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 60db4b13-e0f8-11eb-8d1a-0050568cd888;
 Fri, 09 Jul 2021 20:58:14 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id A777B194B06;
 Fri,  9 Jul 2021 22:58:17 +0200 (CEST)
Date: Fri, 9 Jul 2021 22:58:06 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Yunus Bas <y.bas@phytec.de>
Subject: Re: [PATCH v4 1/2] drm/panel: simple: Add support for EDT
 ETMV570G2DHU panel
Message-ID: <YOi4XlJFgJuUXQXK@ravnborg.org>
References: <20210709200349.2665205-1-y.bas@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709200349.2665205-1-y.bas@phytec.de>
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
Cc: s.riedmueller@phytec.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yunus and Stefan,
On Fri, Jul 09, 2021 at 10:03:48PM +0200, Yunus Bas wrote:
> From: Stefan Riedmueller <s.riedmueller@phytec.de>
> 
> This patch adds support for the EDT ETMV570G2DHU 5.7" (640x480) lcd panel
> to DRM simple panel driver.
> 
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> Signed-off-by: Yunus Bas <y.bas@phytec.de>

Thanks for the quick fixes,
both patches applied to DRM-misc-next.

	Sam
