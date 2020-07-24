Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F2822BCE1
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 06:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583876E48F;
	Fri, 24 Jul 2020 04:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5A66E91C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 04:23:14 +0000 (UTC)
Received: from localhost (unknown [122.171.202.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 73064206F0;
 Fri, 24 Jul 2020 04:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595564594;
 bh=2WuwIVE5Ma8uYd0/j2K8hRNlXchKIt6B5I4noQ3fduw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WtCOrX4j9CUIcxsBJrltIWdodpQW29uZLDYO7x4qdv6kCIjJhqzfTA3LLmwRygD4p
 +O7RKoC+f+QyHCDsaLAbl+gv/fBPQqbSSCN0y/ZW1sCvUQapqJHspeJ+hRNfTxGg4v
 vckVhbdaBgTPjv9N6jEPn69FKVcd4RLIGBISOwo0=
Date: Fri, 24 Jul 2020 09:53:10 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm: bridge: adv7511: Add missing bridge type
Message-ID: <20200724042310.GF12965@vkoul-mobl>
References: <20200723104523.1006706-1-vkoul@kernel.org>
 <20200724013024.GL21353@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724013024.GL21353@pendragon.ideasonboard.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Bogdan Togorean <bogdan.togorean@analog.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24-07-20, 04:30, Laurent Pinchart wrote:
> Hi Vinod,
> 
> Thank you for the patch.
> 
> On Thu, Jul 23, 2020 at 04:15:23PM +0530, Vinod Koul wrote:
> > Add bridge type as DRM_MODE_CONNECTOR_HDMIA
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> 
> This has already been submitted: https://lore.kernel.org/dri-devel/20200720124228.12552-1-laurentiu.palcu@oss.nxp.com/

OKay lets drop this one then

-- 
~Vinod
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
