Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A242C4F5023
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 04:16:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF8310E464;
	Wed,  6 Apr 2022 02:16:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75EE310E464
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 02:16:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B1DCA60ACE;
 Wed,  6 Apr 2022 02:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC5FCC385A1;
 Wed,  6 Apr 2022 02:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649211407;
 bh=cRoUNyugEoBJs/eqNGiLRSxa0CDhLNVexQ2ZkFWEMbE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XdI2Nn+AP3oMkqS2k81buZc04LsU81yD3okAtvgRCXuhc9BSVMQMiw4fMhLD9seEM
 fgDA1tx2FQ8AY5Q/Bp12oNBGBpySDFYE9VZ/IgLH3F3ofWzzg1bRfd/CVHG+QpwcSV
 J4iV2AjZPEUfSl/BR59Gf7uRctBZ5s73/AJHf65BnfkurHdt0c7A1ccKyHkgWTzG6S
 z0dbNfNthRmgTGGgKy46kCUmT+QZ/3ViQ29Ba1Rr6hz63Ck4KLRAt6ARDARQQmDnke
 vGMyEcgKYimTxf56/GiQhs1jD1aT0UCog1+tXeYMPydA1qW2GHXzsNbB91p2cZVR8w
 auqj4n6pLI1Lw==
Date: Wed, 6 Apr 2022 10:16:39 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v1 7/8] ARM: dts: imx6dl-victgo: The TGO uses a
 lg,lb070wv8 compatible 7" display
Message-ID: <20220406021639.GL129381@dragon>
References: <20220221095312.3692669-1-o.rempel@pengutronix.de>
 <20220221095312.3692669-7-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220221095312.3692669-7-o.rempel@pengutronix.de>
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
 David Airlie <airlied@linux.ie>, Robin van der Gracht <robin@protonic.nl>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 David Jander <david@protonic.nl>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 21, 2022 at 10:53:11AM +0100, Oleksij Rempel wrote:
> From: Robin van der Gracht <robin@protonic.nl>
> 
> This series of devices is using lg,lb070wv8 instead of kyo,tcg121xglp.
> 
> Signed-off-by: Robin van der Gracht <robin@protonic.nl>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Applied, thanks!
