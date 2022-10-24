Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EE0609A23
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 07:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D42510E25F;
	Mon, 24 Oct 2022 05:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 553 seconds by postgrey-1.36 at gabe;
 Mon, 24 Oct 2022 05:59:06 UTC
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id B60A010E0E8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 05:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id B337783BC;
 Mon, 24 Oct 2022 05:41:12 +0000 (UTC)
Date: Mon, 24 Oct 2022 08:50:25 +0300
From: Tony Lindgren <tony@atomide.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 15/17] fbdev: omapfb: remove unused board support
Message-ID: <Y1YnoRYA2wfJ5qqF@atomide.com>
References: <20221019144119.3848027-1-arnd@kernel.org>
 <20221019150410.3851944-1-arnd@kernel.org>
 <20221019150410.3851944-15-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221019150410.3851944-15-arnd@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Angelo Arrifano <miknix@gmail.com>,
 Helge Deller <deller@gmx.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Arnd Bergmann <arnd@kernel.org> [221019 15:11]:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A number of omap1 based board files got removed, so the corresponding
> framebuffer drivers are no longer used. The remaining ones are for
> ams_delta, osk and palmTE, which are still part of the mainline kernel.

Acked-by: Tony Lindgren <tony@atomide.com>
