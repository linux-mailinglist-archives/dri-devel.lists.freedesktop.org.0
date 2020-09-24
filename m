Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49504277A83
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 22:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1DB56E49A;
	Thu, 24 Sep 2020 20:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17CFD6E49A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 20:34:50 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 1B48A20079;
 Thu, 24 Sep 2020 22:34:47 +0200 (CEST)
Date: Thu, 24 Sep 2020 22:34:46 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] MAINTAINERS: mark FRAMEBUFFER LAYER as Orphan
Message-ID: <20200924203446.GL1223313@ravnborg.org>
References: <CGME20200924112530eucas1p13af17d649767ed51c619d303392fa1e1@eucas1p1.samsung.com>
 <7b709254-9412-8473-250c-0c4e006259b3@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7b709254-9412-8473-250c-0c4e006259b3@samsung.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=CaYmGojl c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=hD80L64hAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=KIuVEvK59YeNV9IdMJ8A:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: linux-fbdev@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bartlomiej

On Thu, Sep 24, 2020 at 01:25:30PM +0200, Bartlomiej Zolnierkiewicz wrote:
> It has been a fun ride since 2017 but unfortunately I don't have
> enough time to look after it properly anymore.

Thanks for all your work on fbdev, and other stuff.

I hope you have fun in the current job with whatever you do or
even better manage to find something else so we can get you back.

I could see that Daniel thinks we shall keep fbdev in drm-misc
but we shall no longer rely on you sweeping the mailing list
for all the pending patches :-( So I will likely start breaking
fbdev some more (read: applying a few more fbdev patches).

> 
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Acked-by: Sam Ravnborg <sam@ravnborg.org>

Please consider a proper entry in CREDITS too!

	Sam

> ---
>  MAINTAINERS |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> Index: b/MAINTAINERS
> ===================================================================
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6894,10 +6894,9 @@ F:	drivers/net/wan/dlci.c
>  F:	drivers/net/wan/sdla.c
>  
>  FRAMEBUFFER LAYER
> -M:	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>  L:	dri-devel@lists.freedesktop.org
>  L:	linux-fbdev@vger.kernel.org
> -S:	Maintained
> +S:	Orphan
>  Q:	http://patchwork.kernel.org/project/linux-fbdev/list/
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	Documentation/fb/
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
