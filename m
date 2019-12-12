Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A92D11DF5C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 09:23:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3F26E2A5;
	Fri, 13 Dec 2019 08:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id EC5C66E079
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 17:33:17 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 7FB7C80C0;
 Thu, 12 Dec 2019 17:33:56 +0000 (UTC)
Date: Thu, 12 Dec 2019 09:33:14 -0800
From: Tony Lindgren <tony@atomide.com>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH v2] ARM: dts: am335x-evm: Use drm simple-panel instead of
 tilcdc-panel
Message-ID: <20191212173314.GC35479@atomide.com>
References: <20191203091119.3352-1-jsarha@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203091119.3352-1-jsarha@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Fri, 13 Dec 2019 08:22:24 +0000
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com, bcousson@baylibre.com,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Jyri Sarha <jsarha@ti.com> [191203 01:12]:
> Move to use the new drm panel support in tilcdc together with added
> "tfc,s9700rtwv43tr-01b"-panel support in drm panel-simple.
> 
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> "tfc,s9700rtwv43tr-01b" in panel-simple has been in for some time now
> so it is about time to get this in too.

Thanks applying into omap-for-v5.6/dt.

Tony
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
