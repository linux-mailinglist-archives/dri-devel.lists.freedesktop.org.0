Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2333B3607
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 20:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0426A6ECAB;
	Thu, 24 Jun 2021 18:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE84D6EC94
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 18:44:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 660A11F4423F
Message-ID: <b3f6e93bd5c0d959bea0a648ce806094fac81065.camel@collabora.com>
Subject: Re: [PATCH 02/12] arm64: dts: rockchip: Add panel orientation to
 Odroid Go Advance
From: Ezequiel Garcia <ezequiel@collabora.com>
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Date: Thu, 24 Jun 2021 15:44:35 -0300
In-Reply-To: <3249046.u6TykanW85@diego>
References: <20210624182612.177969-1-ezequiel@collabora.com>
 <20210624182612.177969-3-ezequiel@collabora.com> <3249046.u6TykanW85@diego>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 24 Jun 2021 18:47:09 +0000
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Alex Bee <knaerzche@gmail.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Thierry Reding <thierry.reding@gmail.com>,
 kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>,
 Chris Healy <cphealy@gmail.com>, maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2021-06-24 at 20:37 +0200, Heiko Stübner wrote:
> Am Donnerstag, 24. Juni 2021, 20:26:02 CEST schrieb Ezequiel Garcia:
> > The Odroid Go Advance panel is rotated, so let's reflect this
> > in the device tree.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> 
> similar patch already applied for 5.14:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts?id=edb39de5d731f147c7b08c4a5eb246ae1dbdd947

Great minds think alike! :)

Thanks,
Ezequiel

