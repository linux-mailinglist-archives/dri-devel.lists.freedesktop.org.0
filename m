Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEB61B2CBD
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 18:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F2089F49;
	Tue, 21 Apr 2020 16:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1710E89F49
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 16:32:38 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 66471823;
 Tue, 21 Apr 2020 16:32:37 +0000 (UTC)
Date: Tue, 21 Apr 2020 10:32:36 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] dma-buf: Couple of documentation typo fixes
Message-ID: <20200421103236.4b64155c@lwn.net>
In-Reply-To: <20200421123837.GZ3456981@phenom.ffwll.local>
References: <20200420074115.23931-1-galpress@amazon.com>
 <20200420170059.5a42693e@lwn.net>
 <20200421123837.GZ3456981@phenom.ffwll.local>
Organization: LWN.net
MIME-Version: 1.0
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
Cc: linux-media@vger.kernel.org, Gal Pressman <galpress@amazon.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Apr 2020 14:38:37 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Mon, Apr 20, 2020 at 05:00:59PM -0600, Jonathan Corbet wrote:
> > On Mon, 20 Apr 2020 10:41:15 +0300
> > Gal Pressman <galpress@amazon.com> wrote:
> >   
> > > Fix a couple of typos: "as" -> "has" and "int" -> "in".
> > > 
> > > Signed-off-by: Gal Pressman <galpress@amazon.com>  
> > 
> > Applied, thanks.  
> 
> Also applied to drm-misc-next, the dma-buf stuff is maintained as part of
> drm. And maybe I actually get around to doing the doc polish for all
> things dma-buf that I've been promised to do since months :-)

I actually looked for it in linux-next before applying, but didn't (and
don't) see it there...?

Thanks,

jon
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
