Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9716B2B77F6
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 09:05:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 753E189CAD;
	Wed, 18 Nov 2020 08:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91AB189CAD
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 08:04:59 +0000 (UTC)
Date: Wed, 18 Nov 2020 08:04:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1605686697;
 bh=9q4xfQr9gpeHTJ6TscCYdWbq8tMpBhT+7JfO2kwh6Yg=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=HyiX4W0vK3KPve9H1ZGKjYGgFZMW8GCpLvSglsMvLwrtuozRuF55a5gK0a5Z1ZKtR
 UFdceFyqSIODZ0gfFys8mb5lflhlmzIHkZhtJ2FkB9IIV5GZQo2bqui0OgGagB8X0Z
 G7RYheWpxmFtAfTwFQDXBMr0PH1Bxq8ZcbhAScxrgLu0e/4jetq70xyELnzPbO/aQS
 KlwUaNIO3bbRSfi0H+6w4dDhbr/vaekoLh8lUv1Swkb3SDjnvO2RT86pzc0WuXGjyR
 N37KCJXH+6cT34BkZmxBvTTWxh3aqYq0HCDAITw2b/LKZaX4w/CbNT1jglR763qBp9
 jxAPdRGh/deqw==
To: Daniel Vetter <daniel.vetter@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/docs: Fix todo.rst
Message-ID: <jZPv-Syhslxgru5BE84oYRZshAcQb4oTqai9CIWP39ZAwfwcDmIQnoSVGEPARAQ3Fa6F89enSHbQ648O7mkfUuL_2UHpCPmFBcvZzXDJvcA=@emersion.fr>
In-Reply-To: <20201118073637.597206-1-daniel.vetter@ffwll.ch>
References: <20201118073637.597206-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, November 18, 2020 8:36 AM, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> I didnt' format the thing correctly :-(
>
> Fixes: 39aead8373b3 ("fbcon: Disable accelerated scrolling")
> Reported-by: Stephen Rothwell sfr@canb.auug.org.au
> Cc: Stephen Rothwell sfr@canb.auug.org.au
> Signed-off-by: Daniel Vetter daniel.vetter@intel.com

Reviewed-by: Simon Ser <contact@emersion.fr>

Note that a blank line is required before the first item and after the
last, but is optional between items.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
