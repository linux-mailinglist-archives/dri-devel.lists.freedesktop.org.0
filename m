Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6634BC709
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 10:14:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C138926F;
	Sat, 19 Feb 2022 09:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC8710F54D
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 09:13:58 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 4f4eea55-9164-11ec-baa1-0050568c148b;
 Sat, 19 Feb 2022 09:14:15 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 9EC89194BBA;
 Sat, 19 Feb 2022 10:13:56 +0100 (CET)
Date: Sat, 19 Feb 2022 10:13:52 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] drm/panel: Rename Sony ACX424 to Novatek NT35560
Message-ID: <YhC00FbY/W1r9m6T@ravnborg.org>
References: <20220103113822.654592-1-linus.walleij@linaro.org>
 <CACRpkdZSz9gCHyHz7=ZKSGBH9GuozmfiZ_a-MHmoJ_5h8ED8cw@mail.gmail.com>
 <CACRpkdZ2tUKuGP4SZdar=9tMVO__xn0fUV+DQGU5PRwcPo9ERA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZ2tUKuGP4SZdar=9tMVO__xn0fUV+DQGU5PRwcPo9ERA@mail.gmail.com>
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
Cc: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

On Sat, Feb 19, 2022 at 02:40:33AM +0100, Linus Walleij wrote:
> On Sat, Jan 29, 2022 at 2:26 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Mon, Jan 3, 2022 at 12:40 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > > A code drop from Sony Mobile reveals that the ACX424 panels are
> > > built around the Novatek NT35560 panel controllers so just bite
> > > the bullet and rename the driver and all basic symbols so that
> > > we can modify this driver to cover any other panels also using
> > > the Novatek NT35560 display controller.
> > >
> > > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Could someone take mercy in reviewing this patch set?
> >
> > I can offer some patch review back!
> 
> I can also offer coffee in person in Sweden,
I will take you up on this on day - I hope :-)
Greetings from Denmark.

	Sam
