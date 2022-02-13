Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 680EF4B3E54
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 00:13:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471FB10E180;
	Sun, 13 Feb 2022 23:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3.hostedemail.com (relay3.hostedemail.com [64.99.140.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1CD10E180
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Feb 2022 23:12:59 +0000 (UTC)
Received: from omf04.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay06.hostedemail.com (Postfix) with ESMTP id 36BD822BF6;
 Sun, 13 Feb 2022 23:12:56 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf04.hostedemail.com (Postfix) with ESMTPA id CAC7320024; 
 Sun, 13 Feb 2022 23:12:49 +0000 (UTC)
Message-ID: <3141331e10cdbc7a3859887d5e8038eff777e3ad.camel@perches.com>
Subject: Re: [PATCH v7 7/7] MAINTAINERS: add maintainers for DRM LSDC driver
From: Joe Perches <joe@perches.com>
To: Sui Jingfeng <15330273260@189.cn>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Roland Scheidegger
 <sroland@vmware.com>, Zack Rusin <zackr@vmware.com>,  Christian Gmeiner
 <christian.gmeiner@gmail.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>,  Rob Herring <robh+dt@kernel.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Dan Carpenter
 <dan.carpenter@oracle.com>, Krzysztof Kozlowski <krzk@kernel.org>, Andrey
 Zhizhikin <andrey.zhizhikin@leica-geosystems.com>, Sam Ravnborg
 <sam@ravnborg.org>, "David S . Miller" <davem@davemloft.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Lucas Stach <l.stach@pengutronix.de>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Ilia Mirkin
 <imirkin@alum.mit.edu>, Qing Zhang <zhangqing@loongson.cn>, Li Yi
 <liyi@loongson.cn>,  suijingfeng <suijingfeng@loongson.cn>
Date: Sun, 13 Feb 2022 15:12:48 -0800
In-Reply-To: <20220213141649.1115987-8-15330273260@189.cn>
References: <20220213141649.1115987-1-15330273260@189.cn>
 <20220213141649.1115987-8-15330273260@189.cn>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: CAC7320024
X-Spam-Status: No, score=1.60
X-Stat-Signature: chsen43n4o61gbue1shux6emhu6imiza
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+3MfhZMV+dCCy7Z4SG+v/Vjs/O+3cQmPk=
X-HE-Tag: 1644793969-740389
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
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 2022-02-13 at 22:16 +0800, Sui Jingfeng wrote:
> From: suijingfeng <suijingfeng@loongson.cn>
[]
> diff --git a/MAINTAINERS b/MAINTAINERS
[]
> @@ -6453,6 +6453,15 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	drivers/gpu/drm/lima/
>  F:	include/uapi/drm/lima_drm.h
>  
> +DRM DRIVERS FOR LOONGSON
> +M:	Sui Jingfeng <suijingfeng@loongson.cn>
> +L:	dri-devel@lists.freedesktop.org
> +R:	Li Yi <liyi@loongson.cn>
> +S:	Maintained
> +W:	https://www.loongson.cn/
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	drivers/gpu/drm/lsdc/
> +

M then R then L please

DRM DRIVERS FOR LOONGSON
M:	Sui Jingfeng <suijingfeng@loongson.cn>
R:	Li Yi <liyi@loongson.cn>
L:	dri-devel@lists.freedesktop.org


