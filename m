Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C00B94A781A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 19:39:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67FBA10E40F;
	Wed,  2 Feb 2022 18:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5669410E40F
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 18:39:36 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 9af17c18-8457-11ec-b20b-0050568c148b;
 Wed, 02 Feb 2022 18:40:33 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 8515B194B6C;
 Wed,  2 Feb 2022 19:39:34 +0100 (CET)
Date: Wed, 2 Feb 2022 19:39:32 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Helge Deller <deller@gmx.de>
Subject: Re: fbdev git tree update
Message-ID: <YfrP5AELHkN85/z4@ravnborg.org>
References: <e1e5b7d1-ea09-6e28-9c39-45b983734a85@gmx.de>
 <YfrFvfZuZM1N9frh@ravnborg.org>
 <76ed4203-1ddc-1bbf-39c8-7cb62de7f4e9@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76ed4203-1ddc-1bbf-39c8-7cb62de7f4e9@gmx.de>
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
Cc: linux-fbdev@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Helge,

> 
> > How come there are backlight, dt-bindings
> 
> I didn't know, and I picked up those at the beginning.
> I did agreed with the backlight maintainers that I should
> keep those which are already in my tree, and that I will ignore
> any upcoming new ones.
Fine, just include this in the cover letter to explain it.


> > and agp in between the fbdev patches?
> 
> It wasn't picked up yet, agp somehow belongs to fbdev and as
> maintainer for parisc I was somehow involved as well.
> I'm happy to drop it if you think it belongs somewhere else...

I see no point in dropping as you are involved and patch seems relevant.
But please explain this in the cover letter so readers are not left
wondering.

	Sam
