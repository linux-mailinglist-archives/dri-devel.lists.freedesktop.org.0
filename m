Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B0F4F5022
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 04:16:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6690A10E44B;
	Wed,  6 Apr 2022 02:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6571210E44B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 02:16:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 100C5B81E65;
 Wed,  6 Apr 2022 02:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61FB7C385A0;
 Wed,  6 Apr 2022 02:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649211365;
 bh=HFUmutMpPclH6W3Ib5k9z/9xgPTS1ozGO4CtoNe7cLo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z3mmC5uozNJPRjpYnuEFfuRNyy23hI/lveEyZjC1kvZF9KHfnbBGd+SoUiWwwtYEo
 JvKGzib7NZHV1b6EH8GZNevmkByOKV2M2doW5nf8404TTxnqUQiIUiOe7CnS50i2Ux
 f9aQh7K3AD78LS7dq1EGK0Ypm2SMEh5XbbT4KLKJedN+nrPQ1Uxbz16Uo4EvqmApTR
 vcOw7IFuNmyIildCP2i7fpMFi9+id+OCfeyeWVlaDyBBYHUuR2mbYtSLgqA1rINNgy
 Z7l6D2Z7mApuxq62QeoPhaxm4Br481B6Oi2J1c2pQNnq72DjCCa7F5LN3EAIWrWzzK
 +CnaZAQs9kfSA==
Date: Wed, 6 Apr 2022 10:15:57 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v1 6/8] ARM: dts: imx6dl-victgo: Add interrupt-counter
 nodes
Message-ID: <20220406021557.GK129381@dragon>
References: <20220221095312.3692669-1-o.rempel@pengutronix.de>
 <20220221095312.3692669-6-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220221095312.3692669-6-o.rempel@pengutronix.de>
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

On Mon, Feb 21, 2022 at 10:53:10AM +0100, Oleksij Rempel wrote:
> From: Robin van der Gracht <robin@protonic.nl>
> 
> Interrupt counter is mainlined, now we can add missing counter nodes.
> 
> Signed-off-by: Robin van der Gracht <robin@protonic.nl>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Applied, thanks!
