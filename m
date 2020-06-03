Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF2E1ECA1E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 09:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74CCA6E4CD;
	Wed,  3 Jun 2020 07:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 578 seconds by postgrey-1.36 at gabe;
 Wed, 03 Jun 2020 00:30:03 UTC
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au
 [98.124.60.144])
 by gabe.freedesktop.org (Postfix) with ESMTP id EE20E88E7E
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 00:30:03 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id 68E8629AF2;
 Tue,  2 Jun 2020 20:20:22 -0400 (EDT)
Date: Wed, 3 Jun 2020 10:20:21 +1000 (AEST)
From: Finn Thain <fthain@telegraphics.com.au>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v2 1/2] video: fbdev: amifb: add FIXME about dead APUS
 support
In-Reply-To: <20200602161225.GJ23230@ZenIV.linux.org.uk>
Message-ID: <alpine.LNX.2.22.394.2006031002550.8@nippy.intranet>
References: <CGME20200504232908eucas1p296927bc7c736ad924cefaea9a546459d@eucas1p2.samsung.com>
 <b1cf967015c5beafa475aaa30d8e21a58caff870.camel@perches.com>
 <767d36ff-22ec-8136-7ebc-1d9d0d3ac98d@samsung.com>
 <CAMuHMdWac+YE3qr0CTepn5K24tGZq0VHuQDGg-yUOHW1rJDbbg@mail.gmail.com>
 <20200602161225.GJ23230@ZenIV.linux.org.uk>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 03 Jun 2020 07:04:29 +0000
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2 Jun 2020, Al Viro wrote:

> I have done that on aranym (which is how I'd been doing all testing for 
> e.g. signal-related m68k patches) and I've seen references to some 
> out-of-tree qemu variant doing quadra, but nothing for amiga 
> emulators...
> 

Laurent Vivier's Quadra 800 emulation is no longer out of tree. It 
appeared in QEMU v4.2.0 and ethernet support was stabilized in QEMU 
v5.0.0.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
