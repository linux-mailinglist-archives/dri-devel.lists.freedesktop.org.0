Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA8E17D7D4
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 02:35:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D486E0C9;
	Mon,  9 Mar 2020 01:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1FFF66E0C9
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 01:35:21 +0000 (UTC)
X-UUID: 17f6d4a6cdd34624bed94824c91e9661-20200309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/2+LDngAwdJSa5uqOU8IW5tlL8Vd0+38SPAO9Uher5E=; 
 b=TYv063EYYvqu9mR6l41nHX7r9Prrsp5our8MGMEUy+waJXHuFdCx6BcI0NMSKqa5vvIC+PK2uLK8LM2ZwQofxpql1bdFggfOD5jiAVGQWHAt4hK9vfpSZIKdyI+t7apyb4utbAO+8BuJkGjM/fQbEycSh+NgTg4ax4XxQihX68E=;
X-UUID: 17f6d4a6cdd34624bed94824c91e9661-20200309
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 775658734; Mon, 09 Mar 2020 09:35:19 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 9 Mar 2020 09:34:23 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 9 Mar 2020 09:35:35 +0800
Message-ID: <1583717717.24810.2.camel@mtksdaap41>
Subject: Re: [PATCH] MAINTAINERS: Update Chun-Kuang Hu's email address
From: CK Hu <ck.hu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 9 Mar 2020 09:35:17 +0800
In-Reply-To: <20200308045201.3163-1-chunkuang.hu@kernel.org>
References: <20200308045201.3163-1-chunkuang.hu@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 2020-03-08 at 12:52 +0800, Chun-Kuang Hu wrote:
> Update my email address to @kernel.org
> 

Applied to mediatek-drm-next-5.7 [1].

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-next-5.7

Regards,
CK

> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 38fe2f3f7b6f..dceaeebce52a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5607,7 +5607,7 @@ F:	include/uapi/drm/lima_drm.h
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
>  
>  DRM DRIVERS FOR MEDIATEK
> -M:	CK Hu <ck.hu@mediatek.com>
> +M:	Chun-Kuang Hu <chunkuang.hu@kernel.org>
>  M:	Philipp Zabel <p.zabel@pengutronix.de>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Supported

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
