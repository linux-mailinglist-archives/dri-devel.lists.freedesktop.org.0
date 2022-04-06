Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 602964F501E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 04:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C8410E40E;
	Wed,  6 Apr 2022 02:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0339510E40E
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 02:14:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 179EB60ACE;
 Wed,  6 Apr 2022 02:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B35C385A0;
 Wed,  6 Apr 2022 02:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649211255;
 bh=XdBZej03OeBo+18/e4QPeg0/pTn8quJVETWrS97Y3p4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aHVGKhLClKU8O/mFZSXbm7xTBh3CmgQY4VZWWiSDOcxogHlQAywMkXPb7i34nRtSl
 FBJIOKGDhcLJImcv8RdqY7bPWDNDctLrida+bdHOutqMoXs57lAj3x0VaNWREmZX2S
 W6NtPit5fHKwr34To8KVGQSUPvERqurU6CcVc7UkabiJgY1dBoexQ54mhWMml693HH
 oNI17MN5uQHYJv9+WzCdcOBKo+Buw8zPm9/Mq1OlZUr+qM2A4vysK5z3amP/2RKcnv
 bSkyoLd260aHUDwpHQOKNOR0Punw6nnxXpMbqxOMDZkrZ30ZH2K3hXCxlRypo+oyBu
 TiHXG/0yi4unA==
Date: Wed, 6 Apr 2022 10:14:07 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v1 1/8] ARM: dts: imx6qdl-vicut1/vicutgo: Set default
 backlight brightness to maximum
Message-ID: <20220406021407.GG129381@dragon>
References: <20220221095312.3692669-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220221095312.3692669-1-o.rempel@pengutronix.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robin van der Gracht <robin@protonic.nl>, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 David Jander <david@protonic.nl>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 21, 2022 at 10:53:05AM +0100, Oleksij Rempel wrote:
> From: David Jander <david@protonic.nl>
> 
> Recover default behavior of the device and set maximal brightness
> 
> Signed-off-by: David Jander <david@protonic.nl>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Applied, thanks!
