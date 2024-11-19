Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C736B9D2B15
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 17:37:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEEF810E68D;
	Tue, 19 Nov 2024 16:37:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 448 seconds by postgrey-1.36 at gabe;
 Tue, 19 Nov 2024 16:37:24 UTC
Received: from smtp.dudau.co.uk (dliviu.plus.com [80.229.23.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAACA10E689;
 Tue, 19 Nov 2024 16:37:24 +0000 (UTC)
Received: from mail.dudau.co.uk (bart.dudau.co.uk [192.168.14.2])
 by smtp.dudau.co.uk (Postfix) with SMTP id B9E3A4172F4C;
 Tue, 19 Nov 2024 16:29:53 +0000 (GMT)
Received: by mail.dudau.co.uk (sSMTP sendmail emulation);
 Tue, 19 Nov 2024 16:29:53 +0000
Date: Tue, 19 Nov 2024 16:29:53 +0000
From: Liviu Dudau <liviu@dudau.co.uk>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, hjc@rock-chips.com,
 heiko@sntech.de, andy.yan@rock-chips.com,
 dim-tools@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PULL] drm-misc-next
Message-ID: <Zzy9Afen1GhV/DHm@bart.dudau.co.uk>
References: <deeef745-f3fb-4e85-a9d0-e8d38d43c1cf@linux.intel.com>
 <20241118150816.GA3706736@thelio-3990X>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241118150816.GA3706736@thelio-3990X>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 18, 2024 at 08:08:16AM -0700, Nathan Chancellor wrote:
> On Thu, Oct 31, 2024 at 02:41:38PM +0100, Maarten Lankhorst wrote:
> > Cristian Ciocaltea (3):
> >       drm/rockchip: Add basic RK3588 HDMI output support
> 
> Can someone please apply [1] to resolve a link time failure seen with
> 32-bit clang builds? I am still seeing it in -next and my ping on the
> patch does not appear to be seen...
> 
> [1]: https://lore.kernel.org/20241018151016.3496613-1-arnd@kernel.org/
> 
> Cheers,
> Nathan

Pushed to drm-misc-next.

Best regards,
Liviu


-- 
Everyone who uses computers frequently has had, from time to time,
a mad desire to attack the precocious abacus with an axe.
       	   	      	     	  -- John D. Clark, Ignition!
