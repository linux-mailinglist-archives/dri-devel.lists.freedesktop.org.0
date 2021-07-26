Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F339B3D67C9
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 21:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE7D6EC70;
	Mon, 26 Jul 2021 19:58:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB4B6EC70
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 19:58:49 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id ee0c4abd-ee4b-11eb-8d1a-0050568cd888;
 Mon, 26 Jul 2021 19:59:04 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 83A19194B06;
 Mon, 26 Jul 2021 21:59:07 +0200 (CEST)
Date: Mon, 26 Jul 2021 21:58:45 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: Add AUO B133HAN05 &
 B140HAN06
Message-ID: <YP8T9Q70x8o96Vm3@ravnborg.org>
References: <20210726173300.432039-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210726173300.432039-1-bjorn.andersson@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Björn,
On Mon, Jul 26, 2021 at 10:32:59AM -0700, Bjorn Andersson wrote:
> Add bindings for the two AUO panels B133HAN05 and B140HAN06, both
> 1920x1080 panels with 16.7M colors, first being 13.3" and the latter
> 14.0".
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks, both patches applied to drm-misc-next.

	Sam
