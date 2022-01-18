Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A645A49257B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 13:11:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E6010E508;
	Tue, 18 Jan 2022 12:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55FDC10E508
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 12:11:21 +0000 (UTC)
Date: Tue, 18 Jan 2022 12:11:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1642507878;
 bh=6jJPhYWwoA+//43JWYgSIF2TDwtpv80+W+Aoj4JDSLQ=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc;
 b=vro2rCcTNzJ1eiAzCCiIAtkK535vVvmHHVv+w/dx41CqwnVtLe/qojBuxkWfn8cJo
 oqWo82DKtp1s2KeVteUDfc6Hd/3bPCATrl75PGwviwene45RJmiKL7TmmdFWrmJ69s
 NHrGuz7mN03cgeGRtXwPglG9kRi5sA3tbWliZPR5h6UUGKdAH1tuPpKtoennM753T/
 8rhlsoH5ghDNrAoZDo7wQFidZuyrxIDMZtwOYsHi1liZkj6FiX8UhPR+wKEomJlIJo
 4+A+3Qjz8bc3LCE/kD4O9IPLJadcX1Kfdg1htuahb+CWmVurizdZRlEALBcyEAvd3t
 HZDhc9X9mZiEQ==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Message-ID: <Eq7vej5ZXGABhmCc7fCbSiaC0FruYkhMp8Bc3WsRENghKb_BOZ2LpVLsz8TkBGlrXD18jqkjAbBPwQt2n1yA7hQcK9u5Ep37fOC4UasJV_U=@emersion.fr>
In-Reply-To: <CAKMK7uHtdjyeasnJw2ZVwJJjuCn1KGT05kJu-x5jdmEmnBB-dA@mail.gmail.com>
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uHVHn9apB6YYbLSwu+adEB2Fqp4FM0z582zf4F-v3_GnQ@mail.gmail.com>
 <cf21018b-f231-7538-169e-2ad450643cbf@gmx.de>
 <97d49bca-f5f7-dba4-b62d-b6fcdd4276ac@suse.de> <87ee5659dt.fsf@intel.com>
 <4f1d6018-d74e-8e62-ea4d-0ca79c6bbbc5@gmx.de> <87a6ft5thv.fsf@intel.com>
 <CAMuHMdVE6OY29qB+F-QPgQt2q5xAYfyuPhKqSDrh_HhD9PPw9g@mail.gmail.com>
 <CAKMK7uHtdjyeasnJw2ZVwJJjuCn1KGT05kJu-x5jdmEmnBB-dA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, January 18th, 2022 at 12:41, Daniel Vetter <daniel@ffwll.ch> wr=
ote:

> On Tue, Jan 18, 2022 at 9:41 AM Geert Uytterhoeven <geert@linux-m68k.org>=
 wrote:
> >
> > Hi Jani,
> >
> > On Tue, Jan 18, 2022 at 9:38 AM Jani Nikula <jani.nikula@linux.intel.co=
m> wrote:
> > > On Mon, 17 Jan 2022, Helge Deller <deller@gmx.de> wrote:
> > > > On 1/17/22 22:40, Jani Nikula wrote:
> > > >> On Mon, 17 Jan 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote=
:
> > > >>> Seems like few people read linux-fbdev these days.
> > > >>
> > > >> How much traffic is there to linux-fbdev that is *not* Cc'd to dri=
-devel
> > > >> also?
> > > >
> > > > Doesn't seem like much traffic - which IMHO is OK for such a tree w=
ith
> > > > mostly just maintenance patches.
> > > >
> > > >> Do we still need a separate linux-fbdev mailing list at all?
> > > >
> > > > Yes. I want to have it seperate of dri-devel.
> > > > Actually I'd prefer to drop dri-devel from the list where patches
> > > > for fbdev are sent...
> > >
> > > Disagreed. If anything, this thread shows we can't have fbdev and drm=
 in
> > > silos of their own.
> >
> > Unless DRM drops fbdev support. Isn't that the long-term plan anyway?
>
> No. There's way too much old stuff still using the fbdev interface to
> do that. We've even done things like standardize the vblank wait
> ioctl, because people need that.

Kind of related: I wonder, could we document somewhere that fbdev is a
deprecated uAPI? ie. new user-space shouldn't use it and should prefer DRM.
I don't see that mentioned anywhere, although it seems like it's the
consensus among all kernel developers I've talked to.
