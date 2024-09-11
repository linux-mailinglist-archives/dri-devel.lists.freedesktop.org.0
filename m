Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DEE9751AA
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 14:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A42C210E181;
	Wed, 11 Sep 2024 12:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Rgnrr0z6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D8410E181
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 12:15:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 34F7D4000C;
 Wed, 11 Sep 2024 12:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1726056908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PdhTEPQQk02wc+pOBZoyGtVA8GtF9vfPKRysImY6ZaU=;
 b=Rgnrr0z6fQ4IXXpeAwlVOJw9IQV5uo3s7kGx7MGqe0XxySTghtLtsUwwyffeG5+kAfPN1w
 XwYpwJ7F5C+qWnGh9gDEFQiNd+T3TGBQHG6uSThhdbgeZSwFbljyu8VylR9GhXVHHuurq/
 DNuHyzKtx7pdxEp7gm8FkHcBN8sIqYkedYiuDyAeVp/qqsBAbuDXyRvnFI/tRM0NwOigeW
 6K/BgHyLFKrBRuIXtOUCo28AMImZ+m022ddbE9jnnZspRRmyh8TwBWR+rBvFN9NBAx2vfU
 vtSndq4owKg6nn750jcrjJpOs//P0ZNWSfD5mO7Q7unTt5D4QMOGt3tGJC1lKw==
Date: Wed, 11 Sep 2024 14:15:05 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Maira Canal <mairacanal@riseup.net>
Cc: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, sean@poorly.run,
 thomas.petazzoni@bootlin.com, linux-kernel@vger.kernel.org,
 seanpaul@google.com
Subject: Re: [PATCH] MAINTAINERS: Add myself as VKMS Maintainer
Message-ID: <ZuGJyfhkQe93jKlz@louis-chauvet-laptop>
Mail-Followup-To: Maira Canal <mairacanal@riseup.net>,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, sean@poorly.run,
 thomas.petazzoni@bootlin.com, linux-kernel@vger.kernel.org,
 seanpaul@google.com
References: <20240910-vkms-maintainer-v1-1-e7a6c7a4ae71@bootlin.com>
 <68da3932-10ab-4001-a978-f0f54034a64d@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68da3932-10ab-4001-a978-f0f54034a64d@riseup.net>
X-GND-Sasl: louis.chauvet@bootlin.com
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

Le 10/09/24 - 15:57, Maira Canal a écrit :
> On 9/10/24 12:10, Louis Chauvet wrote:
> > I've been actively working on VKMS to provide new features and
> > participated in reviews and testing. To help Maìra with her work, add
> > myself as co-maintainer of VKMS.
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> Acked-by: Maíra Canal <mairacanal@riseup.net>
> 
> Please, check the procedures to apply for commit rights in drm-misc and
> apply it. This way you will be able to commit your patches.

Thanks for your support!

I just checked the rules to become a commiter, and it requires at least 10 
non-trivial patches, so I can't apply right now.

Few months ago, you seemed interested in merging few patchs from [1] ([2] 
is the last iteration and can be applied on drm-misc/drm-misc-next, and 
I just ran few igt tests, they pass), can you do it so I can apply to be a 
commiter? Thanks a lot!

[1]: https://lore.kernel.org/all/c83255f4-745e-43e6-98e0-2e89c31d569a@igalia.com/
[2]: https://lore.kernel.org/all/20240809-yuv-v10-0-1a7c764166f7@bootlin.com/ 

> Thanks for volunteering!
> 
> Best Regards,
> - Maíra
> 
> > ---
> > Hi everyone,
> > 
> > This series [1] has been waiting for a while now, it was proposed first in
> > February. The first iterations had few reactions (thanks to Arthur, Pekka,
> > Maìra, ...), but since v8 (in May) no major issues were reported, Maìra
> > seemed satisfied, and only minor cosmetic changes were reported. Two other
> > series ([2] and [3]), that I submitted first in May, did not have receive
> > any reactions.
> > 
> > In addition, there is also some significant addition to VKMS being
> > proposed, such as ConfigFS support, and without a clear maintainer having
> > the time to review and approve these changes, these changes have very
> > little changes to get in.
> > 
> > VKMS is not a fundamental driver for "normal" Linux users, but I had some
> > feedback from userspace developpers that VKMS could be a very good testing
> > tool if only it had more features (I think P0xx formats were asked to
> > test HDR for example). This could also help to detect issues in DRM core
> > by emulating a wide range of configurations.
> > 
> > I believe the only active maintainer is Maìra, but as she's mentioned before,
> > she doesn't have much time to work on VKMS. So, I'd like to volunteer as a
> > maintainer. I have plenty of time to dedicate to VKMS.
> > 
> > I hope I've gained enough understanding of VKMS to be helful with this role.
> > I am eager to move forward and improve this subsystem. I've also talked to Sean
> > about this, and he agrees that it would be good if I could commit code to
> > drm-misc.
> > 
> > [1]: https://lore.kernel.org/all/20240809-yuv-v10-0-1a7c764166f7@bootlin.com/
> > [2]: https://lore.kernel.org/all/20240814-b4-new-color-formats-v2-0-8b3499cfe90e@bootlin.com/
> > [3]: https://lore.kernel.org/all/20240814-writeback_line_by_line-v2-0-36541c717569@bootlin.com/
> > ---
> >   MAINTAINERS | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 10430778c998b57944c1a6c5f07d676127e47faa..62f10356e11ab7fa9c8f79ba63b335eb6580d0a8 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7340,6 +7340,7 @@ DRM DRIVER FOR VIRTUAL KERNEL MODESETTING (VKMS)
> >   M:	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> >   M:	Melissa Wen <melissa.srw@gmail.com>
> >   M:	Maíra Canal <mairacanal@riseup.net>
> > +M:	Louis Chauvet <louis.chauvet@bootlin.com>
> >   R:	Haneen Mohammed <hamohammed.sa@gmail.com>
> >   R:	Daniel Vetter <daniel@ffwll.ch>
> >   L:	dri-devel@lists.freedesktop.org
> > 
> > ---
> > base-commit: da3ea35007d0af457a0afc87e84fddaebc4e0b63
> > change-id: 20240910-vkms-maintainer-7b3d2210cc1b
> > 
> > Best regards,
