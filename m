Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1964E491F48
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 07:11:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55F5112973;
	Tue, 18 Jan 2022 06:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B243310F75F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 06:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642486288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zJpGiFZsTQiw8eRQaACcZcS0TfkIUnQNM5KKh6CzfJ8=;
 b=cmVCZIADDEqGvAULV9J9sBBEiR/ne7svM242DtIaqqgRMyY8QH0FgbhmAJCrNuYfNGT6Hw
 PDk7zDUw85OaAzfrFUkHlBh2AnQnu7slOOuk11SW/f/BWEU1ZJQx/c1qNEY+zvVHDCYxgs
 z953rdgr8dmHzJCBx65ggIf4QlhP198=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-YTnOAVnRPYujDggk9iouAA-1; Tue, 18 Jan 2022 01:11:24 -0500
X-MC-Unique: YTnOAVnRPYujDggk9iouAA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E33F8814249;
 Tue, 18 Jan 2022 06:11:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60F1B78DD4;
 Tue, 18 Jan 2022 06:11:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7AAED18000A6; Tue, 18 Jan 2022 07:11:20 +0100 (CET)
Date: Tue, 18 Jan 2022 07:11:20 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Message-ID: <20220118061120.7exr5vtdwyuzhnup@sirius.home.kraxel.org>
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <20220117125716.yjwxsze35j2ndn2i@sirius.home.kraxel.org>
 <CAMuHMdW=Zpp2mHbrBx7i0WN8PqY3XpK5qpyAyYxgf9n88edpug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW=Zpp2mHbrBx7i0WN8PqY3XpK5qpyAyYxgf9n88edpug@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Helge Deller <deller@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 17, 2022 at 02:29:47PM +0100, Geert Uytterhoeven wrote:
> Hi Gerd,
> 
> On Mon, Jan 17, 2022 at 1:57 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > > b) to include new drivers (for old hardware) if they arrive (probably happens rarely but there can be).
> > >    I know of at least one driver which won't be able to support DRM....
> >
> > Hmm?  I seriously doubt that.  There is always the option to use a
> > shadow framebuffer, then convert from standard drm formats to whatever
> > esoteric pixel format your hardware expects.
> >
> > Been there, done that.  Have a look at the cirrus driver.  The physical
> > hardware was designed in the early 90-ies, almost 30 years ago.  These
> > days it exists in virtual form only (qemu emulates it).  Thanks to the
> > drm driver it runs wayland just fine even though it has a bunch of
> > constrains dictated by the hardware design.
> 
> The Cirrus DRM driver supports TrueColor (RGB565/888 and ARGB8888)
> modes only.  The Cirrus fbdev driver also supports mochrome and 256
> color modes.
> 
> There exist some DRM drivers that do support DRM_FORMAT_C8, but none of
> the "tiny" ones do. Same for DRM_FORMAT_RGB{332,233}.

Adding that to the cirrus driver shouldn't be hard.  I'm wondering
whenever there are any userspace apps which would actually use that
though.

take care,
  Gerd

