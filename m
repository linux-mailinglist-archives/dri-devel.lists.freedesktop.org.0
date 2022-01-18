Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 775F54925FA
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 13:48:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6C610E627;
	Tue, 18 Jan 2022 12:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE6810E627
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 12:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642510106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CB6tHFD3hrD0W0enC4pHpoosOH1HSXx3fWvCf7Pxffo=;
 b=CZ2+wxhzXQAA+l7EqiAz+EClZbKR+5KLMf3bJHbrG18mC253Hfi1+aTwLWMFe2CSCDTnzm
 2MPoj3l4XhYR7jCdpNVxTyD8rTyY58QYmu+88sLRwuuwABkPdLB+hPWfpN3aTGPtYaVVD3
 CM7kAkfHaL2I/TGtHmICded/8a2d3S0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-6FX2kNaPP3Ch-pn68zxI-g-1; Tue, 18 Jan 2022 07:48:23 -0500
X-MC-Unique: 6FX2kNaPP3Ch-pn68zxI-g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26F0E1006AA5;
 Tue, 18 Jan 2022 12:48:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1BF02B4BF;
 Tue, 18 Jan 2022 12:48:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4523D18000A6; Tue, 18 Jan 2022 13:48:06 +0100 (CET)
Date: Tue, 18 Jan 2022 13:48:06 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Message-ID: <20220118124806.ywmjxk6wstipzi56@sirius.home.kraxel.org>
References: <CAMuHMdW=Zpp2mHbrBx7i0WN8PqY3XpK5qpyAyYxgf9n88edpug@mail.gmail.com>
 <70530b62-7b3f-db88-7f1a-f89b824e5825@suse.de>
 <CAMuHMdW5M=zEuGEnQQc3JytDhoxCKRiq0QFw+HOPp0YMORzidw@mail.gmail.com>
 <57d276d3-aa12-fa40-6f90-dc19ef393679@gmx.de>
 <CAKMK7uE7jnTtetB5ovGeyPxHq4ymhbWmQXWmSVw-V1vP3iNAKQ@mail.gmail.com>
 <b32ffceb-ea90-3d26-f20e-29ae21c68fcf@gmx.de>
 <20220118062947.6kfuam6ah63z5mmn@sirius.home.kraxel.org>
 <ebe9c076-e2a9-0cb7-eb6a-ae71c075975e@gmx.de>
 <20220118091615.3ih5n7vhd6tgmnku@sirius.home.kraxel.org>
 <ffef1042-e1af-d5b5-b140-ae24fcc1855b@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffef1042-e1af-d5b5-b140-ae24fcc1855b@gmx.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Sven Schnelle <svens@stackframe.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> > fbcon/fbdev emulation: RGB332 support must be added I think.  But both
> > argb888 and rgb565 are supported today, so it should not be hard to find
> > the places where you have to add some code to handle RGB332 too.
> 
> I'd expect that that framework is provided by DRM developers if there is the wish
> to get rid of old fbdev and transition existing drivers over to use DRM.

Good luck with that.  Asking people to code up stuff they can't even
test due to lack of hardware isn't going to fly very well.

> > Yes.  The world shifted from 2d acceleration to 3d acceleration.  Modern
> > hardware simply has no classic blitter any more.  Which is a problem
> > when it comes to keeping scroll acceleration alive, it is already a very
> > niche use case and it will only become worse ...
> 
> For me it's Ok that the DRM drivers don't use 2d acceleration (as it is today
> with the arguments mentioned multiple times).
> But the patches broke existing fbdev acceleration which is available by
> the fbdev drivers. That's a big regression from point of fbdev.

Keeping it alive and working will be a tough challenge.  2d acceleration
is a thing of the past and the number of people which are able and
willing to put effort into supporting it will only decline.  It has been
a problem for a while already, basically it was dropped due to lack of
support ...

take care,
  Gerd

