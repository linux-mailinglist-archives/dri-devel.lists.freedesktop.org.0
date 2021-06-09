Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 471B53A0FB0
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 11:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F046E15D;
	Wed,  9 Jun 2021 09:30:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51516E15D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 09:30:19 +0000 (UTC)
Received: from mail-wr1-f51.google.com ([209.85.221.51]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MnJUy-1lRVwD33mG-00jLTx for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun
 2021 11:30:17 +0200
Received: by mail-wr1-f51.google.com with SMTP id z8so24640706wrp.12
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 02:30:17 -0700 (PDT)
X-Gm-Message-State: AOAM532TEaYw+GA3FlNHBWJP92A/31803XoNGGnKsst6APCKZNTkaRjM
 ekYGK5LCzsm9C9agIjnD39bX+gnxOypKDqAWAac=
X-Google-Smtp-Source: ABdhPJzSUnfxZ8LwqKlwrv2bklC04HJaA0aceSDDVOkdulM4vUlC4C4l0QpvA5YJj63Bv3ttsWTULoaeeZe1hMG9qiE=
X-Received: by 2002:a5d:4050:: with SMTP id w16mr27202710wrp.99.1623231017160; 
 Wed, 09 Jun 2021 02:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210608103833.598348-1-joel@jms.id.au>
 <CAK8P3a00xuEAKTHrCDw52M-YPJUphSU8bYayW9P_xyNDsTsNzg@mail.gmail.com>
 <3877ae18-dbda-242a-60b2-f73734f8ba03@xs4all.nl>
In-Reply-To: <3877ae18-dbda-242a-60b2-f73734f8ba03@xs4all.nl>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 9 Jun 2021 11:28:24 +0200
X-Gmail-Original-Message-ID: <CAK8P3a18EdBKQdGDOZc9cPKsf=hY8==v2cO0DBE_tyd82Uq-Ng@mail.gmail.com>
Message-ID: <CAK8P3a18EdBKQdGDOZc9cPKsf=hY8==v2cO0DBE_tyd82Uq-Ng@mail.gmail.com>
Subject: Re: [PATCH] ARM: config: Refresh mutli v7
To: Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:EAc9wdmHgB18R6QJ9SdX9qrsIfdpkFry+Xdr57z51EzSA5hA9Yk
 Qqm6AUaxsIxxGDWanDUtmwF4NI8oVTimrNInPexgrg6gDZe1RJG+cvGQ09YuUzSaoIY3rc9
 43FWu5TqPnmFb9WC9aj21MeTTp70M2dyZyrICxjUUv0LXfusauvdbUAvOsDKbXqrVye0vHf
 TefC8GCYPN6+52hHhbVAw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gMq/S8QxKe8=:c8Q4qDJjbckW/3s8zIpdrg
 4DQgCk6C4VxvOYMOvq4KaVLtSVPhTn9KQonD/e7TMEduqN4DiuEkNblZg/uz7NCwiqxIbjhUA
 3drO18QRLLq28/Yq53XF5Oa+6qCfJuivGvMzgL5Z6OlB0BXONYUiAiPBP4FR3Sk+C5ilcFhmm
 +vY2sVhMLy1SNYo+gxTo6bdqVuYHryC2PCf8JfAv/RWA4BPH7crabiJHXT7nM+4g5oICoXVZ5
 qNHW1BSpan5chQ2Wb8q/YZeShdeUAO9X70sK2g4p4hzImyE8TTSBQ3YeYM5egqCYaQBMBhIjk
 qvLJZY9R7twVZGG+1UO/neXMQQARHLkfJ74RBdLkZKkky77RnMw38gG5IXX86t2VpNh8PwAPH
 5wzUQ2O+gisbnTmzlwCrv/u8p1qRmfKOWcI8EMUTTUOmfxL5J+2wEaNBHdmkZJULk5UwHobFX
 rt4X2y0NOjD6dZMW7sB/aAiPpEmZrDieJlAAmdMayV4nOpZrV9NAAqrroTL7AOwrrZu0mrZfd
 pPghQqVvIZqaBRkPrrGRK4=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Joel Stanley <joel@jms.id.au>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 8, 2021 at 6:49 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> On 08/06/2021 18:14, Arnd Bergmann wrote:
>
> Right now it is inherent to the driver. It is probably possible to drop support
> for video overlay devices if CONFIG_FB=n, but it is not something I have time
> for. It's just a test driver (albeit a very useful test driver), so it is no
> big deal if it is disabled when CONFIG_FB=n.

Ok, thanks for the reply, makes sense.

I checked what other consequences there are if we disable CONFIG_FB
and CONFIG_DRM_KMS_FB_HELPER=y in all the defconfigs now,
as the patch from Kees did.

It appears that the only other arm32 framebuffers that remain are
FB_EFI=y, FB_WM8505=y, FB_MX3=m and FB_SIMPLE=y.

On arm64, losing CONFIG_FB=y would disable FB_EFI=y,
XEN_FBDEV_FRONTEND=y, and FB_MX3=m

On x86, it's only CONFIG_FB_EFI

It appears that FB_MX3 is orphaned since commit e1324ece2af4
("ARM: imx: Remove i.MX35 board files") because all Armv6 or
newer i.MX now use drivers/gpu/drm/mxsfb/mxsfb_drv.c, and
FB_WM8505 is probably unused as well (we discussed removing the
platform last winter, but decided to give it another year to see if
new users come up, which has not happened).

As long as simplefb, efifb and xenfb are needed though, we probably
want CONFIG_FB=y anyway and leaving VIVID=m with the dependency
does not cause problems until those are all turned into drm drivers.

      Arnd
