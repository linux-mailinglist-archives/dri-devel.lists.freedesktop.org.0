Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 693D1700B2F
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 17:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D75F10E6D3;
	Fri, 12 May 2023 15:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 388 seconds by postgrey-1.36 at gabe;
 Fri, 12 May 2023 15:16:56 UTC
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C60610E6D3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 15:16:56 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 4D7391C0ABB; Fri, 12 May 2023 17:10:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1683904224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m+tuCGTpWa1yn/iDsjxKmoSoh9Y6nyn25fuTmBqNyqo=;
 b=YPWarCic8gSCff9zOS5ukcu0QErdCHhYcqvd+5PE0F9EtHhoeKtCfXuMAJVYrr9oUIDjVo
 uavrz8JnHpV2uxRg69NUiExtZeDf75S3H4ltUN4Ez8A5qnJ7IolKBLFZHqkJvjkn99ljuD
 N9c0F8PZbOMGvnQW2qcwM3RpXEktfKg=
Date: Fri, 12 May 2023 17:09:57 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH] video/aperture: fix typos
Message-ID: <ZF5WxRrQwVjUuD6z@localhost>
References: <20230404040101.2165600-1-suijingfeng@loongson.cn>
 <0ad03743-0224-b154-a149-e3e4d54b252d@suse.de>
 <87355fex1f.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87355fex1f.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Sui Jingfeng <suijingfeng@loongson.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>, Li Yi <liyi@loongson.cn>,
 Helge Deller <deller@gmx.de>, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

> > Am 04.04.23 um 06:01 schrieb Sui Jingfeng:
> >>   EFI FB, VESA FB or VGA FB etc are belong to firmware based framebuffer
> >>   driver.
> >
> 
...
> I fixed that before applying, also removed the "are" in the sentence
> above, since it sounded off and repharsed subject line as "Fix typos
> in comments".

I seem to remember that 'all your bases are belong to us' is an old
meme, but that was probably not intentional here.

Best regards,
						Pavel

-- 
