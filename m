Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAAE14ECEA
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 14:06:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710376E995;
	Fri, 31 Jan 2020 13:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1DC6E995
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 13:06:07 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id j132so7121803oih.9
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 05:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RDp0pOxZhQSSDcAO8oHU9FjL1Lqlf4KgQSLDF8HSFSc=;
 b=BuM5FufRJFxKMhSwSIYyEbrCCY0iKwGY7WtkOuHjkbh+YVfPHTw60egvnOdkdi+XLz
 s+5zY7G4hLWTAykA3jwaBmmlqPKnYKRkKpp85V9eNlcxx4hGXp1P+FfF8fBiKCiAu7Uy
 yy0qB0WXyubR2NuODJYWDbGPLw9xmcGTES3ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RDp0pOxZhQSSDcAO8oHU9FjL1Lqlf4KgQSLDF8HSFSc=;
 b=TFZUh4aLJbIDALp5SDT5ZXcDZqQprW/nzboNXiVw3CjxT71iLvkUs2O7i5qs7wGUMX
 xv1nJKW1un7bFrg/4ERYBaPSehCHwoSup+JON4iQfiZqeryqZKgjtHGBj0p0h+rFXSsK
 3J2T3N1s/zGcqzOwEEEHgVOV/oie4fpwiNmRymZx6g7Qeg1Or2FFrhH2MIi2eg7IFjYM
 hcy/2ZpVhM/L5aV9gjHQjSbfzXSvAlpvMITdCqd6LT28KTHHuZxbianOMTnO16BwqObB
 +oMdEFuy9kF3Hyr2Y+ZHPb+FxLRtuX61SkLpTroTLP1qs4UQvRB6uISe/3WdxrvxaK8v
 AuyA==
X-Gm-Message-State: APjAAAXzdRMXj4g7uH/sebLcbd3xUroX3hkw/wzc5Jyi4BaLwm9+9fh6
 dbkLtpn2HcIlWLZGZ2ugPy0B+NYpmKreppt9Cc1wSQ==
X-Google-Smtp-Source: APXvYqzKLnwlLbQtesZKAgY+RthYrQ4Oy7HhjhWMc0Gp6IgIR/12gpOZhKGBMZCXo3DtVASA8fZG3hk+7QopKXyzYWk=
X-Received: by 2002:a05:6808:319:: with SMTP id
 i25mr6273651oie.128.1580475966489; 
 Fri, 31 Jan 2020 05:06:06 -0800 (PST)
MIME-Version: 1.0
References: <20200130120643.5759-1-tzimmermann@suse.de>
 <21c31cf3-ae2e-e361-7edd-a45f7589dd9f@suse.de>
 <20200130130418.fta4sqpbfkpj5tzx@gilmour.lan>
In-Reply-To: <20200130130418.fta4sqpbfkpj5tzx@gilmour.lan>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 31 Jan 2020 14:05:55 +0100
Message-ID: <CAKMK7uHOH2UwdZ+dpYySiKACfdpjaT+SL5agPQKb7Li=gCfeQw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Thomas as drm-misc co-maintainer
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 31, 2020 at 9:04 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Thu, Jan 30, 2020 at 01:09:23PM +0100, Thomas Zimmermann wrote:
> > (cc'ing Maxime with the corrrect email addrees)
> >
> > Am 30.01.20 um 13:06 schrieb Thomas Zimmermann:
> > > Daniel asked me to serve as co-maintainer of the drm-misc tree.
> > >
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Daniel

>
> Welcome :)
>
> Maxime
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
